#Data Science in Coursera: Getting and Cleaning Data
##Readme file about course project

This project purposes to collect and clean a raw data set using R language.
The dataset for this project is get from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
which is about data readings from mobile devices caused by person's movement.

The run_analysis.R script is set to be run in the dataset directory. It can be run automatically as source in order to run all tasks. In the end there will be the data_summary object exported as text to data_summary.txt.
This script loads the dplyr library, so make shure you have it installed and running fine in your R environment.

The different tasks of the project are numbered in the script, since the purpose of the project is to get a final summary they are not supposed to be run independently but one after another.

Next are the diferent tasks and how are they made:

*1
**merges the training and the test sets to creat one data set**

This part loads the train and test tables into variables to merge them in one

*2
**Extracts only the measurements on the mean and standard deviation for each measurement.**

The features are read from its text file, then columns are selected by searching "mean" or "std" text and these column numbers are selected from previous data to get a selected data object.
This should be considered a tidy data action since we are discarding all other unnecessary columns.


*3
**Uses descriptive activity names to name the activities in the data set**

We get the activity labels from its text file and read and bind its values into one object.
In a loop the activity labels are read and then applyed to the activities object to substitute its numeric values for the labels
Finally these text labels are bound to the data object as a new column.

*4
**Appropriately labels the data set with descriptive variable names.**

The features are read again but this time we are just getting its selected text names.
Next the features vector is applied to the data object as column names
Finally we add the activity name column we bound in the last task in order to get all columns named.


*5
**creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

In this last step we merge and bind the subject data to the data object and we give its column a name.
Finally using the dplyr library functions we group the data into activity and subject and get a summarized mean of each combination.
Additionaly the table is exported to the data_summary.txt file.