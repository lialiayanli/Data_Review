
### Study Session 02/01/2019
# Yan Li

library(dplyr)
#require(dplyr)
library(data.table)
library(ggplot2)

#ctrl + shift + H : to change the directory
setwd("D:/Desktop/R/Study Session")

# ctrl + L: to clean up the console

# import data file
intl <- read.csv("Intl Consolidation.csv")
View(intl)
# manage data type
str(intl)
intl$Week.Start.Date <- as.Date(intl$Week.Start.Date,"%Y-%m-%d")
intl$Call.Date <- as.Date(intl$Call.Date,"%Y-%m-%d")
str(intl)

intl$Actual.Calls.Offered[4] <- 0
class(intl$Actual.Calls.Offered)
mean(as.numeric(intl$Actual.Calls.Offered),na.rm = TRUE)

# exploring the statistics
summary(intl)
summary(intl$Actual.Calls.Offered)
summary(intl[intl$CRO=="CAR" & intl$Week.Day=="Mon"&intl$Line.of.Business=="ResMax",]$Actual.Calls.Offered)

######################################################## Filter 01 Using Bracket
# filtering data under one condition
intl_01 <- intl[intl$CRO=="CAR",]
View(intl_01)
# fun fact: 
levels(intl_01$CRO)

# filtering data under multiple conditions
levels(intl_02$Line.of.Business)
intl_02 <- intl[intl$CRO=="CAR" & intl$Line.of.Business=="ResMax", c(1,9,10,11,14,16,20,21,22,23,27,28,29)]
levels(intl_02$Line.of.Business)
View(intl_02)
str(intl_02)

### Filter 02  Using Subset
intl_03 <- subset(intl,CRO=="SHA" & Line.of.Business=="ResMax", select=c(6,10:21,27:29))
View(intl_03)
str(intl_03)

### Filter 03 Using package dplyr
intl_04 <- intl%>% select(CRO,Call.Date,Year,Line.of.Business,Month.Name,Month.Num,Week.Start.Date,Week.Day,Property.Code,
                          Property.Name,Country,City,Actual.Calls.Offered,Actual.Calls.Handled,Actual.Workload) %>% 
  filter(CRO=="TYO",Month.Num==4)
View(intl_04)
levels(intl_04$CRO)


# plot with summarization
intl_04 %>% group_by(Month.Num,Country,Actual.Calls.Offered) %>%  summarise(Sum_CallsOffered = sum(Actual.Calls.Offered)) %>%
  ggplot(aes(Month.Name,Sum_CallsOffered)) + geom_boxplot() + facet_wrap(.~Country)

View(intl_04)
# plot without summarization
#intl_02 %>% ggplot(aes(Month.Name,Actual.Calls.Offered),color=Year) + geom_line() + facet_wrap(Country~.)

#####################################################################

## Recoding with Categorical Data
intl_03$Week.Day2[intl_03$Week.Day=="Sun"]="Weekend"
intl_03$Week.Day2[intl_03$Week.Day=="Sat"]="Weekend"
intl_03$Week.Day2[intl_03$Week.Day=="Mon"]="Week Day"
intl_03$Week.Day2[intl_03$Week.Day=="Tue"]="Week Day"
intl_03$Week.Day2[intl_03$Week.Day=="Wed"]="Week Day"
intl_03$Week.Day2[intl_03$Week.Day=="Thu"]="Week Day"
intl_03$Week.Day2[intl_03$Week.Day=="Fri"]="Week Day"

## Recoding method 2
require(plyr)
intl_03$Week.Day3 = revalue(intl_03$Week.Day,c("Mon"="Week Day", "Tue"="Week Day","Wed"="Week Day","Thu"="Week Day","Fri"="Week Day","Sat"="Weekend","Sun"="Weekend"))
View(intl_03)

intl_03$Week.Day2 <- as.factor(intl_03$Week.Day2)


## Explort statistics behind AHT
intl_03$AHT <- intl_03$Actual.Workload/intl_03$Actual.Calls.Handled
summary(intl_03$AHT)
mean(intl_03$AHT,na.rm=TRUE)
str(intl_03)

intl$Actual.Calls.Offered[is.na(intl$Actual.Calls.Offered)] <- 0
mean(as.numeric(intl$Actual.Calls.Offered))


intl_03 %>% ggplot(aes(AHT)) +geom_boxplot(outlier.color = "red") 




