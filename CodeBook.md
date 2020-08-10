# Code book

## Raw data set
You can find all the information about the raw data by downloading it from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You will find details about files and variables in the `README.txt` and `features_info.txt` files.

## Data clean up and transformation
The raw data has been transformed through the following steps:

### 1. Merges the training and the test sets to create one data set
First, the script loads the data from `activity_labels.txt` and `features.txt` files, the train data from `train/subject_train.txt`, `train/X_train.txt` and `train/y_train.txt` files and the test data from `test/subject_test.txt`, `test/X_test.txt` and `test/y_test.txt` files. The fread() function is used to load the X_ files as they are large files.
Then, subject files are merged together as well as X and y files for train and test data sets.
The final merge of subject, X and y tables is made later because several operations are performed on each of them.

### 2. Extracts only the measurements on the mean and standard deviation for each measurement
Here, we filter the X table to select only variables containing `mean(` or `std(` using a regular expression.

### 3. Uses descriptive activity names to name the activities in the data set
The y table contains the id of the activity label of each measurement. So the script matches it with the corresponding name using the table loaded from the `activity_labels.txt` file.

### 4. Appropriately labels the data set with descriptive variable names
During this step, we take the values from `features.txt` with the same regular expression as in step 2 to put the variable names in the columns of X table. The subject and y columns, which are now merged with X, are respectively named `subject` and `activityLabel`.
Special characters are removed from the names and the first letter of `mean` and `std` are uppercased.

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Finally, a summarization is made on the dataset to extract the mean of each subject/activityLabel group.
The final data set is written to a txt file.

## Tidy data set
The tidy data set of dimension 180x68 has the following variables:

- subject: id of the subject for whom the measurement was made (from 1 to 30)
- activityLabel: activity performed during the measurement (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS or WALKING_UPSTAIRS)
- The 66 other variables are the mean and std of each measured signal (tBodyAccX, tBodyAccY, tBodyAccZ, tGravityAccX, tGravityAccY, tGravityAccZ, tBodyAccJerkX, tBodyAccJerkY, tBodyAccJerkZ, tBodyGyroX, tBodyGyroY, tBodyGyroZ, tBodyGyroJerkX, tBodyGyroJerkY, tBodyGyroJerkZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAccX, fBodyAccY, fBodyAccZ, fBodyAccJerkX, fBodyAccJerkY, fBodyAccJerkZ, fBodyGyroX, fBodyGyroY, fBodyGyroZ, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag and fBodyBodyGyroJerkMag)

You can find details about these variables in the `features_info.txt` file from the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Each raw is identifiable by its subject and activity label.
