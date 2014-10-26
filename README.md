GetData_CourseProject
=====================

Repository of Course Project of "Getting and Cleaning Data" course of "Data Science" specialization on Coursera

Original dataset
----------------
Dataset for the project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It will be downloaded (if needed) and unziped automatically when you run the **run_analysys.R** script.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Main script
-----------
**run_analysys.R** works in following steps:
* download and unzip the dataset (only if needed)
* extract names of measurements on the mean and standard deviation for each measurement (using a file with names of all       measurements)
* read data for only measurements of interest and add two additional columns -- subject and activity (from separate files)    (this for test and train datasets)
* merging train and test datasets
* read labels for activities from separate file and assign them to the dataset
* construct resulting (the tidy) dataset with average of each variable for each activity and each subject
* write the tidy datase (as **tidy.txt**)

Code Book
---------
**CodeBook.md** contains explanalion of resulting dataset (**tidy.txt**)

