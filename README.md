# 📊 Decision Trees with C5.0

## 📝 Overview
This repository contains solutions and experiments involving decision trees using the C5.0 algorithm. We'll explore concepts like **accuracy**, **sensitivity**, and **specificity** of classifiers using different training/test splits on multiple datasets.

---

## 🧰 Requirements

Make sure you have the following libraries installed:

- **caret**: For creating and evaluating classification models.
- **C50**: To implement the C5.0 algorithm for decision trees.
- **modeldata**: To use sample datasets for training and testing.

```r
install.packages("caret")
install.packages("C50")
install.packages("modeldata")
```

Load the libraries:

```r
library(caret)
library(C50)
library(modeldata)
```

---

## 🔍 Problems and Solutions

This repository focuses on solving common problems such as:
- Training and testing C5.0 models with different data splits.
- Analyzing **accuracy**, **sensitivity**, and **specificity** for training and test sets.
- Evaluating models with and without rules.
- Comparing model performance across various training partitions: **40%, 50%, 60%, 70%, and 80%**.

