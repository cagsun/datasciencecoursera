# Getting and Cleaning Data - Course Project
==========================================

This repo is created by Çağsun Acemoğlu to demonstrate the work done for "Getting and Cleaning Data" course project.

The data used can be retrieved from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The Script

The script works on the raw files in the downloaded folder to create a tidy data set that is ready to make some analyses on. 

The steps of its operation are as follows:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a tidy data set file with the average of each variable for each activity and each subject.

The final tidy data set is created in a txt file in the same working folder with name "summaryData.txt"

Detailed information about what the script does can be found in the codebook.md file in this repo.


## How to Use the Script


To use the script, 

1. Download the files from the provided link
2. Run R
3. Change working directory to the main directory of the downloaded files
4. Load & run your script

The output text file will be created after a while.
It may take a few minutes, please be patient.


Thank you
Çağsun