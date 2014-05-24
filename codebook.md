Study Design

The description of the data set was obtained from the following website: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
 Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating 
the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a 
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating
 variables from the time and frequency domain."

The R code included, run_analysis.R reads the information obtained by this study and creates a data frame that contains 
the id of the subjects that participated in the experiment, a description of the activities they were performing when
the measures were taken, and the measures that include mean and std data.
The files provides were analyzed to decide the best way to combine the data. The data has two groups: train and test.

The y_train and y_test files have records with values 1 to 6. These values represent the activity code


The subject_train and subject_test files  have records with values 1 to 30. These values represent the ids of the subjects that 
participated in the experiment.

The X_train and X_test files have 561 columns. These number matches with the number of records of the features file. 
For the analysis, it is considered that the each column in "features" matches with the corresponding in "X_train" 
and "X_test"  to identify the description. This description will be used to select the columns that correspond to "mean" or "std"

Code Book

The file result_tydy.txt has 89 columns. The field separator is a comma. The first column of the file is a unique identifier
Following is a description of the remaining columns:
subjectid = unique identifier of the 30 people that participated in the study. Possible values: 1 to 30
activity = description of the activity performed by the subject when the measure was taken. Possible values: 
LAYING
SITTING
STANDING
WALKING
WALKING_DOWNSTAIRS
WALKING_UPSTAIRS


The remaining columns are the average of the mean and std measures, the list of the variables is:
Average_tBodyAcc.mean.X
Average_tBodyAcc.mean.Y
Average_tBodyAcc.mean.Z
Average_tBodyAcc.std.X
Average_tBodyAcc.std.Y
Average_tBodyAcc.std.Z
Average_tGravityAcc.mean.X
Average_tGravityAcc.mean.Y
Average_tGravityAcc.mean.Z
Average_tGravityAcc.std.X
Average_tGravityAcc.std.Y
Average_tGravityAcc.std.Z
Average_tBodyAccJerk.mean.X
Average_tBodyAccJerk.mean.Y
Average_tBodyAccJerk.mean.Z
Average_tBodyAccJerk.std.X
Average_tBodyAccJerk.std.Y
Average_tBodyAccJerk.std.Z
Average_tBodyGyro.mean.X
Average_tBodyGyro.mean.Y
Average_tBodyGyro.mean.Z
Average_tBodyGyro.std.X
Average_tBodyGyro.std.Y
Average_tBodyGyro.std.Z
Average_tBodyGyroJerk.mean.X
Average_tBodyGyroJerk.mean.Y
Average_tBodyGyroJerk.mean.Z
Average_tBodyGyroJerk.std.X
Average_tBodyGyroJerk.std.Y
Average_tBodyGyroJerk.std.Z
Average_tBodyAccMag.mean
Average_tBodyAccMag.std
Average_tGravityAccMag.mean
Average_tGravityAccMag.std
Average_tBodyAccJerkMag.mean
Average_tBodyAccJerkMag.std
Average_tBodyGyroMag.mean
Average_tBodyGyroMag.std
Average_tBodyGyroJerkMag.mean
Average_tBodyGyroJerkMag.std
Average_fBodyAcc.mean.X
Average_fBodyAcc.mean.Y
Average_fBodyAcc.mean.Z
Average_fBodyAcc.std.X
Average_fBodyAcc.std.Y
Average_fBodyAcc.std.Z
Average_fBodyAcc.meaneq.X
Average_fBodyAcc.meaneq.Y
Average_fBodyAcc.meaneq.Z
Average_fBodyAccJerk.mean.X
Average_fBodyAccJerk.mean.Y
Average_fBodyAccJerk.mean.Z
Average_fBodyAccJerk.std.X
Average_fBodyAccJerk.std.Y
Average_fBodyAccJerk.std.Z
Average_fBodyAccJerk.meaneq.X
Average_fBodyAccJerk.meaneq.Y
Average_fBodyAccJerk.meaneq.Z
Average_fBodyGyro.mean.X
Average_fBodyGyro.mean.Y
Average_fBodyGyro.mean.Z
Average_fBodyGyro.std.X
Average_fBodyGyro.std.Y
Average_fBodyGyro.std.Z
Average_fBodyGyro.meaneq.X
Average_fBodyGyro.meaneq.Y
Average_fBodyGyro.meaneq.Z
Average_fBodyAccMag.mean
Average_fBodyAccMag.std
Average_fBodyAccMag.meaneq
Average_fBodyBodyAccJerkMag.mean
Average_fBodyBodyAccJerkMag.std
Average_fBodyBodyAccJerkMag.meaneq
Average_fBodyBodyGyroMag.mean
Average_fBodyBodyGyroMag.std
Average_fBodyBodyGyroMag.meaneq
Average_fBodyBodyGyroJerkMag.mean
Average_fBodyBodyGyroJerkMag.std
Average_fBodyBodyGyroJerkMag.meaneq
Average_angle.tBodyAccmean.gravity.
Average_angle.tBodyAccJerkmean..gravitymean.
Average_angle.tBodyGyromean.gravitymean.
Average_angle.tBodyGyroJerkmean.gravitymean.
Average_angle.X.gravitymean.
Average_angle.Y.gravitymean.
Average_angle.Z.gravitymean.

Instruction List

The attached run_analysis.R file performs the following tasks:
- Read the zip file
- Unzip the file
- Reads the files and creates data frames
- Merges the data frames to create one data frame that includes: the subject id, the activities description, the features measured that are
 related to a "mean" or "std" measure
- Create another data frame that calculates the average of the features by subject id and activity
- Modifies the labels of the data frame to make it human readable and apply the criteria to be a tidy data set
- Create a txt file with the tidy data set

