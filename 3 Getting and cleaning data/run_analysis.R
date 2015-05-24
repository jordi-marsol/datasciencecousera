
#setwd("UCI HAR Dataset")

#1
#merges the training and the test sets to creat one data set

test <- read.table("test/x_test.txt")
train <- read.table("train/x_train.txt")
alldata <- rbind(test,train)

#2
#Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
features_selected <- grep("mean|std",features[,2])
selected_data <- alldata[,features_selected]

#3
#Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("activity_labels.txt")
y_test <- read.table("test/y_test.txt")
y_train <- read.table("train/y_train.txt")

allactivity <- rbind(y_test,y_train)

for(i in 1:nrow(activity_labels)) {
  allactivity$V1[allactivity$V1 == i] <- as.character(activity_labels[i,2])
}

data <- cbind(selected_data,allactivity)

#4
#Appropriately labels the data set with descriptive variable names.

features <- features[features_selected,2]
names(data) <- features
colnames(data)[80] <- "activity"

#5
#creates a second, independent tidy data set with the average of each variable for each activity and each subject.

s_test <- read.table("test/subject_test.txt")
s_train <- read.table("train/subject_train.txt")
subject <- rbind(s_test,s_train)
data <- cbind(data,subject)
colnames(data)[81] <- "subject"

library(dplyr)

data_summary <- group_by(data,activity,subject) %>% summarise_each(funs(mean))

#write.table(data_summary,file="data_summary.txt",row.names=FALSE)