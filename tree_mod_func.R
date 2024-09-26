func<-function(d){
  str(d)
  vars <- c(colnames(d)[2:5])
  cc=d[, c(vars, "buys")]
  str(d[, c(vars, "buys")])
  str(cc)
  split=c(.4,.5,.6,.7,.8)
  dftrain<-data.frame()
  dftest<-data.frame()
  for(sp in split){
    sz=nrow(cc)*sp
    set.seed(1234)
    in_train <- sample(1:nrow(cc), size = sz)
    train_data <- cc[ in_train,]
    test_data <- cc[-in_train,]
    tree_mod <- C5.0(x = train_data[,vars], y = factor(train_data$buys))
    tree_mod <- C5.0(x = train_data[,vars], y = factor(train_data$buys), rules=TRUE)
    predict.train <- predict(tree_mod, newdata=train_data, type="class")
    strain = table(train_data$buys, predict.train, dnn = c("Actual", "Predicted"))
    predict.test <- predict(tree_mod, newdata=test_data, type="class")
    s = table(test_data$buys, predict.test, dnn = c("Actual", "Predicted"))
    
    accutrain <- sum(diag(strain))/sum(strain)
    senstrain <- strain[4]/sum(strain[2,])
    spectrain<- strain[1]/sum(strain[1,])
    ttrain<-list(Split=sp,Accuracy=accutrain,Sensitivity=senstrain,Specificity=spectrain)
    dftrain<-rbind(dftrain,ttrain)
    
    accutest <- sum(diag(s))/sum(s)
    senstest<- s[4]/sum(s[2,])
    spectest<- s[1]/sum(s[1,])
    ttest<-list(Split=(1-sp),Accuracy=accutest,Sensitivity=senstest,Specificity=spectest)
    dftest<-rbind(dftest,ttest)
  }
  return(list(Train=dftrain,Test=dftest))
}
d=read.csv("ClassificationSimplecases.csv")
func(d)
