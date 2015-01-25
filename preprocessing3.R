
### Author Information #####
### Coded by Rischan Mafrur ###
### 01/01/2015 ###
### For Thesis Purpose ###
### Language : R ###
### Dataset : Private Data ###
### Function of preprocessing 3 are : 
# 1. Some of data such as Wi-Fi, Bluetooth, in the same time has many of values.
#    So, we have to aggreagte by time and make in the one row value. 
# 2. For research purpose, I round the time to the nearest time.
# 3. In this case because we want to developing human behavior model, we tried to remove
#    week days. Usually people have similar activities in work days. 


setwd("/Volumes/RISCHAN/Dropbox/thesis/PROJECT/data/output2")
list.files()

data <- read.csv("ENFP_0719.csv")
df <- data
head(df)

#Aggregate values in the same time (minutes)
#install.packages("dplyr")
library(dplyr)

df %>%
  group_by(time) %>% 
  summarise(X=X[1], value1=toString(value1)) %>%
  head()


## round time to nearest hour
df$time <- round(as.POSIXct(df$time), units="hours")
## remove weekdays
x <- df[!weekdays(as.Date(df$time)) %in% c("Saturday", "Sunday"),]


#write to csv file
write.csv(df, "data.csv")
