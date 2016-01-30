#CodeBook

##data source
The original data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Below 8 files are used in the analysis:  
  
1. "./UCI HAR Dataset/train/subject_train.txt":Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.   
2. "./UCI HAR Dataset/train/X_train.txt":Training dataset
3. "./UCI HAR Dataset/train/Y_train.txt":Training labels
4. "./UCI HAR Dataset/test/subject_test.txt":Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
5. "./UCI HAR Dataset/test/X_test.txt":Testing dataset
6. "./UCI HAR Dataset/test/Y_test.txt":Test labels
7. "./UCI HAR Dataset/features.txt":List variable names of datasets
8. "./UCI HAR Dataset/activity_labels.txt":Description of activity
  
I combined the Training/Test datasets with their corresponding subject and activity labels and then combine the training and test datasets into 1 dataset.Only the fields containing "mean" or "std" were exacted.The variable names have been updated based on "feature.txt" and cleaned by replacing "_" with "." and removing "()". Used descriptive activity names from "activity_labels.txt" to name the activities in the data set. Finally, the dataset has been grouped based on activity name and subject to make it clean for analysis.


Lin Xing
1/29/2016
