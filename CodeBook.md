# Project Description
## Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### Collection of the raw data
Data is provided in a zip file contains the following files:
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set with 561 measurements.
* 'train/y_train.txt': Each row identifies the activity for each window sample for training data. Its range is from 1 to 6.
* 'test/X_test.txt': Test set  with 561 measurements.
* 'test/y_test.txt': Each row identifies the activity for each window sample for test data. Its range is from 1 to 6.
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
The first and second variables are Activity(Factor) and Subject(Integer).                            
There are 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and 30 subjects which results in 180 (6 * 30) observations for the mean and standard deviation measurements(variables 3-68). Variable 1 and 2 are Activity and Subject respectively.

#####The variables(66 - numeric) for the mean and standard deviation measurements are as follows:
1. tBodyAcc-mean()-X - mean of body acceleration signal(time domain) in the X direction.
2. tBodyAcc-mean()-Y - mean of body acceleration signal(time domain) in the Y direction.
3. tBodyAcc-mean()-Z - mean of body acceleration signal(time domain) in the Z direction.
4. tGravityAcc-mean()-X - mean of gravity acceleration signal(time domain) in the X direction.
5. tGravityAcc-mean()-Y - mean of gravity acceleration signal(time domain) in the Y direction.
6. tGravityAcc-mean()-Z - mean of gravity acceleration signal(time domain) in the Z direction.
7. tBodyAccJerk-mean()-X - mean of body linear acceleration jerk signal (time domain) in the X direction.
8. tBodyAccJerk-mean()-Y - mean of body linear acceleration jerk signal(time domain) in the Y direction.
9. tBodyAccJerk-mean()-Z - mean of body linear acceleration jerk signal(time domain) in the Z direction.
10. tBodyGyro-mean()-X - mean of body gyroscope signal(time domain) in the X direction.
11. tBodyGyro-mean()-Y - mean of body gyroscope signal(time domain) in the Y direction.
12. tBodyGyro-mean()-Z - mean of body gyroscope signal(time domain) in the Z direction.
13. tBodyGyroJerk-mean()-X - mean of body angular velocity(time domain) of jerk signal in the X direction.
14. tBodyGyroJerk-mean()-Y - mean of body angular velocity(time domain) of jerk signal in the Y direction.
15. tBodyGyroJerk-mean()-Z - mean of body angular velocity(time domain) of jerk signal in the Z direction.
16. tBodyAccMag-mean() - mean of the magnitude(Euclidean norm) of body acceleration signal(time domain).
17. tGravityAccMag-mean() - mean of the magnitude(Euclidean norm) of gravity acceleration signal(time domain).
18. tBodyAccJerkMag-mean() - mean of the magnitude(Euclidean norm) of body acceleration jerk signal(time domain).
19. tBodyGyroMag-mean() - mean of the magnitude(Euclidean norm) of body gyroscope signal(time domain).
20. tBodyGyroJerkMag-mean() - mean of the magnitude(Euclidean norm) of body gyroscope jerk signal(time domain).
21. fBodyAcc-mean()-X - mean of body acceleration signal(frequency domain) in the X direction.
22. fBodyAcc-mean()-Y - mean of body acceleration signal(frequency domain) in the Y direction.
23. fBodyAcc-mean()-Z - mean of body acceleration signal(frequency domain) in the Z direction.
24. fBodyAccJerk-mean()-X - mean of body linear acceleration jerk signal (frequency domain) in the X direction.
25. fBodyAccJerk-mean()-Y - mean of body linear acceleration jerk signal (frequency domain) in the Y direction.
26. fBodyAccJerk-mean()-Z - mean of body linear acceleration jerk signal (frequency domain) in the Z direction.
27. fBodyGyro-mean()-X - mean of body gyroscope signal(frequency domain) in the X direction.
28. fBodyGyro-mean()-Y - mean of body gyroscope signal(frequency domain) in the Y direction.
29. fBodyGyro-mean()-Z - mean of body gyroscope signal(frequency domain) in the Z direction.
30. fBodyAccMag-mean() - mean of the magnitude(Euclidean norm) of body acceleration signal(frequency domain).
31. fBodyBodyAccJerkMag-mean() - mean of the magnitude(Euclidean norm) of body acceleration jerk signal(frequency domain).
32. fBodyBodyGyroMag-mean() - mean of the magnitude(Euclidean norm) of body gyroscope signal(frequency domain).
33. fBodyBodyGyroJerkMag-mean() - mean of the magnitude(Euclidean norm) of body gyroscope jerk signal(frequency domain).
34. tBodyAcc-std()-X - standard deviation of body acceleration signal(time domain) in the X direction.
35. tBodyAcc-std()-Y - standard deviation of body acceleration signal(time domain) in the Y direction.
36. tBodyAcc-std()-Z - standard deviation of body acceleration signal(time domain) in the Z direction.
37. tGravityAcc-std()-X - standard deviation of gravity acceleration signal(time domain) in the X direction.
38. tGravityAcc-std()-Y - standard deviation of gravity acceleration signal(time domain) in the Y direction.
39. tGravityAcc-std()-Z - standard deviation of gravity acceleration signal(time domain) in the Z direction.
40. tBodyAccJerk-std()-X - standard deviation of body linear acceleration jerk signal (time domain) in the X direction.
41. tBodyAccJerk-std()-Y - standard deviation of body linear acceleration jerk signal (time domain) in the Y direction.
42. tBodyAccJerk-std()-Z - standard deviation of body linear acceleration jerk signal (time domain) in the Z direction.
43. tBodyGyro-std()-X - standard deviation of body gyroscope signal(time domain) in the X direction.
44. tBodyGyro-std()-Y - standard deviation of body gyroscope signal(time domain) in the Y direction.
45. tBodyGyro-std()-Z - standard deviation of body gyroscope signal(time domain) in the Z direction.
46. tBodyGyroJerk-std()-X - standard deviation of body angular velocity(time domain) of jerk signal in the X direction.
47. tBodyGyroJerk-std()-Y - standard deviation of body angular velocity(time domain) of jerk signal in the Y direction.
48. tBodyGyroJerk-std()-Z - standard deviation of body angular velocity(time domain) of jerk signal in the Z direction.
49. tBodyAccMag-std() - standard deviation of the magnitude(Euclidean norm) of body acceleration signal(time domain).
50. tGravityAccMag-std() - standard deviation of the magnitude(Euclidean norm) of gravity acceleration signal(time domain).
51. tBodyAccJerkMag-std() - standard deviation of the magnitude(Euclidean norm) of body acceleration jerk signal(time domain).
52. tBodyGyroMag-std() - standard deviation of the magnitude(Euclidean norm) of body gyroscope signal(time domain).
53. tBodyGyroJerkMag-std() - standard deviation of the magnitude(Euclidean norm) of body gyroscope jerk signal(time domain).
54. fBodyAcc-std()-X - standard deviation of the magnitude(Euclidean norm) of body acceleration signal(frequency domain) in the X direction.
55. fBodyAcc-std()-Y - standard deviation of the magnitude(Euclidean norm) of body acceleration signal(frequency domain) in the Y direction.
56. fBodyAcc-std()-Z - standard deviation of the magnitude(Euclidean norm) of body acceleration signal(frequency domain) in the Z direction.
57. fBodyAccJerk-std()-X - standard deviation of body linear acceleration jerk signal (frequency domain) in the X direction.
58. fBodyAccJerk-std()-Y - standard deviation of body linear acceleration jerk signal (frequency domain) in the Y direction.
59. fBodyAccJerk-std()-Z - standard deviation of body linear acceleration jerk signal (frequency domain) in the Z direction.
60. fBodyGyro-std()-X - standard deviation of body gyroscope signal(frequency domain) in the X direction.
61. fBodyGyro-std()-Y - standard deviation of body gyroscope signal(frequency domain) in the Y direction.
62. fBodyGyro-std()-Z - standard deviation of body gyroscope signal(frequency domain) in the Z direction.
63. fBodyAccMag-std() - standard deviation of the magnitude(Euclidean norm) of body acceleration signal(frequency domain).
64. fBodyBodyAccJerkMag-std() - standard deviation of the magnitude(Euclidean norm) of body acceleration jerk signal(frequency domain).
65. fBodyBodyGyroMag-std() - standard deviation of the magnitude(Euclidean norm) of body gyroscope signal(frequency domain).
66. fBodyBodyGyroJerkMag-std() - mean of the magnitude(Euclidean norm) of body gyroscope jerk signal(frequency domain)
