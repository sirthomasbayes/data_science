# Install an external library DMwR, which apparently is a data mining 
# library for R, and import the library after installation
install.packages('DMwR', dep=TRUE, lib=NULL)
library(DMwR)

# Grab data, and give a summary of certain statistics of algae
# i.e. the min, max, mean, median, and quartiles of numerical
# data, and list of possible field values for categorical data
data(algae)
summary(algae)

# Draw a histogram of the column mxPH, the height representing 
# the "PDF" of mxPH at that particular value
hist(algae$mxPH, prob = T)

# Creates a scatter plot for the column NH4, with a solid line
# representing the mean of NH4, a dotted line representing the median
# and a dashed line representing values 1 standard deviation greater
# than the mean
plot(algae$NH4, xlab = '')
abline(h = mean(algae$NH4, na.rm = T), lty = 1)  
abline(h = mean(algae$NH4, na.rm = T) + sd(algae$NH4, na.rm = T), lty = 2)
abline(h = median(algae$NH4, na.rm = T), lty = 3)  

# Create a linear regression model where PO4 is the dependent variable and
# oPO4 is the dependent variable
lm(PO4 ~ oPO4, data = algae)

# Fill in missing data points using k-nearest neighbors algorithm
clean.algae <- knnImputation(algae, k = 10)

# Create a multi-dimensional linear regression model where a1 is the 
# dependent variable and the first 11 columns of clean.algae as 
# independent variables 
lm.a1 <- lm(a1 ~ ., data = clean.algae[, 1:12])

# Get R-squared and other relevant statistics from the linear model
# and run ANOVA on the first 12 fields of clean.algae 
summary(lm.a1)
anova(lm.a1)

lm2.a1 <- update(lm.a1, . ~ . - season)
summary(lm2.a1)
anova(lm.a1, lm2.a1)

final.lm <- step(lm.a1)
