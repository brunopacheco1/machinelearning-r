# Importing the dataset
dataSet = read.csv("./data/ads_ctr_optimisation.csv")

# Implementing UCB
N = 10000
d = 10
adsSelected = integer(0)
numbersOfRewards_1 = integer(d)
numbersOfRewards_0 = integer(d)
totalReward = 0
for (n in 1:N) {
  ad = 0
  maxRandom = 0
  for (i in 1:d) {
    randomBeta = rbeta(n = 1, shape1 = numbersOfRewards_1[i] + 1, shape2 = numbersOfRewards_0[i] + 1)
    
    if (randomBeta > maxRandom) {
      maxRandom = randomBeta
      ad = i
    }
  }
  adsSelected = append(adsSelected, ad)
  reward = dataset[n, ad]
  totalReward = totalReward + reward
  
  if(reward == 1) {
    numbersOfRewards_1[ad] = numbersOfRewards_1[ad] + 1
  } else {
    numbersOfRewards_0[ad] = numbersOfRewards_0[ad] + 1
  }
}

# Visualising the results
hist(adsSelected,
     col = 'blue',
     main = 'Histogram of ads selections',
     xlab = 'Ads',
     ylab = 'Number of times each ad was selected')