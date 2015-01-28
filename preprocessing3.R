
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

library(dplyr)

setwd("/Volumes/RISCHAN/Dropbox/thesis/PROJECT/data/output2")
# list.files()

#removing duplicate data
remove_duplicate <- function(data){
  return (data[!duplicated(data),])
}


f_preprocessing3 <- function(file){
  df <- read.csv(file)
  df <- df[c(2,3,4,5,6)]
  #removing duplicated data
  df <- remove_duplicate(df)
  
  #Aggregate values in the same time (minutes)
  new_df <- df %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
  df <- new_df[c(1,2,5,3,4)]
  
  ## round time to nearest hour
  df$time <- round(as.POSIXct(df$time), units="hours")
  ## remove weekdays
  x <- df[!weekdays(as.Date(df$time)) %in% c("Saturday", "Sunday"),]
  
}

file_list <- list.files("/Volumes/RISCHAN/Dropbox/thesis/PROJECT/data/output1", full.names = TRUE)
for (file in file_list){
  file_proc <- f_preprocessing3(file)
  cat(sprintf("Storing data %s to csv file.......",file))
  cat("\n")
  new_path <- gsub('output1', 'output3', file)
  write.csv(file_proc, sprintf("%s",new_path))
}



# data <- read.csv("ENFP_0719.csv")
# df <- data
# head(df)
# df <- df[c(2,3,4,5,6)]
# 


# #In this data still contain any duplicate data, so we need to remove dublicate data again
# df <- remove_duplicate(df)
# 
# #Aggregate values in the same time (minutes)
# #install.packages("dplyr")
# 
# 
# new_df <- df %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
# df <- new_df[c(1,2,5,3,4)]
# View(df)
# 
# 
# head(df)
# ## round time to nearest hour
# df$time <- round(as.POSIXct(df$time), units="hours")
# ## remove weekdays
# x <- df[!weekdays(as.Date(df$time)) %in% c("Saturday", "Sunday"),]
# 
# 
# #write to csv file
# write.csv(df, "data.csv")
