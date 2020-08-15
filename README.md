Coursera | Getting and Cleaning Data Final Project
================

## Getting and Cleaning Data Final Project Assignment | Data Science Specialization

This Github repo is a submission for the Getting and Cleaning Data Final
Project, and it contains the code for getting and cleaning a the Human
Activity Recognition Using Smartphones Dataset (dataset property of
SmartLab).

# Dataset

The Human Activity Recognition Using Smartphones Dataset can be downloaded with the following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Objective

This project assignment was written and executed by Nestor Ivan Parra Martinez, student of the JHU Data Science Specialization in Coursera. 

The objective is to describe how was performed the solution to the assignment of the course, that included the following sub-assignments:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Github Repo Content

1. A file called CodeBook.md, made to describes the variables, the data, and any transformations or work that was performed to clean up the data.
2. A file called run_analysis.R, used to perform the preparation of the data and the steps of the assignment. 
3. A file called AvgDataset.txt, made in the final point of the assignment.

## Steps for getting and cleaning the data set.

1. Setting the workspace.
2. Downloading and unzipping the dataset from the link provided. 
3. Calling the needed libraries.
4. Reading the datasets using the functions read.table and as_tibble, for a better dataframe handling. 
5. Reading the test and training datasets.
6. Reading the names of the features from the features.txt file.
7. Reading the activity labels from the file provided and assigning names to the columns of that file.
8. Merging the train and test datasets on a new dataset.
9. Extracting the the measurements on the mean and standard deviation for each measurement and the Subject and Activity_ID column.
10. Assigning the descriptive variable names to the activity.
11. Labeling the dataset columns with descriptive names
12. Creating a second dataset grouping by subject and activity and summarizing them with the mean value. 
13. Writing this final second dataset to the "AvgDataset.txt" file
