# For this R script to work, please set your working directory to the main folder of the downloaded data files.
# Link to the data files: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# STEP 1
# ------------------------------------------------
# Load the data into R for training & test sets 

# Read Measurements Data
test = read.table("test/X_test.txt", header = FALSE)
train = read.table("train/X_train.txt", header = FALSE)

# Read Subjects Data that shows measurements' subject person
subject_train = read.table("train/subject_train.txt", header = FALSE)
subject_test = read.table("test/subject_test.txt", header = FALSE)

# Read Activity Data that shows which Activity measurements Belong To
activity_test = read.table("test/y_test.txt", header = FALSE)
activity_train = read.table("train/y_train.txt", header = FALSE)

# Merge training & test sets
subjectData = rbind(subject_train, subject_test)
activityData = rbind(activity_train, activity_test)
mainData = rbind(train, test)

# Set proper header names to columns
names(subjectData) = c("subject")
names(activityData) = c("activity")
# For the main measurements data (mainData), read the data file for feature's list 
features = read.table("features.txt",head=FALSE)
# Set the column names in mainData with the read column names from "features.txt"
names(mainData) = features$V2

# Put all data together
dataToAdd = cbind(subjectData, activityData)
fullData = cbind(mainData, dataToAdd)

# STEP 2
# ------------------------------------------------
# Remove all columns that don't contain the word mean or std. 
# This way, we're able to create a set of measurements that are just mean or standard deviation 
featuresSubset<-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
# Add subject & activity columns to the set of selected columns to keep
selectedColumns<-c(as.character(featuresSubset), "subject", "activity")

# Subset the data with the selected columns only to create the final data
finalData = subset(fullData,select=selectedColumns)

# STEP 3
# ------------------------------------------------
# Get the list of activity names corresponding to activity id's from the "activity_labels" text file
activityLabels = read.table("activity_labels.txt",header = FALSE)
# Make the activity names more readable
activityLabels[, 2] = gsub("_", "", tolower(as.character(activityLabels[, 2])))
# Put the names of activities in the final data instead of their id's.
# We insert the activity names to column 68 as we have 68 variables in our data frame.
finalData[,68] = activityLabels[finalData[,68], 2]

# STEP 4
# ------------------------------------------------
# Final corrections to variable names, to make them more readable & descriptive
names(finalData) = gsub("^t", "time-", names(finalData))
names(finalData) = gsub("^f", "frequency-", names(finalData))
names(finalData) = gsub("Acc", "Acceleration-", names(finalData))
names(finalData) = gsub("Gyro", "RotationSpeed-", names(finalData))
names(finalData) = gsub("BodyBody", "Body", names(finalData))

# STEP 5
# ------------------------------------------------
# Call the plyr library for aggregate function
library(plyr)
# Summarizes the data by taking the mean of all variables for each subject & each activity 
summaryData = aggregate(. ~subject + activity, finalData, mean)
# Finally writes the data set into a file
write.table(summaryData, "summaryData.txt", row.name=FALSE)





