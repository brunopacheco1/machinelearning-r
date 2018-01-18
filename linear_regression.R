library(caTools)
library(ggplot2)

#Importing
dataset = read.csv('salary.csv')

#Splitting
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fiting
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

#Predicting
Y_predicted = predict(regressor, newdata = test_set)

#Visualizing
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), , colour = 'blue') + 
  geom_point(aes(x = test_set$YearsExperience, y = Y_predicted), colour = 'green') +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), colour = 'black') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')