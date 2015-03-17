


index <- seq(1,111, by=i+2)


file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\datathesis\\test\\DataMiningCSVs", full.names = TRUE)
file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\datathesis\\model\\DataMiningCSVs", full.names = TRUE)

list_test <- file_list_test[c(index)]
list_model <- file_list_model[c(index)]



f_sampling <- function(path){
  mydata <- read.csv(path, header = FALSE)
  names(mydata) <- c("G","data")
  mydata <- mydata$data
  mydata <- as.data.frame(mydata)
  mydata <- mydata[sample(nrow(mydata),3000),]
  mydata <- as.data.frame(mydata)
  names(mydata) <- c("data")
  return (mydata)
}



for (path in list_model){
  data <- f_sampling(path)
  cat(sprintf("Storing data %s to csv file.......",path))
  cat("\n")
  new_path <- gsub('DataMiningCSVs', 'dataset', path)
  write.csv(data, sprintf("%s",new_path),row.names=FALSE)
}

for (path in list_test){
  data <- f_sampling(path)
  cat(sprintf("Storing data %s to csv file.......",path))
  cat("\n")
  new_path <- gsub('DataMiningCSVs', 'dataset', path)
  write.csv(data, sprintf("%s",new_path),row.names=FALSE)
}






