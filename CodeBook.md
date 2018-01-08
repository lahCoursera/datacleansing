---
title: "CodeBook"
author: "lahCoursera"
date: "January 7, 2018"
output: html_document
---

## Introduction
This code book explains the functions, variables, and processes used to create the resulting tidy data file called mytidydata.txt  The sections of this document are:

        * The data
        * Libraries and functions
        * Variables
        * Processing the Data
        
The script that was use is called run_analysis.R.  The code has discriptive comments so you can easily follow the process within the code.

## The data

The data is a set of tables broken up into several directories.  The main directory and the data directories (test and train).  The files are as such

        * activity_labels.txt - 2 columns, holds the activity code and activity value
        * features - 2 columns - holds the 561 column lables that will be needed for the data
        * subject_test.txt - 1 column - the test subjects - order coorisponds to data files
        * X_test.txt, y_test.txt numeric data 
        * subject_train.txt - 1 column - the test subjects - order coorisponds to the data files
        * x_train.txt, y_train.txt numeric data
        
## Libraries and Functions
### Libraries:
        dplyr
        
### Functions
        read.table() - to load all of the various tables into data frames
        cbind() - to bind the Subject and Activity data to the Train and Test data
        str() - to check the structure of each variable that was derived form the read.table function
        rbind() - to join the Test and the Train data sets together
        for loops - to incrimentally process data for various reasons
        names() - used in processing the header labels
        duplicated() for identifying columns with duplicate column names
        select() - to select those columns to be part of the mytidydata file
        group_by() - to group the average calculation by subject and activity
        summarise_all() - to summarize all columns

## Variables
        ActivityLabel - holds the data from the activity_labels.txt file
        features - holds the data from the features.txt file
        subjectTrain - holds the data from the subject_train.txt file
        xTrain -  holds the data from the X_train.txt file
        yTrain - holds the data from the Y_train.txt file
        subjectTest - holds the data from the subject_test.txt file
        xTest -  holds the data from the X_test.txt file
        yTest - holds the data from the Y_test.txt file
        trainMerge - holds the train data with the xTrain and yTrain data added
        testMerge - holds the test data with the xTest and yTest data added
        allData - holds the combined trainMerge and testMerge data combined
        dups - holds the list of duplicated column names
        newData - holds the new data file after columns with duplicate columns are removed
        mytidydata - holds the data for final processing and output

## Processing the Data
The data was processed in a single R script called run_analysis.r. It was designed to step the user through the processes with an explaination as to what each process does.  The steps taken are

        * read each .txt file and load it into the appropreate variables listed above
        * review the structure of each of the variables
        * cbind the subjecttrain, yTrain, and xTrain files together and check the resulting structure
        * add column headings Subject and Activity
        * cbind the subectTest, yTest, and xTest files together and check the resulting structure
        * add the column headings Subject and Activity
        * rbind the two data frames from the previous step
        * replace the V1-V561 column headings with the data from the features data frame.
        * replace the activities values (1-6) with the appropreate labels from ActivitiesLable 
        * find and remove data with duplicate column names.
        * select the columns Subject, Activity, and all columns containing mean() and std()
        * preform a summarise_all grouping by Subject and activity
        * write the resulting tidy data file to mytidydata
        