library(caTools)
library(ggplot2)

#Importing
dataset = read.csv('./data/startups.csv')

#Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

#Splitting
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fiting
regressor = lm(formula = Profit ~ R.D.Spend, data = training_set)

#Predicting
y_predicted = predict(regressor, newdata = test_set)

#Visualizing
ggplot() + 
  geom_point(aes(x = training_set$R.D.Spend, y = training_set$Profit), colour = 'red') +
  geom_line(aes(x = training_set$R.D.Spend, y = predict(regressor, newdata = training_set)), colour = 'blue') + 
  geom_point(aes(x = test_set$R.D.Spend, y = y_predicted), colour = 'green') +
  geom_point(aes(x = test_set$R.D.Spend, y = test_set$Profit), colour = 'black') +
  ggtitle('R&D Spend vs Profit') +
  xlab('R&D Spend') +
  ylab('Profit')

#Summary of regression
summary(regressor)