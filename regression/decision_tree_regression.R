library(caTools)
library(ggplot2)
library(rpart)

#Importing
dataset = read.csv('data/position_salaries.csv')

dataset$Position <- NULL

#Fiting
control = rpart.control(minsplit = 1)

regressor = rpart(formula = Salary ~ Level, data = dataset, control = control)

#Predicting
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)

y_predicted = predict(regressor,
                      newdata = data.frame(Level = x_grid,
                                           Level2 = x_grid^2,
                                           Level3 = x_grid^3,
                                           Level4 = x_grid^4))

#Predicting value of a fictional level 6.5
level = data.frame(Level = 6.5)

predict = predict(regressor, newdata = level)

#Visualizing
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
  geom_line(aes(x = x_grid, y = y_predicted), colour = 'blue') +
  geom_point(aes(x = level$Level, y = predict), colour = 'black') +
  ggtitle('Salary vs Level') +
  xlab('Level') +
  ylab('Salary')