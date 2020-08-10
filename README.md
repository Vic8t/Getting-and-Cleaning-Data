# Getting and Cleaning Data

## Description
The goal of this project is to get and clean a data set from the UCI website.
The data set in question is the "Human Activity Recognition Using Smartphones Data Set" [1].

## Data set
You can find the raw data and information about it here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Script
After downloading (if needed) and loading the data set, the [R script](run_analysis.R) contained in this repository performs the following operations:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

You can run the script from R with:
```
source("run_analysis.R")
```

As a result, you will obtained the tidy data set described above in txt format.

## Code book
For more information about the data set and the different variables, check the [code book](CodeBook.md).

## Reference
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012