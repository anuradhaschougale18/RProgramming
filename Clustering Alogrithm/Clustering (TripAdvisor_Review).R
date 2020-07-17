########## Import data #################3
trip_advisor<-read.csv("F:/R and Data Science/Clustering/Feedback data/tripadvisor_review.csv")

############# Data type & Data Behaviour #####################
str(trip_advisor)

######### Removing unnecessay column ############
trip_advisor_f<- trip_advisor[-c(1)]

summary(trip_advisor_f)


############### hierarchical Clustering ################ 
dist.res=dist(trip_advisor_f,method = "euclidean")

hc<- hclust(dist.res,method="complete")

########### Visulize of hclust ###############3

plot(hc,labels=FALSE,hang=-1)

################### K-means clustering ###################

library(vegan)
library(permute)
library(lattice)
library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dplyr)
library(dendextend) # for comparing two dendrograms
library(NbClust)

rm(hc,trip_advisor,trip_advisor_f,dist.res)

########## Import data #################3
trip_advisor<-read.csv("F:/R and Data Science/Clustering/Feedback data/tripadvisor_review.csv")

######### Removing unnecessay column ############
trip_advisor_f<- trip_advisor[-c(1)]

summary(trip_advisor_f)

############# K-Means Model ####################33
k2 <- kmeans(trip_advisor_f, centers = 5, nstart = 25)
str(k2)       
k2
fviz_cluster(k2, data = trip_advisor_f)

######### Determining Optimal Clusters before using model we used elbow chart ########## 
mydata <- trip_advisor_f


#Determine the optimal cluster size based on within sum of squares
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))

for (i in 2:15) wss[i] <- sum(kmeans(mydata,centers=i)$withinss)

#Plot the elbow chart to determine optimal cluster
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares",col="mediumseagreen",pch=12)


###Run the kmeans algorithm to generate the clusters
k1<-kmeans(trip_advisor_f, 2)

k1

###See the clustering results
###Fetch the group means for each variable
k1$centers

###Fetch size/n of obs for the groups
k1$size

###Fetch the cluster for each obs
k1$cluster

trip_advisor$cluster=k1$cluster

View(trip_advisor)

