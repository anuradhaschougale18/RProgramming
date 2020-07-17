Age<-c(56,34,67,33,25,28)
Weight<-c(78,67,56,44,56,89)
Height<-c(165, 171,167,167,166,181)

BMI_df<-data.frame(Age,Weight,Height)
BMI_df
# row wise sum up of dataframe using apply function in R
apply(BMI_df,1,sum)
# column wise sum up of dataframe using apply function in R
apply(BMI_df,2,sum)
# column wise mean of dataframe using apply function in R
apply(BMI_df,2,mean)

#lapply function in R:
#lapply function takes list, vector or Data frame  as input and 
#returns only list as output.
lapply(BMI_df, mean)

#Sapply function in R
sapply(BMI_df, mean)

#tapply():
#tapply() is a very powerful function that lets you break a vector into pieces
#and then apply some function to each of the pieces.
View(mtcars)
str(mtcars)
str(mtcars$cyl)
levels(as.factor(mtcars$cyl))
tapply(mtcars$mpg,mtcars$cyl,mean)


















#vapply function in R:
#vapply function in R is similar to sapply,
#but has a pre-specified type of return value, so it can be safer (and sometimes faster) to use.
# vapply function in R
vapply(BMI_df, sqrt,numeric(6))
