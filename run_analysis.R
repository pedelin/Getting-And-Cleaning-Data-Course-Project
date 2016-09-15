library(data.table)
# File URL
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# File name
filename <- "getdata_projectfiles.zip"
# Download and unzip file if not in wd
if(!file.exists(filename)){
        download.file(fileUrl,filename)
        unzip(filename)
        # Removing zip-file
        file.remove(filename)
}
# Read the Train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = " ", header = FALSE)

# Read the Test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = " ", header = FALSE)

## 1. Merges the training and the test sets to create one data set.
# Bind the y, x, and subject data by column and  row bind the test and training
Total <- rbind(cbind(x_train,subject_train,y_train),cbind(x_test,subject_test,y_test))


# Read the activities and features
features <- read.table("UCI HAR Dataset/features.txt", sep = " ", header = FALSE)
activities <- read.table("UCI HAR Dataset/activity_labels.txt", sep = " ", header = FALSE)
colnames(Total) <- c(as.character(features[,2]),"SubjectID","ActivityID")

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 
MeanSTD <- Total[,(grepl("-mean",colnames(Total))|grepl("std()",colnames(Total))|grepl("ActivityID",colnames(Total))|grepl("SubjectID",colnames(Total)))==TRUE]

## 3. Uses descriptive activity names to name the activities in the data set
# Define column names for activities data frame
colnames(activities)<-c("ActivityID","Activity")
#Merging activities data frame with mean and standrd deviation dataframe
Activity_MeanSTD <- merge(MeanSTD,activities,by='ActivityID')
#Removing the ActvityID column
Activity_MeanSTD$ActivityID<-NULL

## 4. Appropriately labels the data set with descriptive variable names. 
# Defning a temp variable with the column names
columns_tmp <- colnames(Activity_MeanSTD)
# Rechaping the column names
columns_tmp<- gsub("\\()","",columns_tmp)
columns_tmp<- gsub("(-[Mm]ean)","-Mean",columns_tmp)
columns_tmp<- gsub("(-[Ss]td)","-STD",columns_tmp)
columns_tmp<- gsub("([Gg]ravity)","-Gravity",columns_tmp)
columns_tmp<- gsub("([Ff]req)","-Freq",columns_tmp)
columns_tmp<- gsub("([Jj]erk)","-Jerk",columns_tmp)
columns_tmp<- gsub("([Gg]yro)","-Gyro",columns_tmp)
columns_tmp<- gsub("([Aa]cc)","-Acc",columns_tmp)
columns_tmp<- gsub("([Mm]ag)","-Mag",columns_tmp)
columns_tmp<- gsub("([Bb]ody[Bb]ody|[Bb]ody)","-Body",columns_tmp)
columns_tmp<- gsub("^(t)","Time",columns_tmp)
columns_tmp<- gsub("^(f)","Freq",columns_tmp)
# Updating the column names
colnames(Activity_MeanSTD)<-columns_tmp

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

FinalTidy <- aggregate(. ~ Activity+SubjectID, Activity_MeanSTD,mean)

write.table(FinalTidy,file="FinalTidy.txt")


