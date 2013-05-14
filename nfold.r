knn.nfold <- function(n, max_k, pct)	
{
	#library(class)
	#library(ggplot2)

	## PREPROCESSING
	#data <- iris                # create copy of iris dataframe
	#labels <- data$Species      # store labels
	#data$Species <- NULL        # remove labels from feature set (note: could

	
	
	# Assumes class and ggplot2 are imported
	# Assumes data and labels are set
	
	## TRAIN/TEST SPLIT
	# initialize random seed for consistency
	# this allows our data to look the same every single time the experiment is run
	set.seed(1234) 
	kv <- n

	# we want to use 70% of our data as a training set
	N <- nrow(data)
	train.pct <- pct
	err.rates <- data.frame()
	max.k <- max_k
	
	#initialize error array
	for (i in 1:max.k)
	{
		err.rates <- rbind(err.rates, 0)
	}
	
	for (j in 1:kv)
	{
		train.index <- sample(1:N, train.pct * N)       # random sample of records (training set)
		train.data <- data[train.index, ]       # perform train/test split
		test.data <- data[-train.index, ]       # note use of neg index...different than Python!

		train.labels <- as.factor(as.matrix(labels)[train.index, ])     # extract training set labels
		test.labels <- as.factor(as.matrix(labels)[-train.index, ])     # extract test set labels
	
		for (k in 1:max.k) {
			knn.fit <- knn(
				train = train.data,         # training set
				test = test.data,           # test set
				cl = train.labels,          # true labels
				k = k                       # number of NN to poll
			)

  # print params and confusion matrix for each value k
  #cat('\n', 'k = ', k, ', train.pct = ', train.pct, '\n', sep='')
  #print(table(test.labels, knn.fit))

  # store generalation error and append to total results
  
			this.err <- sum(test.labels != knn.fit) / length(test.labels) 
			err.rates[k,1] <- err.rates[k,1] + this.err
			if (j == kv)
			{
				err.rates[k,1] <- err.rates[k,1] / kv
			}
		}
	}
	
	## OUTPUT RESULTS
	results <- data.frame(1:max.k, err.rates)   # create results summary data frame
	names(results) <- c('k', 'err.rate')        # label columns of results df

	# create title for results plot
	title <- paste('knn results (train.pct = ', train.pct, ')', sep='')

	# create results plot
	results.plot <- ggplot(results, aes(x=k, y=err.rate)) + geom_point() + geom_line()
	results.plot <- results.plot + ggtitle(title)

	# draw results plot
	results.plot
}