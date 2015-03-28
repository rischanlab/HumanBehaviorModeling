
setwd("D:\\Dropbox\\thesis\\PROJECT\\data\\research-result")
result <- read.csv("result.csv", header=TRUE)
head(result)

result0 <- head(result,5)
result1 <- result[1:10,]
result2 <- result[11:20,]
result3 <- result[21:30,]
result4 <- result[31:37,]
result0.m <-melt(result0, id.vars = "model")
result1.m <-melt(result1, id.vars = "model")
result2.m <-melt(result2, id.vars = "model")
result3.m <-melt(result3, id.vars = "model")
result4.m <-melt(result4, id.vars = "model")

ggplot(result2.m, aes(variable, value, colour = model)) +
  geom_line(aes(group=model)) +
  theme(text = element_text(size=20),axis.text.x = element_text(angle=30, vjust=1)) +
  scale_fill_manual(values=c("#CC0000", "#006600", "#669999", "#00CCCC", 
                             "#660099", "#CC0066", "#FF9999", "#FF9900", 
                             "black", "black", "black", "black", "black")) +
  xlab("Model") +
  ylab("The Percentage of B2 identified")


