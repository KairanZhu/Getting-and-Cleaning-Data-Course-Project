This file is a code book that describes the variables, the data, and transformations, work that I performed to clean up the data.
The link where the data was obtained for the project: 
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Variables in the data set:
  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

	tBodyAcc-XYZ
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc-XYZ
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

	mean(): Mean value
	std(): Standard deviation
	mad(): Median absolute deviation 
	max(): Largest value in array
	min(): Smallest value in array
	sma(): Signal magnitude area
	energy(): Energy measure. Sum of the squares divided by the number of values. 
	iqr(): Interquartile range 
	entropy(): Signal entropy
	arCoeff(): Autorregresion coefficients with Burg order equal to 4
	correlation(): correlation coefficient between two signals
	maxInds(): index of the frequency component with largest magnitude
	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
	skewness(): skewness of the frequency domain signal 
	kurtosis(): kurtosis of the frequency domain signal 
	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
	angle(): Angle between to vectors.



### Data cleaning steps:
#### Step 1: Merges the training and the test sets to create one data set. 
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

#### Step 3: Uses descriptive activity names to name the activities in the data set.   
    Read activity_labels.txt file and store it in activity;
    Clean the activity names in the second column of activity;
    Transform the values of Label according to the activity data frame.

#### Step 4: Appropriately labels the data set with descriptive activity names.
    Combine the Subject, Label and Data by column to get a data frame, called cleanedData;
    Write the cleanedData out to data_merged.txt.
	
#### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    Generate the final tidy data set with the average of each measurement for each activity and each subject.

