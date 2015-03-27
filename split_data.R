### Author Information #####
### Coded by Rischan Mafrur ###
### 01/01/2015 ###
### For Thesis Purpose ###
### Language : R ###
### Dataset : Private Data ###
### Divide Dataset to two parts ###



# setwd("D:/DATA/output3")
# df <- read.csv("ENFP_0719_HP.csv")
# 
# df1 <- subset(df, as.Date(df$Timestamp,"%m-%d-%Y %H:%M:%S") <= "2014-07-30" )
# df2 <- subset(df, as.Date(df$Timestamp,"%m-%d-%Y %H:%M:%S") >= "2014-08-1" )
# head(df1)
# tail(df1)
# head(df2)
# tail(df2)
# 
# write.csv(d$df1, "D:/DATA/omodel/ENFP_0719.csv",row.names=FALSE)
# write.csv(d$df2, "D:/DATA/otest/ENFP_0719.csv",row.names=FALSE)


#Input is from output3 not output2

f_split <- function(path){
  df <- read.csv(path)
  df1 <- subset(df, (as.Date(df$Timestamp,"%m-%d-%Y %H:%M:%S") <= "2014-07-28")) 
  df2 <- subset(df, (as.Date(df$Timestamp,"%m-%d-%Y %H:%M:%S") >= "2014-07-29") )
  return(list("df1"=df1,"df2"=df2))
}

#df1 <- subset(df, (as.Date(df$Timestamp,"%m-%d-%Y %H:%M:%S") >= "2014-08-1") & (as.Date(df$Timestamp,"%m-%d-%Y %H:%M:%S") <= "2014-07-30") )


# setwd("D:/DATA")

file_list <- list.files("D:/Dropbox/thesis/PROJECT/data/testing/CSVs", full.names = TRUE)

for (file in file_list){
  data_split <- f_split(file)
  cat(sprintf("Storing data %s to csv file.......",file))
  cat("\n")
  new_path1 <- gsub('CSVs', 'pmodel', file)
  new_path2 <- gsub('CSVs', 'ptest', file)
  write.csv(data_split$df1, sprintf("%s",new_path1),row.names=FALSE)
  write.csv(data_split$df2, sprintf("%s",new_path2),row.names=FALSE)
}




