## Homework 1: Data Science III, General Assembly
Work time expected: ~ 6 hours.
Load the homework file into R as a data frame. This data represents Germans with good or bad credit risks.
The last column represents classification: 1 for good, 2 for bad.

Use what you know about knn and bayes inference to write a good model that classifies each row according to good or bad credit risk.

Please save your work in your github. Commit as you need to!

# About the Data
The data includes the original 20 features, 4 indicator columns, and a classification column.
Keep in mind that all data has been scaled.
Read the columns as follows:

1. Status of existing checking account
2. Duration in month
3. Credit history
4. Purpose
5. Credit amount
6. Savings account/bonds
7. Present employment since
8. Installment rate in percentage of disposable income
9. Personal status and sex
10. Other debtors / guarantors
11. Present residence since
12. Property
13. Age in years
14. Other installment plans
15. Housing
16. Number of existing credits at this bank
17. Job
18. Number of people being liable to provide maintenance for
19. Telephone
20. foreign worker
21, 22, 23, 24. Indicator columns (flag columns, either 0 or 1)
25. Classification column

# What we're expecting

Include an R file for each classification algorithm.
Use N-Fold Cross Validation to validate your model performance.
Write a short summary covering the following topics:

1) An introduction to the data set. We know that these are all values that contribute to credit risk, at least.
Learn more about the data here: http://archive.ics.uci.edu/ml/datasets/Statlog+(German+Credit+Data)

2) Example plots that show correlation between values. Make sure you explain
any significant correlations you find. This will show us you understand the
data and investigated value.

3) Explain your approach and methodologies, including a brief explanation of
KNN, Bayes Classification, and cross validation.

4) Detail your results for each model. Explain the strengths and weaknesses in each model.

5) Report back the best error you find for each machine learning algorithm and accuracy rating.
