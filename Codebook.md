#Getting and Cleaning Data Course Project
The included code (run_analysis.R) performs the following functions:
1) Searches within the working directory to find if the file of interest already exists
2) If the file does not exist, downloads the file
3) Reads in all of the tables included in the zipped file
4) Combines like tables, then combines all tables based on a common index
5) "Cleans up" the column names and assigns them to the corresponding columns
6) Creates a second dataset containing the average of each activity by each subject

The data was retrieved from the University of California at Irvine (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and contains data from 30 subjects who had "wearable technologies" and provided the corresponding anlaytics. 

#Codes
xtrain<- training set
ytrain<- training tables
strain<- training subjects (persons)

total_training<- total combined table containing xtrain, ytrain, strain

xtest<- test sets
ytest<- test tables
stest<- test subjects (persons)

total_test<- total combined table containing xtest, ytest, stest

activitylabels<- links the class labels with their activity names
activity_id<- subset of activity labels
activity_type<- subset of activity labels
features<- list of all features 

colnames<- list of column names (derived from activity labels- activity ID)

 total_data<- combined table containing total_training and total_test
 
 total_names<- name vector containing all of the activity IDs
 logvec<- logical vector that subsets the name vector based on names containing means and standard deviations
 
 new_data<- subset of total_data based on the logical logvec vector
 
 tidydata<- "tidy" second dataset that containing the average of all activity types by subject
