# Course project Getting and Cleaning Data

## Description
This is a Course project in the "Getting And Cleaning Data" Course given by Johns Hopkins University through Coursera.org.

The file run_analysis.R does the following:
1. Downloding and unzipping data set (if not already in working directory and then reading relevant files to R, ref. see "Sources" below. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names.
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The file output is a Tidy data set named "FinalTidy.txt".

## Sources
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Code Book
In CodeBook.md describtions of the variables, the data, and any transformations or work that is performed to clean up the data is presened.
