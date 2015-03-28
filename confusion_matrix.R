



setwd("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_wifi")

# #All of Data
file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\all_data\\test\\dataset", full.names = TRUE)
file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\all_data\\model\\dataset", full.names = TRUE)

#Without Location
# 
# file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_location\\test\\dataset", full.names = TRUE)
# file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_location\\model\\dataset", full.names = TRUE)


#WithoutWifi
# 
file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_wifi\\test\\dataset", full.names = TRUE)
file_list_model <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result\\without_wifi\\model\\dataset", full.names = TRUE)


model_list <- file_list_model
test_list <- file_list_test
#[c(1,2,16,17,28,6,9,10,15,14)]


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
    #final_output <- sprintf("%s/%s",intersect_percentage,except_percentage) 
    final_output <- sprintf("%s",intersect_percentage) 
    cat(print(paste(basename(model),basename(test), final_output,sep=",")),file="output.txt",append=TRUE,"\n")
    print("Writing to file.......")
  }
}



mydata <- read.csv("output.txt", header = FALSE)
head(mydata)
names(mydata) <- c("model","test","t")
out <- reshape(mydata, direction = "wide", idvar = "model", timevar = "test")

write.csv(out, file="output.csv")




new_df <- subset(mydata, mydata$test==mydata$model)
head(new_df)

#out <- reshape(new_df, direction = "wide", idvar = "model", timevar = "test")

write.csv(new_df, file="data_diagonal.csv")
