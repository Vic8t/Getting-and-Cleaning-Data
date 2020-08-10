library(data.table)
library(dplyr)


# Download UCI HAR Dataset if needed
if(!dir.exists("UCI HAR Dataset")){
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile = "UCI HAR Dataset.zip")
    unzip("UCI HAR Dataset.zip")
    file.remove("UCI HAR Dataset.zip")
}

# Load data
setwd("UCI HAR Dataset")
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

## Train data
setwd("train")
subject_train <- read.table("subject_train.txt")
X_train <- fread("X_train.txt") ## use of fread to improve reading speed
y_train <- read.table("y_train.txt")

## Test data
setwd("../test")
subject_test <- read.table("subject_test.txt")
X_test <- fread("X_test.txt")
y_test <- read.table("y_test.txt")

setwd("../..") ## restore root working directory

# Merge train and test sets
subject <- rbind(subject_train, subject_test)
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)

# Extract only the mean and standard deviation of each measurement
columns <- grep("mean\\(|std\\(", features$V2) ## find variable indexes containing mean( or std(
X <- select(X, columns)

# Change activity names
y <- activity_labels$V2[y$V1] ## match activity id with the corresponding value
dataset <- cbind(subject, y, X) ## merge subjects, activity labels and measurements

# Update variable names
## Get variable names and reformat them
variable_names <- grep("mean\\(|std\\(", features$V2, value = TRUE)
variable_names <- gsub("[()-]", "", variable_names)
variable_names <- gsub("mean", "Mean", variable_names)
variable_names <- gsub("std", "Std", variable_names)

## Set new names
variable_names <- c("subject", "activityLabel", variable_names)
setnames(dataset, variable_names)

# Average of each variable for each activity and subject
dataset_mean <- summarize_all(group_by(dataset, subject, activityLabel), mean)

# Save final data set
write.table(dataset_mean, "tidy_dataset.txt", row.names = FALSE)
