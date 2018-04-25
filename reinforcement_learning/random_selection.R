# Random Selection

# Importing the dataset
dataSet = read.csv("./data/ads_ctr_optimisation.csv")

# Implementing Random Selection
N = 10000
d = 10
adsSelected = integer(0)
totalReward = 0
for (n in 1:N) {
  ad = sample(1:10, 1)
  adsSelected = append(adsSelected, ad)
  reward = dataSet[n, ad]
  totalReward = totalReward + reward
}

# Visualising the results
hist(adsSelected,
     col = 'blue',
     main = 'Histogram of ads selections',
     xlab = 'Ads',
     ylab = 'Number of times each ad was selected')