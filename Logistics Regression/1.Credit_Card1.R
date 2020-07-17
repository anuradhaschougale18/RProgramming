credit<-read.csv("F:/R and Data Science/Logistics Regression/Credit card case study/credit_Card1.csv")

############################## Structure of data type#############################
View(credit)
str(credit)

############################## Header and Univariate Analysis#############################
names(credit)
attach(credit)
summary(credit)

############################## Data Conversion #############################
credit$target<-as.factor(credit$target)
table(credit$target)
credit$Dummy<-as.factor(ifelse(credit$Gender=='M',1,0))
credit$Gender<-NULL

str(credit)

############################### simple Logistics Regression #############################
logit <- glm(target ~ balance, data=credit,family='binomial')
summary(logit)
anova(logit,test='Chisq')

############################### Prediction try with  2000 #############################
testing<-data.frame(balance=2000)
testing.probs <-predict(logit, testing, type='response')
testing.probs


############################### Multiple Logistic Regression #############################
set.seed(45)
library(caret)
Train <- createDataPartition(credit$target, p=0.7, list=FALSE)
training <- credit[ Train, ]
testing <- credit[ -Train, ]

############################## Data Pre-Processing #############################
summary(training)

############################## Missing Value #############################
sapply(training,function(x) sum(is.na(x)))

##################### Identifcation & Treatment of  Outlier############################# 

###### Identify outlier of Income Variable #####
boxplot(training$income)

###### Identify &  Treatment of outlier for balance #####
par(mfrow=c(1,2))
boxplot(training$balance)
summary(training$balance)

#### Winsorizing technique #####
upper<-1162+1.5*IQR(training$balance);upper
training$balance[training$balance > upper]<-upper
boxplot(training$balance)
summary(training$balance)

############# Model Building all variable ##########################
logit <- glm(target ~ income + balance + Dummy,family='binomial',
             data=training)
summary(logit)

###################### Variable Selection Method #####################  
#relevel(Pclass,ref = 2)
logit2 <- step(glm(target ~ income + balance +Dummy,
                   family='binomial', data=training),direction = "both")
summary(logit2)
anova(logit2,test='Chisq')

###################### Accuracy of model ##################### 
Acc(logit2)

##################### # odds Ratio ##################### 
exp(coef(logit2))

##################### ## Prediction on testing data ##################### 
testing$probs <-predict(logit2, testing, type='response')
testing$Predict<-as.factor(ifelse(testing$probs>0.70,1,0))

###################### Accuracy of testing data  #####################
library(e1071)
table(testing$Predict, testing$target)
confusionMatrix(testing$Predict,testing$target,positive = "1")

######################## Roc Curve  #####################
library(ROCR)
# Make predictions on training set
predictTrain = predict(logit2,testing, type="response")
# Prediction function
ROCRpred = prediction(predictTrain, testing$target)
# Performance function
ROCRperf = performance(ROCRpred, "tpr", "fpr")
# Plot ROC curve
plot(ROCRperf)

######################### AUC #####################

library(ROCR)
pred = prediction(testing$probs, testing$target)
as.numeric(performance(pred, "auc")@y.values)


###################### Mathematical calculation check  #####################

# To get Coefficent of model(B0,B1,B2)
logit2$coefficients

# Manual Prediction for Male
Z=-11.648609428+0.005820372*2113.01902+0.836563545*1
a<-exp(-Z)
b<-1+a
Y<-1/b
Y


# Manual Prediction for Female
Z=-11.648609428+0.005820372*2261.84816	+0.836563545*0
a<-exp(-Z)
b<-1+a
Y<-1/b
Y

