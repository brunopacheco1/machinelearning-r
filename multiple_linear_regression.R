library(caTools)
library(ggplot2)

#Importing
dataset = read.csv('./data/startups.csv')

#Splitting
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
