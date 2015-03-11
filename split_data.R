### Author Information #####
### Coded by Rischan Mafrur ###
### 01/01/2015 ###
### For Thesis Purpose ###
### Language : R ###
### Dataset : Private Data ###
### Divide Dataset to two parts ###



setwd("D:/DATA/output2")
data <- read.csv("ENFP_0719.csv")

d <- f_split(data)
write.csv(d$df1, "D:/DATA/omodel/ENFP_0719.csv",row.names=FALSE)
write.csv(d$df2, "D:/DATA/otest/ENFP_0719.csv",row.names=FALSE)


f_split <- function(df){
  df1 <- subset(df, as.Date(df$time) <= "2014-07-30" )
  df2 <- subset(df, as.Date(df$time) >= "2014-08-01" )
  return(list("df1"=df1,"df2"=df2))
}




