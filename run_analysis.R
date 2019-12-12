
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("data.zip")

# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("UCI HAR Dataset/features.txt")
colnames(features) <- c("feature_code", "feature_label")
featureColNames <- make.names(features$feature_label, unique = TRUE)
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("activity_code", "activity_label")
testData <- read.table("UCI Har Dataset/test/X_test.txt", col.names = featureColNames)
testActivities <- read.table("UCI Har Dataset/test/y_test.txt", col.names = c("activity"))
testSubjects <- read.table("UCI Har Dataset/test/subject_test.txt", col.names = c("subject"))
trainData <- read.table("UCI Har Dataset/train/X_train.txt", col.names = featureColNames)
trainActivities <- read.table("UCI Har Dataset/train/y_train.txt", col.names = c("activity"))
trainSubjects <- read.table("UCI Har Dataset/train/subject_train.txt", col.names=c("subject"))
desiredCols <- featureColNames[grepl("mean|std", featureColNames, ignore.case = TRUE)] 
testData <- testData[,desiredCols]
trainData <- trainData[,desiredCols]
testData <- cbind(testData, testActivities)
testData <- cbind(testData, testSubjects)
trainData <- cbind(trainData, trainActivities)
trainData <- cbind(trainData, trainSubjects)
data <- rbind(testData, trainData)

# Uses descriptive activity names to name the activities in the data set

data <- merge(data, activities, by.x = "activity", by.y = "activity_code")

# Appropriately labels the data set with descriptive variable names.

descriptiveNames <- colnames(data)
descriptiveNames <- gsub("\\.+", "", descriptiveNames)
descriptiveNames <- gsub("BodyBody", "Body", descriptiveNames)
descriptiveNames <- gsub("Acc", "Acceleration", descriptiveNames)
descriptiveNames <- gsub("Mag", "Magnitude", descriptiveNames)
descriptiveNames <- gsub("Freq", "Frequency", descriptiveNames)
descriptiveNames <- gsub("^t", "", descriptiveNames)
descriptiveNames <- gsub("^f(.*)", "\\1.FFT", descriptiveNames)
descriptiveNames <- gsub("^anglet", "Angle", descriptiveNames)
descriptiveNames <- gsub("angle", "Angle", descriptiveNames)
descriptiveNames <- gsub("subject", "Subject", descriptiveNames)
descriptiveNames <- gsub("activity_label", "Activity.Label", descriptiveNames)
descriptiveNames <- gsub("activity", "Activity", descriptiveNames)
descriptiveNames <- gsub("gravity", "Gravity", descriptiveNames)
descriptiveNames <- gsub("mean", ".Mean.", descriptiveNames)
descriptiveNames <- gsub("std", ".STD.", descriptiveNames)
descriptiveNames <- gsub("\\.\\.", ".", descriptiveNames)
descriptiveNames <- gsub("\\.$", "", descriptiveNames)

colnames(data) <- descriptiveNames

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

newData <- aggregate(data, by = list(data$Subject, data$Activity.Label), FUN = mean)
# Remove duplicate columns and rename post-aggregation.
newData$Subject <- NULL
newData$Activity.Label <- NULL
colnames(newData)[1] <- "Subject"
colnames(newData)[2] <- "Activity.Label"

write.table(newData, file="subject_activity_averages.txt", row.names = FALSE)
