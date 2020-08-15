## Setting Workspace
getwd()
setwd("../Getting and Cleaning Data")

## Downloading the project file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./DatasetCoursera.zip", method ="curl")
unzip("DatasetCoursera.zip")
list.files()

## Calling the libraries
library(dplyr)
library(plyr)

## Reading Test Datasets
X_test <- as_tibble(read.table("./UCI HAR Dataset/test/X_test.txt"))
y_test <- as_tibble(read.table("./UCI HAR Dataset/test/y_test.txt"))
subject_test <- as_tibble(read.table("./UCI HAR Dataset/test/subject_test.txt"))

## Reading Train Datasets
X_train <- as_tibble(read.table("./UCI HAR Dataset/train/X_train.txt"))
y_train <- as_tibble(read.table("./UCI HAR Dataset/train/y_train.txt"))
subject_train <- as_tibble(read.table("./UCI HAR Dataset/train/subject_train.txt"))

## Reading the names of the variables and assigning them to the datasets
names <- read.table("./UCI HAR Dataset/features.txt")
names(X_test) <- names[,2]
names(X_train) <- names[,2]
names(y_test) <- c("Activity_ID")
names(y_train) <- c("Activity_ID")
names(subject_test) <- c("Subject")
names(subject_train) <- c("Subject")

## Reading Activity Labels files and assigning the names to the columns
act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
names(act_labels) <- c("Activity_ID","Activity")

## 1. Merges the training and the test sets to create one data set.
mergedX <- bind_rows(X_test,X_train)
mergedY <- bind_rows(y_test,y_train)
mergedSubject <- bind_rows(subject_test,subject_train)
mergedDataset <- bind_cols(mergedSubject,mergedY,mergedX)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
mergedDataset <- select(mergedDataset, Subject, Activity_ID,contains(c("mean","std")))

## 3. Uses descriptive activity names to name the activities in the data set
mergedDataset <- full_join(mergedDataset,act_labels,by="Activity_ID",copy=FALSE)
mergedDataset <- mergedDataset %>% relocate(Activity, .after = Activity_ID)

## 4. Appropriately labels the data set with descriptive variable names.
names(mergedDataset) <- names(mergedDataset) %>% 
  gsub("BodyBody","Body", .) %>%
  gsub("^t","Time", .) %>%
  gsub("^f","Frequence", .) %>%
  gsub("Gyro","Gyroscope", .) %>%
  gsub("Mag","Magnitude", .) %>%
  gsub("Acc","Accelerometer", .) %>%
  gsub("meanFreq()-","MeanFrequency-", .) %>%
  gsub("mean()","Mean", .) %>%
  gsub("std()","StandardDeviation", .) %>%
  gsub("angle","Angle",.) %>%
  gsub("tBody","TimeBody",.) %>%
  gsub("gravity","Gravity",.)

## 5. From the data set in step 4, creates a second, independent tidy data set with 
## the average of each variable for each activity and each subject.

AvgDataset <- mergedDataset %>%
  group_by(Subject, Activity) %>%
  summarise_each(list(mean = mean), -Activity_ID)

write.table(AvgDataset, "AvgDataset.txt", row.name=FALSE)

