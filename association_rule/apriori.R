library(arules)

# Importing the dataset
dataset = read.transactions("data/basket_optimisation.csv", sep = ",", rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Fitting the dataset
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))
summary(rules)

# Visualising
inspect(sort(rules, by = "lift")[1:10])