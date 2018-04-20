library(cluster)

# Importing the dataset
dataset = read.csv('data/mall_customers.csv')
X = dataset[4:5]

# Dendrogram to find optimal number of clusters
dendrogram = hclust(dist(X, method = 'euclidean'), method = 'ward.D')

plot(dendrogram, 
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distances')

# Fitting hierarchical clustering to the dataset
hc = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(tree = hc, k = 5)
  
# Visualising the clusters
clusplot(dataset,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')