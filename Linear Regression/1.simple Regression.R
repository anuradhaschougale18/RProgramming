
#data<-read.csv("F:/R and Data Science/Simpel _ Multiple Regression/Volcano.csv")
data<-faithful
View(data)
attach(data)     # attach the data frame 
names(data)
str(data)
head(data,10)
input<-data

############ EDA#############

#######Univariate Analysis############
# behaviour and missing value and univariate analysis

summary(data)
## another way missing value--------
sapply(data, function(x) sum(is.na(x)))

# Outlier Treatment 
boxplot(data$eruptions)
boxplot(data$waiting)

### scatter plot and Correlation
plot(waiting,eruptions) 
plot(eruptions~waiting) 
cor(data)

### Regression Model
Model = lm(eruptions ~ waiting , data= input)
summary(Model)
#anova(Model)
### Assumption of regression Model
## below command will plot all the assumpution plot in 2*2 format 
par(mfrow=c(2,2))
plot(Model)

library(lmtest)
dwtest(Model)
hist(Model$residuals)

### linearity
plot(eruptions~waiting) 

# Prediction of 80 waiting
y=-1.87402+0.07563*80
y

#Predicton Method on entire testing data set  
newdata = data.frame(waiting=80)
predict(Model, newdata) 

newdata = data.frame(waiting=c(80,100,120))
predict(Model, newdata) 

## JUST TO CHECK MATHEMATICALLY of linear Model
input$Fitted_value<-Model$fitted.values
input$Residual<-Model$residuals
sum(input$Residual)

# Best Fit Line
plot(eruptions~waiting,data = input) 
abline(Model,col="red")






 lor 

coeffs = coefficients(Model); coeffs 
waiting=80
duration = coeffs[1] + coeffs[2]*waiting 
duration

or 

y=-1.87402+0.07563*80
y


#####task
model<-read.csv(file.choose())
attach(model)
plot(INCOME,SAVINGS)
cor(model)
linearmodel = lm(SAVINGS ~ INCOME , data = model)
linearmodel
summary(linearmodel)
par(mfrow=c(2,2))
plot(linearmodel)
# predict in mathematical way 
y=-10991+0.2970*256413
y


