#outlier treatment 

## outlier replacement using box plot and quantile strategy
old<-mtcars
mtcars<-mtcars

########### Capping and Flooring Technique
library(scales)

summary(mtcars$hp)
boxplot(mtcars$hp)

mtcars$hp <- squish(mtcars$hp, round(quantile(mtcars$hp, c(0.05, 0.95))))

summary(mtcars$hp)
boxplot(mtcars$hp)

rm(mtcars)

## outlier replacement using Winsorization Technique
mtcars<-mtcars

summary(mtcars$hp)
par(mfrow=c(1,2))
boxplot(mtcars$hp)

#creating upper limit value
upper<-180+1.5*IQR(mtcars$hp)
upper

#creating lower limit value
lower<-96.5-1.5*IQR(mtcars$hp)
lower

# upper limit replacement
mtcars$hp[mtcars$hp > upper]<-upper
summary(mtcars$hp)
boxplot(mtcars$hp)

# lower limit replacement
mtcars$hp[mtcars$hp < lower]<-lower
summary(mtcars$hp)

rm(mtcars)

############# Outlier treatment by Mean,Median,Mode & Row Deletion #########
mtcars<-mtcars

summary(mtcars$hp)
boxplot(mtcars$hp)

### Row Deletion
abc<-subset(mtcars,mtcars$hp<=305.25)

boxplot(abc$hp)

mean(abc$hp)

######### Replace by mean
mtcars$hp <- (ifelse(mtcars$hp > 305.25,mean(abc$hp),mtcars$hp))
summary(mtcars$hp)
boxplot(mtcars$hp)

rm(mtcars)

## Manual code of capping and flooring or winsorization 
outputQuantile <- quantile(faithful$waiting, seq(0,1,by=0.05))
outputQuantile

qn = quantile(faithful$waiting, c(0.01, 0.99), na.rm = TRUE)

df = within(faithful,{ waiting=ifelse(waiting < qn[1],qn[1],waiting)
waiting = ifelse(waiting > qn[2], qn[2], waiting)})
summary(faithful)

summary(df)







# converting outlier to na (MISSING VALUE) THEN WITH MEAN
df<-read.csv(file="F:/R and Data Science/Basic Statistics/myworkbook.csv")
summary(df)
str(df)
df1<-df
#Ranges
temp_range <- c(-15, 45)
wind_range <- c(0, 15)
humidity_range <- c(0, 100)

df$temp1[df$temp1 < temp_range[1] | df$temp1 > temp_range[2]] <- NA
df$temp2[df$temp2 < temp_range[1] | df$temp2 > temp_range[2]] <- NA
df$wind[df$wind < wind_range[1] | df$wind > wind_range[2]] <- NA
df$humidity[df$humidity < humidity_range[1] | df$humidity >
              humidity_range[2]] <- NA
summary(df1)
summary(df)

