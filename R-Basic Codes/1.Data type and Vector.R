##Variable Assignment
# = or <- means assign
x=1

# 0r 

x<-1
x
print(x)

###Function and c is combining values into a vector
#or list 
c(1,2,3)
a=c(1,2,3)
a

##to understand  what is c function
help(c)
apropos("nova")  
 
########Type of Data in r ########
# 1)numeric
# 2)integer
# 3)Complex
# 4)logical
# 5)Charater

##Numeric
x = 10.5       # assign a decimal value 
x              # print the value of x 
###To check the ClASS OF X
class(x)       # print the class name of x 
###
k = 1 
k              # print the value of k 
class(k)       # print the class name of k 

  
####tO CONFIRM whether it is integer or not    
is.integer(k)  # is k an integer? 
y = as.integer(3) 
y              # print the value of y 

class(y)       # print the class name of y 
is.integer(y)  # is y an integer?   

as.integer(3.14)    # coerce a numeric value    

###complex Value
z = 1 + 2i     # create a complex number 
z              # print the value of z 
class(z)       # print the class name of z 

# Logical Value
##A logical value is often created via comparison between variables.
x = 1; y = 2   # sample values 
z = x > y      # is x larger than y? 
z              # print the logical value 
class(z)       # print the class name of z 

##Standard logical operations are "&" (and), "|" (or), and "!" (negation).
u = TRUE; v = FALSE 
u & v          # u AND v 
u | v          # u OR v 
!u             # negation of u  , NOT
##Charater
#A character object is used to represent string values in R. 
#We convert objects into character values with the as.character() function:
x = as.character(3.14) 
x              # print the character string 
class(x)       # print the class name of x 
#Two character values can be concatenated with the paste function.

fname = "Joe"; lname ="Smith" 
paste(fname, lname) 

##To extract a substring, we apply the substr function.
#Here is an example showing how to extract the substring between 
#the third and twelfth positions in a string.

substr("Mary has a little lamb.", start=3, stop=12) 

#And to replace the first occurrence of the word "little" by 
#another word "big" in the string, we apply the sub function.

sub("little", "big", "Mary has a little lamb.") 
