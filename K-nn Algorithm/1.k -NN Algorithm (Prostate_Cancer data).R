############## Data Import #######################

prc<-read.csv("F:/R and Data Science/Knn/Prostate_Cancer.csv")

############## Data type and column names  #######################

str(prc)
names(prc)
table(prc$diagnosis_result)  # it helps us to get the numbers of patients

############## Removing irreleavent column and  #######################

prc <- prc[-1]  #removes the first variable(id) from the data set


#prc$diagnosis <- factor(prc$diagnosis_result, levels = c("B", "M"), labels = c("Benign", "Malignant"))
#prop.table(table(prc$diagnosis))*100  # it gives the result in the percentage form rounded of to 1 decimal place( and so it's digits = 1)

############## Data Normalization  #######################
# it bring every call under the range of to 1

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }

summary(prc$radius)

prc_n <- as.data.frame(lapply(prc[2:9], normalize))

summary(prc_n$radius)
summary(prc_n$texture)

##############333#Data Partition#789#######################
prc_train <- prc_n[1:65,]
prc_test <- prc_n[66:100,]
prc_train_labels <- prc[1:65, 1]
prc_test_labels <- prc[66:100, 1]


############## Model Building(method 1 when you take a sqrt of n for k) #######################

library(class)
# Manual method k =10 is knn value 
prc_test$prc_test_pred <- knn(train = prc_train, test = prc_test,cl = prc_train_labels, k=10)

############## Model Performance on testing data #######################
library(e1071)
library(caret)
confusionMatrix(prc_test$prc_test_pred,prc_test_labels)




############## method 2 using k fold cross validation for value of k ####################### 

##############333#Data Partition#789#######################
set.seed(123)
library(caret)
Train <- createDataPartition(prc$diagnosis_result, p=0.7, list=FALSE)
training <- prc[ Train, ]
testing <- prc[ -Train, ]

############## Model Building ##############
# cv= k fold cross validation and number (k)=10 
# tunelength means different value of k and try 
# if tunelength is 15 then different 15 k values 

#method = "center"(x-mean(x)) 
#method = "scale" (x-mean(x))/standard deviation.
library(e1071)
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)

knn_fit <- train(diagnosis_result ~., data = training, method = "knn",
                 trControl=trctrl,
                 preProcess = c("center", "scale"),
                 tuneLength = 15)

############ To get the Best Model ############
knn_fit
plot(knn_fit)
############## Model Prediction testing data #######################

testing$predicted <- predict(knn_fit, newdata = testing)

############## Model Performance on testing data #######################

confusionMatrix(testing$predicted, testing$diagnosis_result )

