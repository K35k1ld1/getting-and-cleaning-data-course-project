# Getting and cleaning data course project

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.  
The goal is to prepare tidy data that can be used for later analysis.  
  
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.  
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
  
  
The GitHub repository contains the following files:  
- `README.md`: provides an overview of the data set and how it was created  
- `CodeBook.md`: describes the contents of the data set (data, variables and transformations used to generate the data)  
- `run_analysis.R`: the R script that used to create the data set  


## Raw data
Link to the raw data used for this project:   
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset includes the following files:  

- 'README.txt'  

- 'features_info.txt': Shows information about the variables used on the feature vector  

- 'features.txt': List of all features  

- 'activity_labels.txt': Links the class labels with their activity name  

- 'train/X_train.txt': Training set  

- 'train/y_train.txt': Training labels  

- 'test/X_test.txt': Test set  

- 'test/y_test.txt': Test labels  

- 'train/subject_train.txt' and 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30  


## Script: run_analysis.R
The R script realizes the following tasks:  
    1. Merges the training and the test sets to create one data set  
    2. Extracts only the measurements on the 'mean' and 'standard deviation' for each measurement  
    3. Uses descriptive activity names to name the activities in the data set  
    4. Appropriately labels the data set with descriptive variable names  
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject  
  
The output of the script is a file named 'tidiData.txt' which contains the tidy data that can be used for late analysis.  