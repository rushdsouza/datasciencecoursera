# Project Description
## Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### Collection of the raw data
Data is provided in a zip file contains the following files:
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample for training data. Its range is from 1 to 30. 
* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample for test data. Its range is from 1 to 30. 

## Notes on the original (raw) data
PLEASE ignore the data in the directory, Inertial Signals in the test and train directories

### Creating the tidy datafile
#### Guide to create the tidy data file
1. Download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Unzip and extract zip file to the working directory.
3. Read the activity_labels.txt in the directory, "UCI HAR Dataset" into a data frame with two variables(columns), first for the activity labels(1 to 6) and second for the activity names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,  LAYING).
4. Read the test and training activity labels data sets into data frames.(test/y_test.txt and train/y_train.txt). Each observation in the test and training data sets is associated with an activity label.
5. Map each activity label in the test and training activity labels data sets(step 4) to activity name from step 3 using join{plyr}.
6. Read the test and training subject data sets into data frames.(test/subject_test.txt and train/subject_train.txt). Each observation in the test and training data sets is associated with a subject.
7. Read the features(variable names) for the test and training data sets into a data frame.
8. Assign results of step 7(second column containing variable names) to be column names to the result of step 6.
9. Merge the columns Activity(step5), Subject(Step6) to the data frame from step (6-8).
10. Merge the test and training data frames to create a merged dat frame.
11. Get the variables(column names) that match mean and standard deviation measurements from step 10 and create the final data frame with Activity, Subject and mean and standard deviation measurements.
12. Use the melt{reshape2} function to create a data frame for each measurement grouped by Activity and Subject.
13. Use dcast{reshape2} to get the average of each measurement grouped by Activity and Subject. This is the tidy data.
14. Use write.table to wirte a file,TidyData.txt to the working directory.

#### Description of the variables in the TidyData.txt file

Dimensions of TidyData.txt: 180 observations(rows)
                            68 variables(columns)
                            
