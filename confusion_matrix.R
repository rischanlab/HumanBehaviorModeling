

file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\datathesis\\test\\dataset", full.names = FALSE)
file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\datathesis\\model\\dataset", full.names = FALSE)

table(file_list_model, file_list_test)

model_list <- file_list_model[1:3]
test_list <- file_list_test[1:3]

table(model_list,test_list)


f_performance_testing <- function(data_model, data_test){
  library(dplyr)
  data_model <- read.csv(data_model, header=TRUE)
  data_test <- read.csv(data_test, header=TRUE)
  intersect <- semi_join(data_test,data_model)
  except <- anti_join(data_test,data_model)
  except_percentage <- (nrow(except)/nrow(data_test))*100
  intersect_percentage <- (nrow(intersect)/nrow(data_test))*100
  
  return(list("intersect"=intersect_percentage,"except"=except_percentage))
}



for (model in model_list){
  for (test in test_list){
    print(paste(model,test,sep=","))
  }
}

?table

