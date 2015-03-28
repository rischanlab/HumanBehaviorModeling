
## Coded by Rischan Mafrur
## R languange
## For Thesis Purpose
## Processing before evaluation


i=1
index <- seq(1,111, by=i+2)

# ## All of Data
# file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\testing\\test\\DataMiningCSVs", full.names = TRUE)
# file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\testing\\model\\DataMiningCSVs", full.names = TRUE)

## Without Location
# file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_location\\test\\DataMiningCSVs", full.names = TRUE)
# file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_location\\model\\DataMiningCSVs", full.names = TRUE)

##Without Wifi
# file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_wifi\\test\\DataMiningCSVs", full.names = TRUE)
# file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_wifi\\model\\DataMiningCSVs", full.names = TRUE)

##Without Activity
# file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_activity\\test\\DataMiningCSVs", full.names = TRUE)
# file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_activity\\model\\DataMiningCSVs", full.names = TRUE)

##Without Run apps
# file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_apps\\test\\DataMiningCSVs", full.names = TRUE)
# file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_apps\\model\\DataMiningCSVs", full.names = TRUE)

##Without Battery
# file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_battery\\test\\DataMiningCSVs", full.names = TRUE)
# file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_battery\\model\\DataMiningCSVs", full.names = TRUE)

##Without Call
#file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_call\\test\\DataMiningCSVs", full.names = TRUE)
#file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_call\\model\\DataMiningCSVs", full.names = TRUE)

##Without SMS
# file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_sms\\test\\DataMiningCSVs", full.names = TRUE)
# file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_sms\\model\\DataMiningCSVs", full.names = TRUE)

##Without Activity and Call
# file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_activity_call\\test\\DataMiningCSVs", full.names = TRUE)
# file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_activity_call\\model\\DataMiningCSVs", full.names = TRUE)

##Without Bluetooth and SMS
file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_bluetooth_sms\\test\\DataMiningCSVs", full.names = TRUE)
file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_bluetooth_sms\\model\\DataMiningCSVs", full.names = TRUE)

list_test <- file_list_test[c(index)]
list_model <- file_list_model[c(index)]



f_model_sampling <- function(path){
  mydata <- read.csv(path, header = FALSE)
  names(mydata) <- c("G","data")
  mydata <- mydata$data
  mydata <- as.data.frame(mydata)
  mydata <- mydata[sample(nrow(mydata),nrow(mydata)-10),]
  mydata <- as.data.frame(mydata)
  names(mydata) <- c("data")
  return (mydata)
}

f_test_sampling <- function(path){
  mydata <- read.csv(path, header = FALSE)
  names(mydata) <- c("G","data")
  mydata <- mydata$data
  mydata <- as.data.frame(mydata)
  mydata <- mydata[sample(nrow(mydata),nrow(mydata)),]
  mydata <- as.data.frame(mydata)
  names(mydata) <- c("data")
  return (mydata)
}



for (path in list_model){
  data <- f_model_sampling(path)
  cat(sprintf("Storing data %s to csv file.......",path))
  cat("\n")
  new_path <- gsub('DataMiningCSVs', 'dataset', path)
  write.csv(data, sprintf("%s",new_path),row.names=FALSE)
}

for (path in list_test){
  data <- f_test_sampling(path)
  cat(sprintf("Storing data %s to csv file.......",path))
  cat("\n")
  new_path <- gsub('DataMiningCSVs', 'dataset', path)
  write.csv(data, sprintf("%s",new_path),row.names=FALSE)
}





