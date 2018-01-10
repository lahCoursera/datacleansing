---
title: "readme"
author: "lahCoursera"
date: "January 7, 2018"
output: html_document
---


## Project

This assigment is for the Week 4 of the Data Cleansing course. The object of this assigment is to download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and create a single tidy data file.

Tidy data is define as data files having:

        * Observations in rows
        * Variables in columns
        * Discriptive variables
        * One observation per row
        
## Deliverables

We are to upload four files into the github repository.  These for files are:

        * readme.md file - explains the files involved with the project
        * CodeBook.md - define variables, functions, and procudures used for this project
        * run_analysis.R - the code used to process the raw data into the final text file
        * mytidydata.txt - Resulting tidy data file
        
## The Process

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

Please revere to the CodeBook.md file to review the process that was used to create the tidy data set.        
