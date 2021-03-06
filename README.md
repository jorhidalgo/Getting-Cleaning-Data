Getting-Cleaning-Data
=====================

Getting and Cleaning Data Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
 The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a 
series of yes/no questions related to the project. You will be required to submit:
1) a tidy data set as described below,
2) a link to a Github repository with your script for performing the analysis, 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up 
the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
This repo explains how all of the scripts work and how they are connected.  

The data is avaialble in:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


The deliverables for the project are:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


The attached run_analysis.R file performs the following tasks (this info is also in the section Instruction List of the codebook)
- Read the zip file
- Unzip the file
- Reads the files and creates data frames
- Merges the data frames to create one data frame that includes: the subject id, the activities description, the features measured that are
 related to a "mean" or "std" measure
- Create another data frame that calculates the average of the features by subject id and activity
- Modifies the labels of the data frame to make it human readable and apply the criteria to be a tidy data set
- Create a txt file with the tidy data set


 
 

