#Objective: To predict whether a employee will exit or not using Decision Tree


################### Importing data ##################
Employee<-read.csv("C:/Users/ITVEDANT-07/Desktop/employee.csv")

################### To check Data Type ##################
str(Employee)
names(Employee)

#################### Just taking a subset of column for model building ##################
Employee = subset(Employee, select = -c(7,9,10,27,22))
names(Employee)
str(Employee)

################## Data Conversion#############################

# Taken All integar variable &  convert to numeric
Employee1 = subset(Employee, select = -c(2,3,5,7,9,13,15,19))
names(Employee1)
str(Employee1)
Employee1<-data.frame(apply(Employee1, 2, as.numeric))
str(Employee1)

# Taken all categorical variable
Employee2 = subset(Employee, select = c(2,3,5,7,9,13,15,19))
str(Employee2)

# combined Numeric &categorical Variable 
Employee<-data.frame(Employee2,Employee1)
str(Employee)
names(Employee)

##############333#Data Partition#789#######################
set.seed(231)
library(caret)
train<-createDataPartition(Employee$Attrition,p=0.7,list=FALSE)
training<-Employee[train,]

testing<-Employee[-train,]

############ To Verified the Partition
prop.table(table(Employee$Attrition))
prop.table(table(training$Attrition))
prop.table(table(testing$Attrition))

################# Building Model & Plotting Model#################
library(rpart)
Model =rpart(Attrition~.,data=training,method = "class")

             #            , parms = list(prior = c(.84,.16), split = "gini"))
library(rpart.plot)
rpart.plot.version1(Model, main = "Model Before Pruning",
                    type = 5, extra = 1,cex = 0.5,tweak =1.5,varlen = 0)
  #,faclen=0) # to get full name 

# type is to get variable name in nodes
# extra is used to get no. of observatioin or 6 to get % 
# Cex text size of entry plot 
# tweak to increase the size of nodes label & cut off point 
# Varlen is used to get full name of variable in nodes  
# faclen is used to get full name of levels in branches

# Prediction on Training data 
training$Predicted=predict (Model,training,type ="class")
library(caret)
confusionMatrix(training$Predicted,training$Attrition,positive = "Yes")

# Doing Pre-Pruning 
c<-rpart.control(minsplit =10, minbucket = 5, maxdepth = 3)
training$Predicted<-NULL

# Re-Building Model & Plotting Model
tune_fit <- rpart(Attrition~.,data=training,method ="class", control =c)
rpart.plot.version1(tune_fit, main = "Model After Pruning",
                    type = 5, extra = 1,cex = 0.5,tweak =2.2,
                    faclen = 0,varlen = 0)


# Prediction on Training data 
training$Predicted=predict (tune_fit,training,type ="class")
library(caret)
confusionMatrix(training$Attrition,training$Predicted,positive = "Yes")


# Prediction on Testing data 
testing$Predicted=predict(tune_fit,testing,type ="class")
library(caret)
confusionMatrix(testing$Predicted,testing$Attrition,positive = "Yes")


