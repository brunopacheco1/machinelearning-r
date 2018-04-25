# Upper Confidence Bound

# Importing the dataset
dataSet = read.csv("./data/ads_ctr_optimisation.csv")

# Implementing UCB
N = 10000
d = 10
adsSelected = integer(0)
numbersOfSelections = integer(d)
sumsOfRewards = integer(d)
totalReward = 0
for (n in 1:N) {
  ad = 0
  maxUpperBound = 0
  for (i in 1:d) {
    if (numbersOfSelections[i] > 0) {
      averageReward = sumsOfRewards[i] / numbersOfSelections[i]
      delta_i = sqrt(3/2 * log(n) / numbersOfSelections[i])
      upperBound = averageReward + delta_i
    } else {
      upperBound = 1e400
    }
    if (upperBound > maxUpperBound) {
      maxUpperBound = upperBound
      ad = i
    }
  }
  adsSelected = append(adsSelected, ad)
  numbersOfSelections[ad] = numbersOfSelections[ad] + 1
  reward = dataset[n, ad]
  sumsOfRewards[ad] = sumsOfRewards[ad] + reward
  totalReward = totalReward + reward
}

# Visualising the results
hist(adsSelected,
     col = 'blue',
     main = 'Histogram of ads selections',
     xlab = 'Ads',
     ylab = 'Number of times each ad was selected')