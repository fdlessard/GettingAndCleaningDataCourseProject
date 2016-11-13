# François-David Lessard
#
# fdlessard@gmail.com
#
# Peer-graded Assignment: Getting and Cleaning Data Course Project
# 

# Load dplyr library
library(dplyr)

# Filenames of the datasets
features_filename <- "UCI HAR Dataset/features.txt"
activity_labels_filename <- "UCI HAR Dataset/activity_labels.txt"
x_train_filename <- "UCI HAR Dataset/train/X_train.txt"
x_test_filename <- "UCI HAR Dataset/test/X_test.txt"
y_train_filename <- "UCI HAR Dataset/train/y_train.txt"
y_test_filename <- "UCI HAR Dataset/test/y_test.txt"
subject_train_filename <- "UCI HAR Dataset/train/subject_train.txt"
subject_test_filename <- "UCI HAR Dataset/test/subject_test.txt"

# Read the variable names
features <- read.table(features_filename)
featuresIndex <- grep("*mean*|*std*", features$V2)
headersName <- features$V2[featuresIndex]

# Read the activity labels
activity_labels <- read.table(activity_labels_filename)

# Merge x_train, x_test into x_data
x_train <- read.table(x_train_filename)
x_test <- read.table(x_test_filename)
x_data <- rbind(x_train, x_test)

# Merge y_train, _test into y_data
y_train <- read.table(y_train_filename)
y_test <- read.table(y_test_filename)
y_data <- rbind(y_train, y_test)

# Join with labels
y_data <- left_join(y_data, activity_labels, by = c("V1"))
  
# Merge subject_train, subject_test into subject_data
subject_train <- read.table(subject_train_filename)
subject_test <- read.table(subject_test_filename)
subject_data <- rbind(subject_train, subject_test)

# Filter non std mean colums
x_data  <- x_data [ , featuresIndex ]
# Add labels
colnames(x_data) <-  features$V2[featuresIndex]

# Merge dataset colums
x_data <- cbind(x_data, subject_data, y_data[, 2])

# Add labels
headersName <- features$V2[featuresIndex]
colnames(x_data)[colnames(x_data)=="y_data[, 2]"] <- "Activity"
colnames(x_data)[80] <- "Subject"

#Mean by activity
x_data <- x_data %>% group_by(Activity, Subject ) %>% summarise_each(funs(mean))

# Save tidy datasets
output_filename = "UCI HAR Dataset/tidy.txt"
write.table(x_data, file = output_filename, row.name=FALSE) 