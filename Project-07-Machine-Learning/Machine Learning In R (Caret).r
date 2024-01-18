library(tidyverse)
library(caret)

## churn.csv
## build churn prediction model 
## method = "glm"
## 3 - 5 indeoendent variables (features)

## Preview data 
df <- read_csv("churn.csv")
head(df)


## split data 
train_test_split <- function(data, size = 0.8 ){
  set.seed(88)
  n <- nrow(data)
  id <- sample(n,size=0.8*n)
  train_data <- data[id,]
  test_data <- data[-id,]
  return(list(train_data,test_data))
}

preb_df <-train_test_split(df)
nrow(preb_df[[1]]) ## 4000 data point
nrow(preb_df[[2]]) ## 1000 data point

## train model 
ctrl <- trainControl(method = "cv",
                     number = 5)

model <- train(churn~ totaldaycalls + totaldaycharge + numbercustomerservicecalls + totalevecharge + totalintlcharge,
               data = preb_df[[1]],
               method = "glm",
               trControl = ctrl
               )

## score model
pred_chun <- predict(model , newdata = preb_df[[2]])
preb_df[[2]]$churn <- as.factor(preb_df[[2]]$churn)
## evaluate model  
## use confusionMatrix for classifacation evaluate
acc <- mean(pred_chun==preb_df[[2]]$churn)
conf <- confusionMatrix(pred_chun, preb_df[[2]]$churn)


