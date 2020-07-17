################# Linear Regression #################################

################### Importing data ##################
library(openxlsx)
Employee<-read.xlsx("F:/R and Data Science/Refresher in R/hr_dataset.xlsx")
str(Employee)

############# Data Conversion
Employee$Gender <-as.numeric(as.factor(Employee$Gender))
Employee$JobRole <-as.numeric(as.factor(Employee$JobRole))
Employee$EducationField <-as.numeric(as.factor(Employee$EducationField))


hist(Employee$MonthlyIncome)
boxplot(Employee$MonthlyIncome)


##############333#Data Partition#789#######################
set.seed(231)
library(caret)
train<-createDataPartition(Employee$MonthlyIncome,p=0.7,list=FALSE)
training<-Employee[train,]
testing<-Employee[-train,]

############ Correlation ################
cor(training)

############## Enter  method ##################
model <- lm(MonthlyIncome~., data = training)
summary(model)

############## Both method ###############

model3 <- step(lm(MonthlyIncome~., data = training),direction = "both")
summary(model3)
anova(model3)

# Variance Inflation Factor
library(car)
vif(model3)

############ Assumptions of Linear Regression ###############

par(mfrow=c(2,2))
plot(model3)
hist(model3$residuals)

############ Prediction on Testing data
testing$log_Predicted<-predict(model3,testing)

