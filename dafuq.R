

setwd("D:\\Dropbox\\thesis\\PROJECT\\data\\testing")

file_list_test <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\testing\\test\\CSVs", full.names = TRUE)
file_list_tgl <- list.files("D:\\Dropbox\\thesis\\PROJECT\\data\\testing\\ptest", full.names = TRUE)

tgl_list <- file_list_tgl
test_list <- file_list_test




f_join <- function(tgl_path, real_path){
  
  #### Date test
  tgl_test <- read.csv(tgl_path)
  numtgl <- nrow(df_tgl)
  
  ### Real Test
  real_test <- read.csv(real_path)
  numreal <- nrow(real_test)
  l <- min(numtgl,numreal)
  
  #Select data
  df_tgl <- tgl_test[1:l,c(1,2,3)]
  
  df_real <- real_test[1:l,c(4,5)]
  new_df <- cbind(df_tgl,df_real)
  
  return(new_df)
}


for (tgl in tgl_list){
  for (test in test_list){
    data <- f_join(tgl, test)
    cat(sprintf("Joining.......", test))
    cat("\n")
    new_path <- gsub('CSVs', 'madesu', test)
    write.csv(data, sprintf("%s",new_path),row.names=FALSE)
  }
}

# #### Date test
# tgl_test <- read.csv("D:\\Dropbox\\thesis\\PROJECT\\data\\testing\\ptest/ENFP_0719_HP.csv")
# numtgl <- nrow(df_tgl)
# 
# ### Real Test
# real_test <- read.csv("D:\\Dropbox\\thesis\\PROJECT\\data\\testing\\test\\CSVs/ENFP_0719_HP.csv")
# numreal <- nrow(real_test)
# l <- min(numtgl,numreal)
# 
# #Select data
# df_tgl <- tgl_test[1:l,c(1,2,3)]
# 
# df_real <- real_test[1:l,c(4,5)]
# nrow(df_tgl)
# nrow(df_real)
# 
# 
# new_df <- cbind(df_tgl,df_real)
# 
# head(new_df)
# tail(new_df)

write.csv(new_df, "ENFP_0719_HP.csv", row.names=FALSE)


