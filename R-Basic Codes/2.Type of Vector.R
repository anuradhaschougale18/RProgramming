##Vector Arithmetics
#Arithmetic operations of vectors are performed member-by-member, i.e., memberwise.
#For example, suppose we have two vectors a and b.

a = c(1, 3, 5, 7) 
b = c(1, 2, 4, 8)
a+b
a-b
a*b
a/b
a>b
a<b
a==b   # Equal
a<=b
a>=b

####Vector Index
#We retrieve values in a vector by declaring an index inside
#a single square bracket "[]" operator.

s = c("aa", "bb", "cc", "dd", "ee") 
s[3]
#
#Negative Index
#Removing the value at that position
s[-3] 
##Out-of-Range Index
#If an index is out-of-range, a missing value will be reported via the symbol NA.

s[10] ### NA means Missing value in R

##Numeric Index Vector
s = c("aa", "bb", "cc", "dd", "ee") 
s[c(2, 3)] 

# Duplicate 
s[c(2, 3, 3)] 

#Out-of-Order Indexes
s[c(2, 1, 3)] 

#Range Index
s[2:4] 


