# A list of 11 consecutive years along with a corresponding
# list of populations for each years
Year <- c(1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969)
Population <- c(4835, 4970, 5085, 5160, 5310, 5260, 5235, 5255, 5235, 5210, 5175)

# Creates a data frame (in the form of a 11x2 matrix) where 
# the first column represents year and the second column 
# represents the population for that particular year
# (e.g. row 1 has data of the form 1959 and its correspondging
# population for that year, 4835)
sample1 <- data.frame(Year, Population)
# print the matrix in the console
sample1

# take every year and subtract it by 1964 (so now the first column
# corresponds to the number of years relative to 1964; if the 
# value is negative then we looking at data corresponding to
# x years before the year 1964)
sample1$Year <- sample1$Year - 1964
# print the matrix in the console
sample1

# create a simple line graph showing the change in population
# over the years
plot(sample1$Year, sample1$Population, type="b")


# form a simple linear regression model where we try to use a 
# a line to predict the population for any given year 
fit1 <- lm(sample1$Population ~ sample1$Year)

# form a linear regression model where we try to use a quadratic
# function to predict the population for any given year
fit2 <- lm(sample1$Population ~ sample1$Year + I(sample1$Year^2))

# form a linear regression model where we try to use a cubic
# function to predict the population for any given year
fit3 <- lm(sample1$Population ~ sample1$Year + I(sample1$Year^2) + I(sample1$Year^3))

# form a linear regression model where we try to use a cubic
# function to predict the population for any given year, excluding
# a quadratic term in our function
fit4 <- lm(sample1$Population ~ sample1$Year + I(sample1$Year^3))

# Print the summary (i.e. the coefficients as well as relevant 
# statistics e.g. the r^2) to the console
summary(fit2)
summary(fit3)
summary(fit4)

# Similar to the previous plot, but we use a solid black line
# and do not draw circles corresponding to our data points
plot(sample1$Year, sample1$Population, type="l", lwd=3)

# Draw the quadratic function corresponding to the prediction that 
# our model makes for the population given input year.
points(sample1$Year, predict(fit2), type="l", col="red", lwd=2)

# Draw the cubic function corresponding to the prediction that 
# our model makes for the population given input year.
points(sample1$Year, predict(fit3), type="l", col="blue", lwd=2)

# Draw the cubic function corresponding to the prediction that 
# our model makes for the population given input year for fit4,
# which excludes a quadratic term.
points(sample1$Year, predict(fit4), type="l", col="green", lwd=2)

# In fit4, we try to fit our data to a cubic function without a 
# quadratic term. The reason why it's constantly increasing is 
# because where the population decreases, the input values are
# positive, so our chosen model (a cubic function without a 
# quadratic term) cannot capture this without making one of the
# coefficients negative, and apparently none of those would 
# fit the data particularly well given our error function for
# linear regression.  
