

file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\testing\\test\\CSVs", full.names = TRUE)

test_list <- file_list_test[c(3,4,7,8,11,12,18,21,26,29,33,34,35)]



f_test_resampling <- function(path){
  mydata <- read.csv(path, header = TRUE)
  new_mydata <- mydata[sample(nrow(mydata),nrow(mydata)11030),]
  new_mydata <-  new_mydata[order(new_mydata$Timestamp),]
  return (new_mydata)
}




for (path in test_list){
  data <- f_test_resampling(path)
  cat(sprintf("Storing data %s to csv file.......",path))
  cat("\n")
  new_path <- gsub('CSVs', 'new_test', path)
  write.csv(data, sprintf("%s",new_path),row.names=FALSE)
}


mydata <- read.csv("D:\\Dropbox\\thesis\\PROJECT\\data\\testing\\test\\CSVs/ENTJ_6454_HP.csv", header = TRUE)
head(mydata)
nrow(mydata)
new_mydata <- mydata[sample(nrow(mydata),nrow(mydata)-030),]
new_mydata <-  new_mydata[order(new_mydata$Timestamp),]
head(new_mydata)
nrow(new_mydata)
