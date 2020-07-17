library (randomForest)
library(tree)
library(MASS)

################### Importing data ##################
Churn<-read.csv("F:/R and Data Science/Random Forest/churn.csv")

Churn <- Churn[-1]
Churn$tenure<-as.numeric(Churn$tenure)
Churn$SeniorCitizen<-as.numeric(Churn$SeniorCitizen)
##############333#Data Partition#789#######################
library(caret)
split <- createDataPartition(y=Churn$Churn, p=0.7, list=FALSE)
training <- Churn[split,]
testing <- Churn[-split,]

################ Random Forest Model ##################
## manually specifying no. tree should to be grown

Model1=randomForest(Churn~.,data=training,mtry=5,importance=TRUE,
                    na.action=na.roughfix)
Model1

########### Prediction on Training data ##########
Acc=(3284+683)/(3284+683+338+626)*100
Acc

########## Prediction on Testing data ##########
testing$Predicted=predict(Model1,testing,type ="class")
library(caret)
confusionMatrix(testing$Churn,testing$Predicted,positive = "Yes")
