# Read class labels with their activity name into a data frame.
ActivityLabels <- read.table(paste(getwd(),"/UCI HAR Dataset/activity_labels.txt",sep=""), header=FALSE)
colnames(ActivityLabels) <- c("ActID","ActName")

# Read test labels into data frame
ytest <- read.table(paste(getwd(),"/UCI HAR Dataset/test/y_test.txt",sep=""), header=FALSE)
colnames(ytest) <- c("ActID")

# Read training labels into data frame
ytrain <- read.table(paste(getwd(),"/UCI HAR Dataset/train/y_train.txt",sep=""), header=FALSE)
colnames(ytrain) <- c("ActID")

# Read test subject data for test set
testsubject <- read.table(paste(getwd(),"/UCI HAR Dataset/test/subject_test.txt",sep=""), header=FALSE)
colnames(testsubject) <- c("Subject")

# Read training subject data for training set
trainsubject <- read.table(paste(getwd(),"/UCI HAR Dataset/train/subject_train.txt",sep=""), header=FALSE)
colnames(trainsubject) <- c("Subject")

library(plyr)

#Associate test labels with Activity names 
DFtest <- join(ytest,ActivityLabels)

#Associate training labels with Activity names
DFtrain <- join(ytrain,ActivityLabels)

# Read the Test data set into a dat frame
XTest <- read.table(paste(getwd(),"/UCI HAR Dataset/test/X_test.txt",sep=""), header=FALSE)

# Read the Trainig data set into a dat frame
XTrain <- read.table(paste(getwd(),"/UCI HAR Dataset/train/X_train.txt",sep=""), header=FALSE)

# Read the list of features(descriptive variables names) into a dat frame 
features <- read.table(paste(getwd(),"/UCI HAR Dataset/features.txt",sep=""), header=FALSE, stringsAsFactors=FALSE)

# Ensure Unique column names in test and training data sets
colnames(XTest) <- make.unique(features$V2)
colnames(XTrain) <- make.unique(features$V2)

# Add Activity Names and Subject information to test and trainig data sets 
XTestFinal <- cbind(Activity=DFtest$ActName,Subject=testsubject$Subject, XTest)
XTrainFinal <- cbind(Activity=DFtrain$ActName,Subject=trainsubject$Subject, XTrain)

# Merge Test and Training data sets
XMerged <- rbind(XTestFinal,XTrainFinal)

# Get the column names of Merged test and training dat set
cnames <- colnames(XMerged)

# Get the column names that match mean and standard deviation measurements
meanCols <- grep(c("mean()"), cnames, ignore.case = FALSE, fixed=TRUE, value =TRUE)
stdCols <- grep(c("std()"), cnames, ignore.case = FALSE, fixed=TRUE, value =TRUE)

# Subset Merged data frame for columns, Activity, Subject and mean and standard deviation measurements
XFinal <- XMerged[, c("Activity", "Subject",meanCols, stdCols)]

# Reshape data using melt and dcast
library(reshape2)
XMelt <- melt(XFinal, id.vars=c("Activity", "Subject"), measure.vars= colnames(XFinal[,3:68]))
FinalData <- dcast(XMelt, Activity + Subject~ variable, mean)

# Write output to File
write.table(FinalData, file="TidyData.txt", row.names=FALSE, quote=FALSE)
