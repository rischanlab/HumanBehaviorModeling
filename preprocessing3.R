
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

file_list <- list.files("/Volumes/RISCHAN/Dropbox/thesis/PROJECT/data/output2", full.names = TRUE)
for (file in file_list){
  file_proc <- f_preprocessing3(file)
  cat(sprintf("Storing data %s to csv file.......",file))
  cat("\n")
  new_path <- gsub('output2', 'output3', file)
  write.csv(file_proc, sprintf("%s",new_path))
}



setwd("D:/DATA/output2")
data <- read.csv("ENFP_0719.csv")
df <- data
head(df)
df <- df[c(2,3,4,5,6)]
#removing duplicated data
df <- remove_duplicate(df)

#Aggregate values in the same time (minutes)
library(dplyr)


df_wifi <- subset(df, df$type=="wifi")

new_df_wifi <- df_wifi %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
df_wifi <- new_df_wifi[c(1,2,5,3,4)]

df_screen <- subset(df, df$type=="screen")
new_df_screen <- df_screen %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
df_screen <- new_df_screen[c(1,2,5,3,4)]

df_bluetooth <- subset(df, df$type=="bluetooth")
new_df_bluetooth <- df_bluetooth %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
df_bluetooth <- new_df_bluetooth[c(1,2,5,3,4)]
df_bluetooth <- df_bluetooth[-which(df_bluetooth$value1 == "NULL"), ]

df_activity <- subset(df, df$type=="activity")
new_df_activity <- df_activity %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
df_activity <- new_df_activity[c(1,2,5,3,4)]

df_runapps <- subset(df, df$type=="runapps")
new_df_runapps <- df_runapps %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
df_runapps <- new_df_runapps[c(1,2,5,3,4)]

df_battery <- subset(df, df$type=="battery")
new_df_battery <- df_battery %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
df_battery <- new_df_battery[c(1,2,5,3,4)]

df_location <- subset(df, df$type=="location")
new_df_location <- df_location %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
df_location <- new_df_location[c(1,2,5,3,4)]

df_call <- subset(df, df$type=="call")
new_df_call <- df_call %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
df_call <- new_df_call[c(1,2,5,3,4)]

df_sms <- subset(df, df$type=="sms")
new_df_sms <- df_sms %>% group_by(time) %>% summarise(type=type[1], value2=value2[1], value3=value3[1], value1=toString(value1))
df_sms <- new_df_sms[c(1,2,5,3,4)]

df <- NULL
df_tmp <- rbind(df_activity,df_battery,df_bluetooth,df_call,df_location,df_runapps,df_screen,df_sms,df_wifi)

df <- df_tmp[order(df_tmp$time),]

## remove weekdays
x <- df[!weekdays(as.Date(df$time)) %in% c("Saturday", "Sunday"),]

## round time to nearest hour
df$HP <- round(as.POSIXct(df$time), units="hours")
library(lubridate)
g <- transform(df$HP,time.str = format(df$HP,'%H:%M'))
df$HP <- g$time.str
df$Weekday <- weekdays(as.Date(df$time))









View(df)







# round.POSIXct <- function(x, units = c("mins", "5 mins", "10 mins", "15 mins", "quarter hours", "30 mins", "half hours", "hours")){
#   if(is.numeric(units)) units <- as.character(units)
#   units <- match.arg(units)
#   r <- switch(units,
#               "mins" = 60,
#               "5 mins" = 60*5,
#               "10 mins" = 60*10,
#               "15 mins"=, "quarter hours" = 60*15,
#               "30 mins"=, "half hours" = 60*30,
#               "hours" = 60*60
#   )
#   H <- as.integer(format(x, "%H")
#                   M <- as.integer(format(x, "%M"))
#                   S <- as.integer(format(x, "%S"))
#                   D <- format(x, "%Y-%m-%d")
#                   secs <- 3600*H + 60*M + S
#                   as.POSIXct(round(secs/r)*r, origin=D)
# }
# 
# (x <- Sys.time() + 1:10*60)
# round(x, "5 mins")
# round(x, 5)
# round(x, "10 mins")
# round(x, "quarter")
# round(x, "15 mins")

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
