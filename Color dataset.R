## Jan 29 2019

x1 <- seq(0,10,by=1)
x2 <- c(1,2,3,4,6,6,6,20)
ls() #list objects
x3 <- scan() #after running this command, go to console
             #hit return once to enter each item
             #hit return twice to stop
rm(list=ls()) #remove all the lists

# read text files:read.table()

#margin.table(dataset,1)
#round(variable,2)
#rep(x,xtimes)
#dataframe[1;10,]  first 10 rows and all columns
#ctrl l : clean up the console

## changing colors
barplot(x1)
plot(x1)
colors()
barplot(x1,col="wheat4")
barplot(x1,col="violetred3")

browseURL("http://colorbrewer2.org/")
install.packages("RColorBrewer")
help(package="RColorBrewer")
require("RColorBrewer")

display.brewer.all()

display.brewer.pal(8,"Accent")

barplot(x1,col="blue")
barplot(x1,col=brewer.pal(11,"Greens"))
barplot(x1,col=brewer.pal(11,"RdGy"))
barplot(x1,col=brewer.pal(11,"Dark2"))
barplot(x1,col=brewer.pal(11,"Set3"))

http://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3
  
  