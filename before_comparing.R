
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
file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_wifi\\test\\DataMiningCSVs", full.names = TRUE)
file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_wifi\\model\\DataMiningCSVs", full.names = TRUE)


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





