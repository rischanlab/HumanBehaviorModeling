setwd("D:\\Dropbox\\thesis\\PROJECT\\data\\testing\\ptest")

file_list <- list.files()
library(tools)
for(file in file_list){
  file_name <- file_path_sans_ext(file)
  file.rename(file, sprintf("Test_%s.csv",file_name))
}

