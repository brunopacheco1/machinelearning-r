library(caTools)
library(ggplot2)

#Importing
dataset = read.csv('./data/position_salaries.csv')

dataset$Position <- NULL

#Fiting Linear Regression
linear_regressor = lm(formula = Salary ~ Level, data = dataset)

#Predicting Linear Regression
y_predicted = predict(linear_regressor, newdata = dataset)

#Fiting Polynomial Regression
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
polynomial_regressor = lm(formula = Salary ~ ., data = dataset)

#Fiting Polynomial Regression
y_polynomial_predicted = predict(polynomial_regressor, newdata = dataset)

#Predicting value of a fictional level 6.5
level = data.frame(Level = 6.5)
level$Level2 = level$Level^2
level$Level3 = level$Level^3
level$Level4 = level$Level^4

level_6_5_linear_predict = predict(linear_regressor, newdata = level)
level_6_5_polynomial_predict = predict(polynomial_regressor, newdata = level)

#Visualizing
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
  geom_line(aes(x = dataset$Level, y = y_predicted), colour = 'yellow') + 
  geom_line(aes(x = dataset$Level, y = y_polynomial_predicted), colour = 'green') +
  geom_point(aes(x = level$Level, y = level_6_5_linear_predict), colour = 'black') +
  geom_point(aes(x = level$Level, y = level_6_5_polynomial_predict), colour = 'blue') +
  ggtitle('Salary vs Level') +
  xlab('Level') +
  ylab('Salary')