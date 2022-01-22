library(readr)

library(dplyr)
library(class)
library(MASS)
library(kernlab)
library(mlbench)
library(reshape2)
library(ROCR)
library(ggplot2)
library(devtools)
library(tidyverse)
library(caret)
library(PerformanceAnalytics)
library(DT)
library(knitr)
library(yardstick)
library(pROC)
library(ggfortify)
mnist_train <- read_csv("https://pjreddie.com/media/files/mnist_train.csv", col_names = FALSE)
mnist_test <- read_csv("https://pjreddie.com/media/files/mnist_test.csv", col_names = FALSE)
xtrain<-with(mnist_train,mnist_train[(mnist_train$X1=='1')|(mnist_train$X1 =='7'),-1])
ytrain<-with(mnist_train,mnist_train[(mnist_train$X1=='1')|(mnist_train$X1=='7'),1])
ytrain<-ifelse(ytrain==1,1,-1)

xtest<-with(mnist_test,mnist_test[(mnist_test$X1=='1')|(mnist_test$X1=='7'),-1])
ytest<-with(mnist_test,mnist_test[(mnist_test$X1=='1')|(mnist_test$X1=='7'),1])
ytest<-ifelse(ytest==1,1,-1)
y.tr.hat_1 <-class::knn(xtrain, xtrain,ytrain, k=1)
y.tr.hat_7<-class::knn(xtrain, xtrain,ytrain, k=7)
y.tr.hat_9<-class::knn(xtrain, xtrain,ytrain, k=9)

y.te.hat_1 <-class::knn(xtrain, xtest,ytrain, k=1)
y.te.hat_7<-class::knn(xtrain, xtest,ytrain, k=7)
y.te.hat_9<-class::knn(xtrain, xtest,ytrain, k=9)
mnist_train

mnist_train$X1
##### training confusion matrices
kable(table(ytrain,yhat_tr_1),caption="train: k=1")%>%
  kableExtra::kable_styling(latex_options="hold_position")
kable(table(ytrain,yhat_tr_1),caption="train: k=7")%>%
  kableExtra::kable_styling(latex_options="hold_position")
kable(table(ytrain,yhat_tr_1),caption="train: k=9")%>%
  kableExtra::kable_styling(latex_options="hold_position")





conf.mat.tr <- table(ytrain, y.tr.hat_1)
conf.mat.tr







5+3




# n <- nrow(mnist)
# p <- ncol(mnist) - 1
# pos <- p + 1
# mnist_train <- head(mnist, 60000)
# mnist_test <- tail(mnist, 10000)
# xtrain <- mnist_train[,-pos]
# ytrain <- mnist_train[, pos]
# xtest <- mnist_test[, -pos]
# ytest <- mnist_test[, pos]
# ninepics <- sample(sample(sample(n)))[1:9]
# par(mfrow=c(3,3))
# for(i in 1:9)
# {
#   show_digit(mnist, ninepics[i])
# }
######################4########################################################
prastate<read.csv('prostate-cancer-1.csv')

