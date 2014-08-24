The Original Data Set.
This programming project use the data collected from the accelerometers from the Samsung Galaxy S smartphone you can find it in this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
This data set was originally divided in two sub data sets, test and train, and has 4 helper files: Features that has the attributes of the measurements; features info that have explanations of each feature; activities labels that have the names of each experiment and README a file that explain the information collected. 

Initially we have these variables:

tBodyAcc-XYZ	tBodyAccMag
tGravityAcc-XYZ	tGravityAccMag
tBodyAccJerk-XYZ	tBodyAccJerkMag
tBodyGyro-XYZ	tBodyGyroMag
tBodyGyroJerk-XYZ	tBodyGyroJerkMag
fBodyAcc-XYZ	fBodyAccMag
fBodyAccJerk-XYZ	fBodyAccJerkMag
fBodyGyro-XYZ	fBodyGyroMag
 	fBodyGyroJerkMag

XYZ means that that each one of these variables has three dimensions X, Y and Z.
This data set had three different activities:

LAYING
SITTING
STANDING
WALKING
WALKING_DOWNSTAIRS
WALKING_UPSTAIRS.


Tidy Data Set.

In the tidy data set tidy_data_GCD that you get by running run_analysis.R you have this structure:
Subject/activities (Rows), Measurements (Columns)
So you have 1 descriptive column (subject_id and Activity_id) and 66 data columns one for each variable.

TimeBodyAccMeanX	TimeBodyGyroMeanX	TimeBodyGyroMagMean	FrequencyBodyGyroMeanZ
TimeBodyAccMeanY	TimeBodyGyroMeanY	TimeBodyGyroMagStd	FrequencyBodyGyroStdX
TimeBodyAccMeanZ	TimeBodyGyroMeanZ	TimeBodyGyroJerkMagMean	FrequencyBodyGyroStdY
TimeBodyAccStdX	TimeBodyGyroStdX	TimeBodyGyroJerkMagStd	FrequencyBodyGyroStdZ
TimeBodyAccStdY	TimeBodyGyroStdY	FrequencyBodyAccMeanX	FrequencyBodyAccMagMean
TimeBodyAccStdZ	TimeBodyGyroStdZ	FrequencyBodyAccMeanY	FrequencyBodyAccMagStd
TimeGravityAccMeanX	TimeBodyGyroJerkMeanX	FrequencyBodyAccMeanZ	FrequencyBodyAccJerkMagMean
TimeGravityAccMeanY	TimeBodyGyroJerkMeanY	FrequencyBodyAccStdX	FrequencyBodyAccJerkMagStd
TimeGravityAccMeanZ	TimeBodyGyroJerkMeanZ	FrequencyBodyAccStdY	FrequencyBodyGyroMagMean
TimeGravityAccStdX	TimeBodyGyroJerkStdX	FrequencyBodyAccStdZ	FrequencyBodyGyroMagStd
TimeGravityAccStdY	TimeBodyGyroJerkStdY	FrequencyBodyAccJerkMeanX	FrequencyBodyGyroJerkMagMean
TimeGravityAccStdZ	TimeBodyGyroJerkStdZ	FrequencyBodyAccJerkMeanY	FrequencyBodyGyroJerkMagStd
TimeBodyAccJerkMeanX	TimeBodyAccMagMean	FrequencyBodyAccJerkMeanZ	 
TimeBodyAccJerkMeanY	TimeBodyAccMagStd	FrequencyBodyAccJerkStdX	 
TimeBodyAccJerkMeanZ	TimeGravityAccMagMean	FrequencyBodyAccJerkStdY	 
TimeBodyAccJerkStdX	TimeGravityAccMagStd	FrequencyBodyAccJerkStdZ	 
TimeBodyAccJerkStdY	TimeBodyAccJerkMagMean	FrequencyBodyGyroMeanX	 
TimeBodyAccJerkStdZ	TimeBodyAccJerkMagStd	FrequencyBodyGyroMeanY	 

The function run_analysis.R has four basic steps:

1.	Make the raw data set to be treated 
Check if the file is in the working directory, if not download from the link presented hitherto. Then unzip the file in another working directory.
2.	  Used a helper function Read_Files_In_Original_Data_Set to get basics elements of each txt file, the names of variables from the features file for example.
In this part we use gsub function that replaces all occurrences of a pattern. It has this structure gsub(pattern, replacement, x) .
By the end of this function we had the structure of one data set that combine the subdata sets of both kind train and test and the elements of features.

3.	Then creates descriptive names for this data set by using one again gsub

4.	Finally  creates a  tidy data set called tidy_data_GCD.txt (GCD is the initial of Getting Cleaning Data)

If you had any question about this programing project do not hesitate to comment it in the repo.

