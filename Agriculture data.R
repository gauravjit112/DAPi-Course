
crop_data <- read.csv("D:/(A) Gauravjit/NYU MASTERS COURSE/OneDrive - nyu.edu/SEM 2/Data Analytics/PROJECT 3/India Agriculture Crop Production.csv")
crop_data[crop_data==""]=NA
sum(is.na(crop_data))

summary(crop_data)
str(crop_data)
hist(crop_data$Production)

crop_data <- na.omit(crop_data) # remove rows with missing values
crop_data$Year <- as.factor(crop_data$Year) # convert Year to a factor variable

#predict the production of a certain crop in a certain state given certain weather and soil conditions.
# Split the dataset into training and testing sets. You can use the caret package to do this:
library(caret)
set.seed(123) # for reproducibility
train_index <- createDataPartition(crop_data$Production, p = 0.8, list = FALSE)
train_data <- crop_data[train_index, ]
test_data <- crop_data[-train_index, ]

#  There are many options, including linear regression, decision trees, random forests, and neural networks. 
# Here's an example using a linear regression model:
model <- lm(Production ~ Min.Temp + Max.Temp + Rainfall + Soil.Type + Year + State, data = train_data)
summary(model)

