install.packages("caret")
library(caret)
install.packages("C50")
library(C50)
install.packages("modeldata")
library(modeldata)
data(credit_data)
str(credit_data)
vars <- c("Home", "Seniority")
cc=credit_data[, c(vars, "Status")]
str(credit_data[, c(vars, "Status")])
str(cc)
sz=nrow(cc)*0.7
in_train <- sample(1:nrow(cc), size = sz)
train_data <- cc[ in_train,]
test_data <- cc[-in_train,]
tree_mod <- C5.0(x = train_data[,vars], y = train_data$Status)
tree_mod
plot(tree_mod)
summary(tree_mod)
#What happens if rules=TRUE is used
tree_mod <- C5.0(x = train_data[,vars], y = train_data$Status, rules=TRUE)
tree_mod
plot(tree_mod)
summary(tree_mod)
predict.train <- predict(tree_mod, newdata=train_data, type="class")
strain = table(train_data$Status, predict.train, dnn = c("Actual", "Predicted"))
strain
predict.test <- predict(tree_mod, newdata=test_data, type="class")
s = table(test_data$Status, predict.test, dnn = c("Actual", "Predicted"))
s
accuracytrain <- sum(diag(strain))/sum(strain)
accuracytest <- sum(diag(s))/sum(s)
accuracytrain

senstrain <- strain[4]/sum(strain[2,])
senstrain
spectrain<- strain[1]/sum(strain[1,])
spectrain

senstest<- s[4]/sum(s[2,])
senstest
spectest<- s[1]/sum(s[1,])
spectest
accuracytest

