# Project Description
## Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Collection of the raw data
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

## Creating the tidy datafile
### Guide to create the tidy data file
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
11. 
