if (!file.exists("UCI HAR Dataset.zip")) {
	download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
		"UCI HAR Dataset.zip", method="curl")
}
if (!file.exists("UCI HAR Dataset")) {
	unzip("UCI HAR Dataset.zip")
}

dir <- "./UCI HAR Dataset/"

# extract measurement names containing mean or std
features <- read.table(paste0(dir, "features.txt"))
indx <- which(grepl("-(mean|std)\\(\\)", features$V2))

names <- gsub("[()]", "", features$V2[indx])

# prepare vector of columns of interest
colClasses <- rep("NULL", length(features$V2))
colClasses[indx] <- "numeric"

# read data from test set
testdata <- read.table(paste0(dir,"test/X_test.txt"), colClasses=colClasses)
names(testdata) <- names
testdata$activity <- read.table(paste0(dir,"test/y_test.txt"))$V1
testdata$subject <- read.table(paste0(dir,"test/subject_test.txt"))$V1

# read data from training set
traindata <- read.table(paste0(dir,"train/X_train.txt"), colClasses=colClasses)
names(traindata) <- names
traindata$activity <- read.table(paste0(dir,"train/y_train.txt"))$V1
traindata$subject <- read.table(paste0(dir,"train/subject_train.txt"))$V1

# merge data sets
data <- rbind(testdata, traindata)

# replace activities with labels from file
activities <- read.table(paste0(dir, "activity_labels.txt"))
data$activity <- as.factor(activities[data$activity,]$V2)

# apply mean
# remark: if you know how to do this easily without using data.table
# please reply me here on github
library(data.table)
dt <- data.table(data)
tidy <- dt[,lapply(.SD, mean), by=list(subject, activity)]
write.table(tidy, "tidy.txt", row.names=FALSE)

