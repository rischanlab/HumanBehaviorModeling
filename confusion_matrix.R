
setwd("C:\\Users\\rischan\\Documents\\thesisfiles")

file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\datathesis\\test\\dataset", full.names = TRUE)
file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\datathesis\\model\\dataset", full.names = TRUE)

model_list <- file_list_model
test_list <- file_list_test


f_performance_testing <- function(data_model_path, data_test_path){
  library(dplyr)
  data_model <- read.csv(data_model_path, header=TRUE)
  data_test <- read.csv(data_test_path, header=TRUE)
  intersect <- semi_join(data_test,data_model)
  except <- anti_join(data_test,data_model)
  except_percentage <- (nrow(except)/nrow(data_test))*100
  intersect_percentage <- (nrow(intersect)/nrow(data_test))*100
  
  return(list("intersect"=intersect_percentage,"except"=except_percentage))
}


for (model in model_list){
  for (test in test_list){
    result <- f_performance_testing(model,test)
    intersect_percentage <- round(result$intersect,3)
    except_percentage <- round(result$except,3)
    final_output <- sprintf("%s/%s",intersect_percentage,except_percentage) 
    cat(print(paste(substring(model,57),substring(test,56), final_output,sep=",")),file="outfile4.txt",append=TRUE,"\n")
    print("Writing to file.......")
  }
}



mydata <- read.csv("result.txt", header = FALSE)
head(mydata)
out3 <- reshape(mydata, direction = "wide", idvar = "V1", timevar = "V2")

?write.csv
write.csv(out3, file="result.csv")
