library(caTools)
library(ggplot2)
library(e1071)

#Importing
dataset = read.csv('./data/position_salaries.csv')

dataset$Position <- NULL

#Fiting SVR
svr_regressor = svm(formula = Salary ~ Level, data = dataset, type = 'eps-regression')

y_predicted = predict(svr_regressor, newdata = dataset)

#Predicting value of a fictional level 6.5
level = data.frame(Level = 6.5)

level_predict = predict(svr_regressor, newdata = level)

#Visualizing
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
  geom_line(aes(x = dataset$Level, y = y_predicted), colour = 'blue') + 
  geom_point(aes(x = level$Level, y = level_predict), colour = 'black') +
  ggtitle('Salary vs Level') +
  xlab('Level') +
  ylab('Salary')