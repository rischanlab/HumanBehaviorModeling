### Author Information #####
### Coded by Rischan Mafrur ###
### 01/01/2015 ###
### For Thesis Purpose ###
### Language : R ###
### Dataset : Private Data ###
### Divide Dataset to two parts ###



# setwd("D:/DATA/output2")
# data <- read.csv("ENFP_0719.csv")
# 
# d <- f_split(data)
# write.csv(d$df1, "D:/DATA/omodel/ENFP_0719.csv",row.names=FALSE)
# write.csv(d$df2, "D:/DATA/otest/ENFP_0719.csv",row.names=FALSE)


f_split <- function(path){
  df <- read.csv(path)
  df1 <- subset(df, as.Date(df$time) <= "2014-07-30" )
  df2 <- subset(df, as.Date(df$time) >= "2014-08-01" )
  return(list("df1"=df1,"df2"=df2))
}



# setwd("D:/DATA")

file_list <- list.files("D:/DATA/output2", full.names = TRUE)

for (file in file_list){
  data_split <- f_split(file)
  cat(sprintf("Storing data %s to csv file.......",file))
  cat("\n")
  new_path1 <- gsub('output2', 'omodel', file)
  new_path2 <- gsub('output2', 'otest', file)
  write.csv(data_split$df1, sprintf("%s",new_path1),row.names=FALSE)
  write.csv(data_split$df2, sprintf("%s",new_path2),row.names=FALSE)
}




