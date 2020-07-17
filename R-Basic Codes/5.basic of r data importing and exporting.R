####### To get Current Working Directory #######
getwd()

#First  Method
data1<-read.csv(file.choose())

#Second  Method

data2<-read.csv("a1.csv")

# Third Method
data3<-read.csv(file="C:/Users/Ankit Dsouza/Desktop/t-test/a1.csv",header = TRUE)

## data export into csv
mydata<-data1
write.csv(mydata, file="C:/Users/Ankit Dsouza/Desktop/Python Code/Itvedant.csv")


######Importing Excel file data 
library(openxlsx)

d<-read.xlsx("F:/R and Data Science/Basic Statistics/Itvedant.xlsx")

write.xlsx(d, file="F:/R and Data Science/Basic Statistics/Itvedant.xlsx",row.names=FALSE)




library(xlsx)
#library(xlsxjars)
#library(openxlsx)
# data importing 
# it has limit upto 1 lakhs row  for importing and exporting 
# 1 stand for sheet no.
#1=sheet no.1 and 2=sheetno.2 
data1<-read.xlsx("F:/R and Data Science/Simpel _ Multiple Regression/myworkbook.xlsx", 1, header=TRUE)
# it has more than 1 lakhs row for importing and exporting
data2<-read.xlsx2("F:/R and Data Science/Simpel _ Multiple Regression/myworkbook.xlsx", 2,header=TRUE)
## Export the data


# write data from r to xlsx
data<-mtcars
data2<-faithful
write.xlsx(data, file="F:/R and Data Science/Simpel _ Multiple Regression/myworkbook.xlsx",sheetName="USA Arrests")
## adding different data to same excel workbook
write.xlsx(data2, file="F:/R and Data Science/Simpel _ Multiple Regression/myworkbook.xlsx",sheetName="faithful",append=TRUE)

