# Code Book
In this code book the variables, the data, and any transformations or work that is performed to clean up the data are presented.

## Sources
The sources for the project are:

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
`git status`
## Code description and variables
The description of the code and the defined variables are presented below for every step in the project description

1. Downloding and unzipping data set (if not already in working directory and then reading relevant files to R, ref. see "Sources" below.
  * Reading the files to `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test`. 
2. Merges the training and the test sets to create one data set. 
  * Merging the test and training data by column separetly and the binding them by rows to create one data set, variable name: `Total`
3. Extracts only the measurements on the mean and standard deviation for each measurement.
  * From the data set `Total` the column names that includes the mean and the standard deviation are used to subset a data set contianing only these values. Variable name: `MeanSTD`
4. Uses descriptive activity names to name the activities in the data set
  * The activity identifyer `ActivityID` is used to merge the activies data with the `MeanSTD` data set. When merged `ActivityID` is removed from data set keeping only the activity name. Merged dataset variable name: `Activity_MeanSTD`
5. Appropriately labels the data set with descriptive variable names. 
  * The variable names are changed to include capital first letter, separtion by "-", and clarification of t for time and f for frequency. Also the empty paranthasis are removed.
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  * A subset, variable name `FinalTidy` including average of each variable for each activity and each subject are created using `aggregate()` funciton in R. This subset is written to a file called "FinalTidy.txt"
 
## About the Data (from README.txt in data from Source)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For more information about the data see descriptive .txt files from Source

