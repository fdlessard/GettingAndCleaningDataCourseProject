# GettingAndCleaningDataCourseProject

#Assigment
You should create one R script called run_analysis.R that does the following.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Included files in project

Readme file: README.md
Script file: run_analysis.R 
CookBook file: CodeBook.md
Data files: UCI HAR Dataset\

# Result of script 

tidy.txt


# The script

We have here a single script (run_analysis.R) that 

- Reads the train and test files
- Merges then in a single table x_data
- Adds appropriate labels to the colums
- Groups the data accorting activity and subject to calculates the means
- Save to the file tidy.txt

# Excuting the script
source(run_analysis.R)