There are 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and 30 subjects which results in 180 (6 * 30) observations for the mean and standard deviation measurements(variables 3-68). Variable 1 and 2 are Activity and Subject respectively.
The variables for the mean and standard deviation measurements are as follows:
tBodyAcc-mean()-X - mean of body acceleration signal(time domain) in the X direction
tBodyAcc-mean()-Y - mean of body acceleration signal(time domain) in the Y direction
tBodyAcc-mean()-Z - mean of body acceleration signal(time domain) in the Z direction
tGravityAcc-mean()-X - mean of gravity acceleration signal(time domain) in the X direction
tGravityAcc-mean()-Y - mean of gravity acceleration signal(time domain) in the Y direction
tGravityAcc-mean()-Z - mean of gravity acceleration signal(time domain) in the Z direction
tBodyAccJerk-mean()-X - mean of body linear acceleration jerk signal (time domain) in the X direction
tBodyAccJerk-mean()-Y - mean of body linear acceleration jerk signal(time domain) in the Y direction
tBodyAccJerk-mean()-Z - mean of body linear acceleration jerk signal(time domain) in the Z direction
tBodyGyro-mean()-X - mean of body gyroscope signal(time domain) in the X direction
tBodyGyro-mean()-Y - mean of body gyroscope signal(time domain) in the Y direction
tBodyGyro-mean()-Z - mean of body gyroscope signal(time domain) in the Z direction
tBodyGyroJerk-mean()-X - mean of body angular velocity(time domain) of jerk signal in the X direction
tBodyGyroJerk-mean()-Y - mean of body angular velocity(time domain) of jerk signal in the Y direction
tBodyGyroJerk-mean()-Z - mean of body angular velocity(time domain) of jerk signal in the Z direction
tBodyAccMag-mean() - mean of the magnitude(Euclidean norm) of body acceleration signal(time domain)
tGravityAccMag-mean() - mean of the magnitude(Euclidean norm) of gravity acceleration signal(time domain)
tBodyAccJerkMag-mean() - mean of the magnitude(Euclidean norm) of body acceleration jerk signal(time domain)
tBodyGyroMag-mean() - mean of the magnitude(Euclidean norm) of body gyroscope signal(time domain)
tBodyGyroJerkMag-mean() - mean of the magnitude(Euclidean norm) of body gyroscope jerk signal(time domain)
fBodyAcc-mean()-X - mean of body acceleration signal(frequency domain) in the X direction
fBodyAcc-mean()-Y - mean of body acceleration signal(frequency domain) in the Y direction
fBodyAcc-mean()-Z - mean of body acceleration signal(frequency domain) in the Z direction
fBodyAccJerk-mean()-X - mean of body linear acceleration jerk signal (frequency domain) in the X direction
fBodyAccJerk-mean()-Y - mean of body linear acceleration jerk signal (frequency domain) in the Y direction
fBodyAccJerk-mean()-Z - mean of body linear acceleration jerk signal (frequency domain) in the Z direction
fBodyGyro-mean()-X - mean of body gyroscope signal(frequency domain) in the X direction
fBodyGyro-mean()-Y - mean of body gyroscope signal(frequency domain) in the Y direction
fBodyGyro-mean()-Z - mean of body gyroscope signal(frequency domain) in the Z direction
fBodyAccMag-mean() - mean of the magnitude(Euclidean norm) of body acceleration signal(frequency domain) 
fBodyBodyAccJerkMag-mean() - mean of the magnitude(Euclidean norm) of body acceleration jerk signal(frequency domain) 
fBodyBodyGyroMag-mean() - mean of the magnitude(Euclidean norm) of body gyroscope signal(frequency domain)
fBodyBodyGyroJerkMag-mean() - mean of the magnitude(Euclidean norm) of body gyroscope jerk signal(frequency domain)
tBodyAcc-std()-X - standard deviation of body acceleration signal(time domain) in the X direction          
tBodyAcc-std()-Y - standard deviation of body acceleration signal(time domain) in the Y direction          
tBodyAcc-std()-Z - standard deviation of body acceleration signal(time domain) in the Z direction          
tGravityAcc-std()-X - standard deviation of gravity acceleration signal(time domain) in the X direction
tGravityAcc-std()-Y - standard deviation of gravity acceleration signal(time domain) in the Y direction
tGravityAcc-std()-Z - standard deviation of gravity acceleration signal(time domain) in the Z direction
tBodyAccJerk-std()-X - standard deviation of body linear acceleration jerk signal (time domain) in the X direction 
tBodyAccJerk-std()-Y - standard deviation of body linear acceleration jerk signal (time domain) in the Y direction 
tBodyAccJerk-std()-Z - standard deviation of body linear acceleration jerk signal (time domain) in the Z direction 
tBodyGyro-std()-X - standard deviation of body gyroscope signal(time domain) in the X direction 
tBodyGyro-std()-Y - standard deviation of body gyroscope signal(time domain) in the Y direction 
tBodyGyro-std()-Z - standard deviation of body gyroscope signal(time domain) in the Z direction 
tBodyGyroJerk-std()-X - standard deviation of body angular velocity(time domain) of jerk signal in the X direction
tBodyGyroJerk-std()-Y - standard deviation of body angular velocity(time domain) of jerk signal in the Y direction
tBodyGyroJerk-std()-Z - standard deviation of body angular velocity(time domain) of jerk signal in the Z direction
tBodyAccMag-std() - standard deviation of the magnitude(Euclidean norm) of body acceleration signal(time domain)
tGravityAccMag-std() - standard deviation of the magnitude(Euclidean norm) of gravity acceleration signal(time domain)
tBodyAccJerkMag-std() - standard deviation of the magnitude(Euclidean norm) of body acceleration jerk signal(time domain)
tBodyGyroMag-std() - standard deviation of the magnitude(Euclidean norm) of body gyroscope signal(time domain)
tBodyGyroJerkMag-std() - standard deviation of the magnitude(Euclidean norm) of body gyroscope jerk signal(time domain)
fBodyAcc-std()-X - standard deviation of the magnitude(Euclidean norm) of body acceleration signal(frequency domain) in the X direction
fBodyAcc-std()-Y - standard deviation of the magnitude(Euclidean norm) of body acceleration signal(frequency domain) in the Y direction
fBodyAcc-std()-Z - standard deviation of the magnitude(Euclidean norm) of body acceleration signal(frequency domain) in the Z direction
fBodyAccJerk-std()-X - standard deviation of body linear acceleration jerk signal (frequency domain) in the X direction
fBodyAccJerk-std()-Y - standard deviation of body linear acceleration jerk signal (frequency domain) in the Y direction
fBodyAccJerk-std()-Z - standard deviation of body linear acceleration jerk signal (frequency domain) in the Z direction
fBodyGyro-std()-X - standard deviation of body gyroscope signal(frequency domain) in the X direction
fBodyGyro-std()-Y - standard deviation of body gyroscope signal(frequency domain) in the Y direction
fBodyGyro-std()-Z - standard deviation of body gyroscope signal(frequency domain) in the Z direction
fBodyAccMag-std() - standard deviation of the magnitude(Euclidean norm) of body acceleration signal(frequency domain) 
fBodyBodyAccJerkMag-std() - standard deviation of the magnitude(Euclidean norm) of body acceleration jerk signal(frequency domain) 
fBodyBodyGyroMag-std() - standard deviation of the magnitude(Euclidean norm) of body gyroscope signal(frequency domain)
fBodyBodyGyroJerkMag-std() - mean of the magnitude(Euclidean norm) of body gyroscope jerk signal(frequency domain)
