This file is a code book that describes the variables, the data, and transformations, work that I performed to clean up the data.
The link where the data was obtained for the project: 
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data cleaning steps:
### Step 1: Merges the training and the test sets to create one data set. 
    Read X_train.txt and store it in trainData;
    Read y_train.txt and store it in trainLabel;
    Read subject_train.txt and store it in trainSubject.
    Read X_test.txt and store it in testData;
    Read y_test.txt and store it in testLabel;
    Read subject_test.txt and store it in testSubject.
    Concatenate test and train to get a data frame, called Data, Label, and Subject.
	
### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.      	
    Read features.txt and store it in features;
    Extract only the measurements on the mean and standard deviation results in a 66 indices list;
    Get a subset of joinData with the 66 corresponding columns;
    Clean the column names of the subset.

### Step 3: Uses descriptive activity names to name the activities in the data set.   
    Read activity_labels.txt file and store it in activity;
    Clean the activity names in the second column of activity;
    Transform the values of Label according to the activity data frame.

### Step 4: Appropriately labels the data set with descriptive activity names.
    Combine the Subject, Label and Data by column to get a data frame, called cleanedData;
    Write the cleanedData out to data_merged.txt.
	
### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    Generate the final tidy data set with the average of each measurement for each activity and each subject.

