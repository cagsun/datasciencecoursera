# CODEBOOK FOR THE SCRIPT
==========================================

This repo is created by Çağsun Acemoğlu to demonstrate the work done for "Getting and Cleaning Data" course project.

The data used can be retrieved from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# Script Introduction

The script works on the raw files in the downloaded folder to create a tidy data set that is ready to make some analyses on. 

The steps of its operation are as follows:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a tidy data set file with the average of each variable for each activity and each subject.

In detail:

1. Loads the data into R for both training & test sets

	a. Loads Measurements Data
	b. Loads Subjects Data that shows measurements' subject person
	c. Loads Activity Data that shows which Activity measurements Belong To

2. Merges training & test sets in each of these 3 data sets with rbind() function (measurements, subjects, activities)
3. Sets descriptive header names to columns in these 3 datasets
4. Brings these 3 data frames together with cbind() function
5. Removes all variables that don't contain the word mean or std by subsetting; to leave only mean or standard devitation variables in the dataset.
6. Exchanges activity values with descriptive names instead of ID's.
7. Modifies variable names to make them more descriptive & informative
8. Summarizes the data by taking the mean of all variables for each subject & each activity using the aggregate() function from "plyr" library. 



The final tidy data set is created in a txt file in the same working folder with name "summaryData.txt"

Detailed information about what the script does can be found in the codebook.md file in this repo.

## Dependencies

You need to have "plyr" library installed to run the script.

## Variables

The output data set from this script shows the average of each variable for each activity and each subject. The first 2 variables are the subject & activity. The other variables are different features.

1. "subject" | The ID of the subject person making the measurement"
2. "activity" | The activity that the subject is making for the measurement

All the remaining variables listed below are showing the mean or standard deviation of a feature. 


"3" "time-BodyAcceleration--mean()-X"
"4" "time-BodyAcceleration--mean()-Y"
"5" "time-BodyAcceleration--mean()-Z"
"6" "time-BodyAcceleration--std()-X"
"7" "time-BodyAcceleration--std()-Y"
"8" "time-BodyAcceleration--std()-Z"
"9" "time-GravityAcceleration--mean()-X"
"10" "time-GravityAcceleration--mean()-Y"
"11" "time-GravityAcceleration--mean()-Z"
"12" "time-GravityAcceleration--std()-X"
"13" "time-GravityAcceleration--std()-Y"
"14" "time-GravityAcceleration--std()-Z"
"15" "time-BodyAcceleration-Jerk-mean()-X"
"16" "time-BodyAcceleration-Jerk-mean()-Y"
"17" "time-BodyAcceleration-Jerk-mean()-Z"
"18" "time-BodyAcceleration-Jerk-std()-X"
"19" "time-BodyAcceleration-Jerk-std()-Y"
"20" "time-BodyAcceleration-Jerk-std()-Z"
"21" "time-BodyRotationSpeed--mean()-X"
"22" "time-BodyRotationSpeed--mean()-Y"
"23" "time-BodyRotationSpeed--mean()-Z"
"24" "time-BodyRotationSpeed--std()-X"
"25" "time-BodyRotationSpeed--std()-Y"
"26" "time-BodyRotationSpeed--std()-Z"
"27" "time-BodyRotationSpeed-Jerk-mean()-X"
"28" "time-BodyRotationSpeed-Jerk-mean()-Y"
"29" "time-BodyRotationSpeed-Jerk-mean()-Z"
"30" "time-BodyRotationSpeed-Jerk-std()-X"
"31" "time-BodyRotationSpeed-Jerk-std()-Y"
"32" "time-BodyRotationSpeed-Jerk-std()-Z"
"33" "time-BodyAcceleration-Mag-mean()"
"34" "time-BodyAcceleration-Mag-std()"
"35" "time-GravityAcceleration-Mag-mean()"
"36" "time-GravityAcceleration-Mag-std()"
"37" "time-BodyAcceleration-JerkMag-mean()"
"38" "time-BodyAcceleration-JerkMag-std()"
"39" "time-BodyRotationSpeed-Mag-mean()"
"40" "time-BodyRotationSpeed-Mag-std()"
"41" "time-BodyRotationSpeed-JerkMag-mean()"
"42" "time-BodyRotationSpeed-JerkMag-std()"
"43" "frequency-BodyAcceleration--mean()-X"
"44" "frequency-BodyAcceleration--mean()-Y"
"45" "frequency-BodyAcceleration--mean()-Z"
"46" "frequency-BodyAcceleration--std()-X"
"47" "frequency-BodyAcceleration--std()-Y"
"48" "frequency-BodyAcceleration--std()-Z"
"49" "frequency-BodyAcceleration-Jerk-mean()-X"
"50" "frequency-BodyAcceleration-Jerk-mean()-Y"
"51" "frequency-BodyAcceleration-Jerk-mean()-Z"
"52" "frequency-BodyAcceleration-Jerk-std()-X"
"53" "frequency-BodyAcceleration-Jerk-std()-Y"
"54" "frequency-BodyAcceleration-Jerk-std()-Z"
"55" "frequency-BodyRotationSpeed--mean()-X"
"56" "frequency-BodyRotationSpeed--mean()-Y"
"57" "frequency-BodyRotationSpeed--mean()-Z"
"58" "frequency-BodyRotationSpeed--std()-X"
"59" "frequency-BodyRotationSpeed--std()-Y"
"60" "frequency-BodyRotationSpeed--std()-Z"
"61" "frequency-BodyAcceleration-Mag-mean()"
"62" "frequency-BodyAcceleration-Mag-std()"
"63" "frequency-BodyAcceleration-JerkMag-mean()"
"64" "frequency-BodyAcceleration-JerkMag-std()"
"65" "frequency-BodyRotationSpeed-Mag-mean()"
"66" "frequency-BodyRotationSpeed-Mag-std()"
"67" "frequency-BodyRotationSpeed-JerkMag-mean()"
"68" "frequency-BodyRotationSpeed-JerkMag-std()"
