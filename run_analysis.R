## Combine test set
testSub <- read.table(file="UCI HAR Dataset/test/subject_test.txt")
testAct <- read.table(file="UCI HAR Dataset/test/y_test.txt")
testFtr <- read.table(file="UCI HAR Dataset/test/X_test.txt")

test <- cbind(testSub, testAct, testFtr)

## Combine traning set
trainSub <- read.table(file="UCI HAR Dataset/train/subject_train.txt")
trainAct <- read.table(file="UCI HAR Dataset/train/y_train.txt")
trainFtr <- read.table(file="UCI HAR Dataset/train/x_train.txt")

train <- cbind(trainSub, trainAct, trainFtr)

## Merge test and training sets
total <- rbind(train, test)


## Construct activity name according to activity code
activities <- read.table(file="UCI HAR Dataset/activity_labels.txt")
activityCode <- total[,2]
activityName <- character()
for (code in activityCode) {
	activityName <- c(activityName, as.character(activities[code,2]))
}

## Extract interested features
features <- read.table(file="UCI HAR Dataset/features.txt")

indexes <- c(1,2)
interested_features <- c("subject","activityCode")
index <- 3
for (t in features[,2]) { 
	if (grepl("mean\\(\\)",t) | grepl("std()",t)) { 
		interested_features <- c(interested_features, t) 
		indexes <- c(indexes, index) 
	}
	index <- index + 1
}

tmpInterested <- total[,indexes]

## Add activity names into dataset
totalInterested <- cbind(as.data.frame(activityName),tmpInterested)
colnames(totalInterested) <- c("activityName",interested_features)

## Reorder columns
interested_features <- interested_features[-1]
interested_features <- interested_features[-1]
interested_features <- c("subject", "activityCode", "activityName",interested_features)
totalInterested <- totalInterested[,interested_features]

## Compute average of interested features per subject per activity
stat <- data.frame()
for (sub in 1:30) {
	for (act in 1:6) {
		sbset <- subset(totalInterested, totalInterested$subject == sub & totalInterested$activityCode == act)
		statId <- sbset[1, 1:3]
		statData <- sapply(sbset[,4:69],mean)
		statData <- matrix(statData, nrow = 1, ncol = 66)
		curStat <- cbind(statId, as.data.frame(statData))
		stat <- rbind(stat, curStat)
	}
}

## Add feature names to rows and columns of the output dataset
for (i in 4:69) { 
	interested_features[i] <- paste("AVE",interested_features[i], sep='')
}
colnames(stat) <- interested_features
rownames(stat) <- c(1:nrow(stat))

## Output the result to stat.txt file
write.table(stat, file= "stat.txt",sep="\t",row.names=F)
