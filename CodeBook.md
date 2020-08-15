Coursera | Getting and Cleaning Data Final Project
================

## CodeBook

A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Variables

This project made use of the data included in six files of the URI HAR DATASET, X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt, subject_test.txt, and the information related to those data included in features.txt (where are contained the names of the variables << columns >> of the dataset), and activity_labels.txt (which contains the descriptive names of the activities).

Variables 

1. Subject (ID)
2. Activity (ID)
3. Mean, standard deviations and other measurements of the following variables:
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

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

# Modifications

These were the steps and modifications made to the dataset:

1. Merging the train and test datasets on a new dataset.
2. Extracting the the measurements on the mean and standard deviation for each measurement and the Subject and Activity_ID column.
3. Assigning the descriptive variable names to the activity by creating a new column (variable) called "Activity" that contains the descriptive name of the activity. 
4. Labeling the dataset columns with descriptive names
5. Creating a second dataset grouping by subject and activity and summarizing them with the mean value. 
6. Writing this final second dataset to the "AvgDataset.txt" file