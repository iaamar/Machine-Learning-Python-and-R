# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))

regressor = lm(formula = Profit ~ R.D.Spend , data = training_set)
Y_pred = predict(regressor , newdata = test_set)

#Backward elimination 

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State , data = training_set)
summary(regressor)


regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend , data = training_set)
summary(regressor)


regressor = lm(formula = Profit ~ R.D.Spend +  Marketing.Spend , data = training_set)
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend , data = training_set)
summary(regressor)









# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)