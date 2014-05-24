## run_analys.R


## read from website and unzip file

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
unzip(temp)

## Read files
features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"")
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"" , col.names = t(features[,2]))
X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"" ,col.names = t(features[,2]) )
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"", col.names= "activity")
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"" , col.names= "activity")

## create result data frame with train and test data
result <- rbind (X_train, X_test)
## Select labels that have "mean" and "std" in the name
features_labels_std_mean <- grepl (("std" ),t(features[,2]) , ignore.case = TRUE) | grepl (("mean" ),t(features[,2]) , ignore.case = TRUE)

## subset data frame to include only columns that have "mean" and "std" in the lables
result <-subset (result, select = features_labels_std_mean )

## Read activity labels
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", quote="\"")

## Add to data frame columns with activity data
result <- cbind( rbind (y_train, y_test),result)

## Read subject info
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", quote="\"", col.names= "subjectid")
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", quote="\"", col.names= "subjectid")

## Convert activity to a factor to display text not a code
result$activity <- factor(result$activity, levels = activity_labels$V1,labels = activity_labels$V2)

## Add to data frame columns with subject id
result <-  cbind( rbind (subject_train, subject_test),result)

### Create data frame with average value for each variable by subject and activity
result.tidy <- ddply(result, .(subjectid, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })

## modify the labels of the columns to make them "human readable"

labels.tidy <- names (result.tidy)
labels.tidy <- gsub("mean.." , "mean", labels.tidy)
labels.tidy <- gsub("std.." , "std", labels.tidy)
labels.tidy <- gsub("meaneq.." , "meaneq", labels.tidy)
labels.tidy <- gsub("Mean" , "mean", labels.tidy)
labels.tidy <- gsub("Std" , "std", labels.tidy)

colnames(result.tidy) <- labels.tidy

## Added Average to the variable names to specify value displayed is a Mean value

colnames(result.tidy)[-c(1:2)] <- paste( "Average_", colnames(result.tidy)[-c(1:2)],  sep="")

## Save tidy data set to csv file


write.csv (result.tidy, file = "result_tidy.txt")


