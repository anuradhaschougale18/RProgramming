# Joins
df1 = data.frame(customerid = c(1:6), 
              product = c(rep("mobile", 3),rep("Radio", 3)))
df2 = data.frame(customerid = c(2, 4, 6,8), 
                 state = c(rep("kar", 2),rep("mum", 2)))
names(df1)
names(df2)
# inner join or merge
merge(df1,df2,by="customerid")

#Outer join: 
merge(x = df1, y = df2, by = "customerid", all = TRUE)

#Left outer
merge(x = df1, y = df2, by = "customerid", all.x = TRUE)

#Right outer
merge(x = df1, y = df2, by = "customerid", all.y = TRUE)


## merging
product=data.frame(loan_account_no = c(234,235,236,237,238),
                      interest = c(11,22,33,44,55),
                      data = 1:5)
demo= data.frame(loan_account_no = c(234,235,236,4,5), 
                  income = c(66,77,88,99,99),
                  data = 1:5)

merge(product, demo, by = "loan_account_no") 

#Create Vector objects
city = c("Tampa","Seattle","Hartford","Denver")
state = c("FL","WA","CT","CO")
zipcode = c(33602,98104,061061,80294)

#Combine above 3 vectors into one dataframe
addresses = data.frame(city,state,zipcode)
View(addresses)

#Cretae another data frame using same columns
city = c("Lowry", "Charlotte")
state = c("CO","FL")
zipcode = c(80230,33498)

new.addresses = data.frame(city,state,zipcode)
print(new.addresses)

#rbind : append rows
#rbind : Combines or appends data from both data frames
# Same columns :primary need
all.addresses = rbind(addresses,new.addresses)
print(all.addresses)
names(all.addresses)


## renaming the column name
my_data = iris
names(my_data)
names(my_data)[names(my_data) == "Sepal.Length"] = "s_length"
names(my_data)[names(my_data) == "Sepal.Width"] = "spl_width"
names(my_data)
names(iris)

#Missing Value
y= c(1,2,3,NA)
is.na(y)

x= c(1,2,NA,3)
mean(x)

#To remove missing values
mean(x, na.rm = TRUE)

# To remove all Missing value records
newdata = na.omit(x)


#Replacing Missing value
x = c(1,2,3,NA,6,7,8,NA,NA)
library(gtools)
na.replace(x, 999)

#To replace Mv by mean

Math = c(88,95,85,NA,67,98,NA,67)
mean(Math)
median(Math)
Math[is.na(Math)] # to check mvs
Math[!is.na(Math)] # to check not mv
mean(Math, na.rm = TRUE)
mean(Math[!is.na(Math)])
median(Math[!is.na(Math)]) 
Math[is.na(Math)] = mean(Math[!is.na(Math)])
Math




