library(arules)

# Importing the dataset
dataset = read.transactions("data/basket_optimisation.csv", sep = ",", rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Fitting the dataset
rules = eclat(data = dataset, parameter = list(support = 0.004, minlen = 2))
summary(rules)

# Visualising
inspect(sort(rules, by = "support")[1:10])