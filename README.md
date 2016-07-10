#Project - Getting and Cleaning Data
###_By Nikhil_ 
*Github link - (https://github.com/nikhilshankarm/GettingandCleaningData)*

***

To reproduce the results, set the working directory (WD) to the folder where data is present. Exclude folder "UCI HAR Dataset" from WD as the script checks for this folder for the presense of dataset.

##Getting and Cleaning Data Project

The R script called run_analysis.R that does the following.

*1. Sets working Directory.*    
*2. Checks for the dataset and downloads and extracts it if not found.*     
*3. Loads the required packages.*     
*4. Sources datacleaner_script.R and outputs a html file with the results.*     
*5. Knits the codebook and converts it to html.*      
*6. Writes both a TXT and a CSV file containing the tidy dataset in the working directory.*       


The datacleaner_script.R dows the following       
*-Merges the training and the test sets to create one data set.*                
*-Extracts only the measurements on the mean and standard deviation for each measurement.*                  
*-Uses descriptive activity names to name the activities in the data set*                   
*-Appropriately labels the data set with descriptive variable names.*                             
*-From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.*        

GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

The link to data for the project is below

[Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Dataset Download] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


