#STEP 1: Get Data
#Downlaod ans unzip the source file if it hasn't been already downloaded and unziped

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!dir.exists("./data")) {dir.create("./data")}  #Create the Data repository if it doesn't exist

zipFilePath <- "./data/UciHarDataset.zip"

if(!file.exists(zipFilePath)) {download.file(fileUrl, destfile = zipFilePath, mode = "wb")}
    
if(!dir.exists("./data/UCI HAR Dataset")) {unzip(filePath, exdir = "./data")}    
    


#Step 2: Read Data
#For each data.frame we set readbled variables names

setwd("./data/UCI HAR Dataset/")    #We set the working directory where the data files are

features <- read.table("./features.txt", as.is = TRUE)
colnames(features) <- c("featuresId", "featuresLabel")

activities <- read.table("./activity_labels.txt")
colnames(activities) <- c("activityId", "activityLabel")

trainingSubject <- read.table("./train/subject_train.txt")
colnames(trainingSubject) <- "subjectId"

trainingSet <- read.table("./train/X_train.txt")
colnames(trainingSet) <- features[, "featuresLabel"]

trainingLabels <- read.table("./train/y_train.txt")
colnames(trainingLabels) <- "activityId"

testSubject <- read.table("./test/subject_test.txt")
colnames(testSubject) <- "subjectId"

testSet <- read.table("./test/X_test.txt")
colnames(testSet) <- features[, "featuresLabel"]

testLabels <- read.table("./test/y_test.txt")
colnames(testLabels) <- "activityId"



#Step 3: Tidy data

#To manipulate the dataset the dplyr library is used
library(dplyr)  #We guess that the dplyr package is already installed

#Step a - Merge the training and the test sets to create one data set.
dataMerged <- rbind(cbind(trainingSubject, trainingSet, trainingLabels), cbind(testSubject, testSet, testLabels))

#Some variables are duplicated in the data.frame. We will delete them. 
dataMergedNoDup <- dataMerged[, !duplicated(names(dataMerged))]

#Step b - Extract only the measurements on the mean and standard deviation for each measurement
meanstdSet <- select(dataMergedNoDup, "subjectId", "activityId", contains("mean"), contains("std"))

#Step c - Use descriptive activity names to name the activities in the data set
meanstdSet$activityId <- factor(meanstdSet$activityId, levels = activities[,"activityId"], labels = activities[,"activityLabel"])

#Step d - Appropriately labels the data set with descriptive variable names. 
dataSetCol <- names(meanstdSet)

#Remove special characters ()-
dataSetCol <- gsub("[\\(\\)-]", "", dataSetCol)

#Expand abbreviations and clean up names
dataSetCol <- gsub("^f", "frequency", dataSetCol)
dataSetCol <- gsub("^t", "time", dataSetCol)
dataSetCol <- gsub("Acc", "Accelerometer", dataSetCol)
dataSetCol <- gsub("Gyro", "Gyroscope", dataSetCol)
dataSetCol <- gsub("Mag", "Magnitude", dataSetCol)
dataSetCol <- gsub("Freq", "Frequency", dataSetCol)
dataSetCol <- gsub("mean", "Mean", dataSetCol)
dataSetCol <- gsub("std", "StandardDeviation", dataSetCol)
dataSetCol <- gsub("BodyBody", "Body", dataSetCol)

#Replace the variables names with the clean names
names(meanstdSet) <- dataSetCol



#Step e - Creates  second, independent tidy data set with the average of each variable for each activity and each subject
#Group by activity and subject and summarise the mean
#We use the pipeline functionnaly of the dplyr library
    meanGroupSet <- meanstdSet %>% group_by(subjectId, activityId) %>% summarize_all(mean)
    
#Write the tidy data to a file
    write.table(meanGroupSet, "tidyData.txt", row.names = FALSE, quote = FALSE)