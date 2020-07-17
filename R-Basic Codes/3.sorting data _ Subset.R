# sorting examples using the abc dataset
data()
abc<-mtcars
names(abc)
View(abc)
str(abc)
# it is used to fixed dataset
mpg
attach(abc)
mpg
# data visual
head(abc)
head(abc,10)
tail(abc)

summary(abc)
summary(abc$mpg)

abc<-mtcars

## selcting cell
abc[1,1]

# Selecting Row 
a<-abc[1,]

a<-abc[1:5,]
a
a<-abc[c(1,4,10),]

# Selecting Row 
a<-abc[,1]
a
a<-abc[,1:5]
a<-abc[,c(1,3,5)]
a

### Selecting row and column 
a<-abc[1:3,2:5]
a
a<-abc[c(1,4,10),c(1,2,4)]
a

## Column by its name 
a<-abc[,"mpg"]
a<-abc[,c("mpg","hp")]

# sort by mpg
newdata <- abc[order(mpg),] 

# sort by mpg and cyl
#newdata <- abc[order(mpg, cyl),]

#sort by mpg (ascending) and cyl (descending)
newdata <- abc[order(-mpg),] 

detach(abc)

#Subsetting Data
myvars <- c("mpg", "cyl", "disp")

newdata1 <- abc[myvars]

newdata2 <- abc[c(1,5:10)]
##Dropping Variable 
#Excluding (DROPPING) Variables

# delete one variables
newdata$mpg <- NULL
newdata<-abc

# exclude 3rd and 5th variable 
newdata1 <- newdata[c(-3,-5)]

# using subset function 
newdata2 <- subset(abc, mpg >= 20 & wt < 10, 
                  select=c(gear, qsec))

