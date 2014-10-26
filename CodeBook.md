Code Book
=========

This document describes the variables, the data, and any transformations or work that you performed to clean up the data.

Original dataset
----------------
Dataset for the project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It will be downloaded (if needed) and unziped automatically when you run the **run_analysys.R** script.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Variables
---------
Description of original variables can be found in **README.txt** file of original dataset:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For this analysis only the measurements on the mean and standard deviation for each measurement are taken. 

List of features:
* tBodyAcc (6 variables: mean and std per x,y,z)
* tGravityAcc (6 variables: mean and std per x,y,z)
* tBodyAccJerk (6 variables: mean and std per x,y,z)
* tBodyGyro (6 variables: mean and std per x,y,z)
* tBodyGyroJerk (6 variables: mean and std per x,y,z)
* tBodyAccMag (2 variables: mean and std)
* tGravityAccMag (2 variables: mean and std)
* tBodyAccJerkMag (2 variables: mean and std)
* tBodyGyroMag (2 variables: mean and std)
* tBodyGyroJerkMag (2 variables: mean and std)
* fBodyAcc (6 variables: mean and std per x,y,z)
* fBodyAccJerk (6 variables: mean and std per x,y,z)
* fBodyGyro (6 variables: mean and std per x,y,z)
* fBodyAccMag (2 variables: mean and std)
* fBodyBodyAccJerkMag (2 variables: mean and std)
* fBodyBodyGyroMag (2 variables: mean and std)
* fBodyBodyGyroJerkMag (2 variables: mean and std)

The naming convention is ***{feature}-(mean|std)-[xyz]*** for spatial features and ***{feature}-(mean|std)*** for non-spatial features.

Transformations
----------------
**run_analysys.R** works in following steps:
* download and unzip the dataset (only if needed)
* extract names of measurements on the mean and standard deviation for each measurement (using a file with names of all measurements)
* read data for only measurements of interest and add two additional columns -- subject and activity (from separate files) (this for test and train datasets)
* merging train and test datasets
* read labels for activities from separate file and assign them to the dataset
* construct resulting (the tidy) dataset with average of each variable for each activity and each subject
* write the tidy datase (as **tidy.txt**)

Result
------
The final dataset contains a column for each feature with average for each activity and each subject (subject and activity labels are in first two columns)

