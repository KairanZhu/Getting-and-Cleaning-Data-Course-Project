# Step 1 
# Merge the training and the test sets to create one data set
trainData <- read.table("./train/X_train.txt")
trainLabel <- read.table("./train/y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")
testData <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt") 
testSubject <- read.table("./test/subject_test.txt")
Data <- rbind(trainData, testData)
Label <- rbind(trainLabel, testLabel)
Subject <- rbind(trainSubject, testSubject)


# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
features <- read.table("./features.txt")
meanstdIn <- grep("mean\\(\\)|std\\(\\)", features[, 2])
Data <- Data[, meanstdIn]
names(Data) <- gsub("\\(\\)", "", features[meanStdIn, 2])
names(Data) <- gsub("-", "", names(Data))  


# Step 3
# Use descriptive activity names to name the activities in the data set
activity <- read.table("./activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[Label[, 1], 2]
Label[, 1] <- activityLabel
names(Label) <- "activity"


# Step 4
# Appropriately labels the data set with descriptive activity names
names(Subject) <- "subject"
cleanedData <- cbind(Subject, Label, Data)
write.table(cleanedData, "data_merged.txt")


# Step 5
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject 
result <- aggregate(cleanedData[, 3:ncol(cleanedData)],
                       by=list(cleanedData$subject, cleanedData$activity), mean)
                                     
write.table(result, "tidy_data_with_avg.txt", row.name=FALSE)
