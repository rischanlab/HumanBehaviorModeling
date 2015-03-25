

#Levenshtein Similarity example
# install RecordLinkage package first.

install.packages("RecordLinkage")
library(RecordLinkage)
levenshteinSim("apple", "apple")
levenshteinSim("apple", "aaple")
levenshteinSim("apple", "appled")
levenshteinSim("appl", "apple")


#Result
# # 
# > levenshteinSim("apple", "apple")
# [1] 1
# > levenshteinSim("apple", "aaple")
# [1] 0.8
# > levenshteinSim("apple", "appled")
# [1] 0.8333333
# > levenshteinSim("appl", "apple")
# [1] 0.8
# > 