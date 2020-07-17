# create 2 hp Level 
abc<-mtcars

abc$hpcat <- as.factor(ifelse(abc$hp > 200,"sport","Normal_Car"))

# to check the level in a variable
table(abc$hpcat)

abc$hpcat<- factor(abc$hpcat,
                         levels = c("sport","Normal_Car"),
                         labels = c(1,0))
table(abc$hpcat)

rm(abc)

# More than 2 levels
abc<-mtcars

abc$hpcat <- as.factor(ifelse(abc$hp<= 70,"Normal_Car",
                      ifelse(abc$hp<=200,"Semi_sport","sport")))

# to check the level in a variable
table(abc$hpcat)
abc$hpcat<- factor(abc$hpcat,
                         levels = c("Normal_Car","Semi_sport","sport"),
                         labels = c(1,2,3))

table(abc$hpcat)

rm(abc)
