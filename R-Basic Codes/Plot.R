
##################### Pie charts #####################
# create the data for graph
x<-c(44,12,39,53)
labels<-c("california","Paris","Moscow","Mumbai")
# plot the chart
pie(x,labels)


# create the data for graph
x<-c(44,12,39,53)
labels<-c("california","Paris","Moscow","Mumbai")
pct<-round(x/sum(x)*100)
lbls<-paste(labels,pct)
lbls

lbls2<-paste(lbls,"%",sep = "")
lbls2

pie(x,labels = lbls2,
    col = rainbow(length(lbls2)),
    main = "city_Pie_chart")


##################### bar charts #####################

# 1) simple Bar chart

h<-c(25,12,43,7,51)
barplot(h)

h<-c(20,12,70,55)
m<-c("Delhi","Mumbai","Bangalore","Pune")
barplot(h,
        xlab = "Month",
        ylab = "happy index",
        col = "red",
       names.arg = m, # name plotted below each bar 
        main = "Sales of India",
        border = "black")
#, horiz = TRUE) # if want horizontal


# 2) Stacked bar chart
table(mtcars$vs)
counts<-table(mtcars$vs,mtcars$gear)
counts
barplot(counts,
        main="car distribition by gears & vs",
        xlab = "number of gear",
        col = c("darkblue","red"),
        legend=rownames(counts))
        
# Grouped bar chart
counts<-table(mtcars$vs,mtcars$gear)
counts
barplot(counts,
        main="car distribition by gears & vs",
        xlab = "number of gear",
        col = c("darkblue","red"),
        legend=rownames(counts),beside = TRUE )

##################### Histogram charts #####################

# plotting distribution of Airpassengers data
hist(AirPassengers,
     main = "histogram for Air Passenger",
     xlab = "Passengers",
     border = "red",
     col = "blue",
     xlim = c(100,700)
     ,breaks = 5)# break is used to get the number of each bar 
##################### Boxplot #####################
boxplot(mtcars$hp)
View(mtcars)

boxplot(hp ~ cyl,
        data = mtcars,
        xlab= "number of cylinder",
        ylab="miles per gallon",
        main="mileage data")
##################### Scatter plot #####################
plot(mtcars$wt,mtcars$mpg)

##################### Line plot #####################
v<-c(12,1,25,83,43)
plot(v,type = "o",col="red")
  
v<-c(12,14,28,5,44)
t<-c(15,8,8,10,13)
plot(v,type = "o",col="red")
lines(t,type = "o",col="blue")
