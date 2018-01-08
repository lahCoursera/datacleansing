# Set your working directory to the top level in the downloaded files
setwd("~/R_Coursera/DataCleansing/Assignment/UCI HAR Dataset")

#Load libraries
library(dplyr)

# Read the .txt files into data frames 

activityLabel <- read.table("activity_labels.txt", col.names=c("rownum", "activity"), stringsAsFactors = FALSE)
features <- read.table("features.txt", sep=" ", col.names=c("rownum","feature"), stringsAsFactors=FALSE, strip.white=TRUE)
subjectTrain <- read.table("./train/subject_train.txt")
xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/y_train.txt")
subjectTest <- read.table("./test/subject_test.txt")
xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/y_test.txt")

# Check files
str(activityLabel)
str(features)
str(subjectTrain)
str(xTrain)
str(yTrain)
str(subjectTest)
str(xTest)
str(yTest)

# Create train group
trainMerge <- cbind(subjectTrain, yTrain, xTrain)
colnames(trainMerge)[1] <-"Subject"
colnames(trainMerge)[2] <- "Activity"
str(trainMerge)

#Create test group
testMerge <- cbind(subjectTest, yTest, xTest)
colnames(testMerge)[1] <-"Subject"
colnames(testMerge)[2] <- "Activity"
str(testMerge)

# Combine these two data sets

allData <- rbind(testMerge, trainMerge)
str(allData)

# rename the V1-V561 column names
for (i in 1:561) {
        names(allData)[i+2] <-features[i,2]
}

# Replace the values 1-6 for activity with the values from activityLabel table
for (i in 1:6) {
        allData$Activity[allData$Activity ==i] <- activityLabel$activity[i]
}

# Before you can select the columns with mean() and std() you must first rename the columns 
# that have duplicate column names.  At least my version of R grips with this condtion.
# to fix this issue, add a counter to the end of the columns that have duplicate names

# create list of duplicates
dups <- unique(names(allData)[duplicated(names(allData))])

# fix issus
for (i in dups) {
        allData[i] < rowSums(allData[names(allData) ==i])
}
newData <- allData[!duplicated(names(allData))]

# pull the columns that have a mean() or std() and placed in mytidydata

mytidydata <- select(newData, Subject, Activity, contains("mean()"), contains("std()"))

# Calculate the mean of the mean and standard devation of the data set grouped by the Subject and Activity

mytidydata <- mytidydata %>% group_by(Subject, Activity) %>% summarise_all(mean)

# Write mytidydata to a file

write.table(mytidydata, sep=" ", file="./mytidydata.csv", row.names = FALSE)


# the data is now tidy







    
