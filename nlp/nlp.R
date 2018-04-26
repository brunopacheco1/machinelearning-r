# install.packages('tm')
# install.packages('SnowballC')
# install.packages('e1071')
# install.packages('caTools')
# install.packages('ElemStatLearn')
library(tm)
library(SnowballC)
library(e1071)
library(caTools)
library(ElemStatLearn)

# Importing the dataset
dataset_original = read.delim("./data/restaurant_reviews.tsv", quote = '', stringsAsFactors = FALSE)

# Cleaning the texts
corpus = VCorpus(VectorSource(dataset_original$Review))
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removeNumbers)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords())
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, stripWhitespace)

# Creating the Bag of Words model
dtm = DocumentTermMatrix(corpus)
dtm = removeSparseTerms(dtm, 0.999)
dataset = as.data.frame(as.matrix(dtm))
dataset$Liked = dataset_original$Liked

#Splitting
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fiting
classifier = naiveBayes(formula = Liked ~ .,
                        data = training_set)

#Predicting
y_pred = predict(classifier, newdata = test_set)

#Confusion Matrix
cm = table(test_set, y_pred)