#You should create one R script called run_analysis.R that does the following. 
#	1. Merges the training and the test sets to create one data set.
#	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#	3. Uses descriptive activity names to name the activities in the data set
#	4. Appropriately labels the data set with descriptive variable names. 
#	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#set working directory
#WARNING: this directory needs to be changed to the directory where you have the UCI HAR Dataset
setwd("C:/Users/reinhold/Myclasses/cleaningdata")
#WARNING: this name for datadir needs to be changed if you placed the UCI HAR dataset in a folder with a different name
datadir="UCI HAR"   

#load features and labels
features<- read.table(file.path(".",datadir,"features.txt"),stringsAsFactors=TRUE,quote="\"")[,2]
activity_labels<- read.table(file.path(".",datadir,"activity_labels.txt"),stringsAsFactors=TRUE,quote="\"")[,2]

# select ONLY mean and standard deviation features and clean up space
M<-grep("-mean()",features); 
MF<-grep("-meanFreq()",features); M<-M[! M %in% MF]  #do not select meanFreq
S<-grep("-std()",features); 
features<-features[c(M,S)];    
rm(M); rm(S); rm(MF);


#load training data
X_train <- read.table(file.path(".",datadir,"train/X_train.txt"), quote="\"")[,features]
Y_train <- read.table(file.path(".",datadir,"train/Y_train.txt"), quote="\"",stringsAsFactors=TRUE)
subject_train <- read.table(file.path(".",datadir,"train/subject_train.txt"), quote="\"",stringsAsFactors=TRUE)

#load test data
X_test <- read.table(file.path(".",datadir,"test/X_test.txt"), quote="\"")[,features]
Y_test <- read.table(file.path(".",datadir,"test/Y_test.txt"), quote="\"",stringsAsFactors=TRUE)
subject_test <- read.table(file.path(".",datadir,"test/subject_test.txt"), quote="\"",stringsAsFactors=TRUE)

#combine training and test sets into one data set
 X<-rbind(X_train,X_test)    #dim=10300x79
 Y<-rbind(Y_train,Y_test)	#dim=10300x1
 subject<-rbind(subject_train,subject_test) #dim=10300x1
 
#clean up space
rm(X_train); rm(X_test); rm(Y_train); rm(Y_test); rm(subject_test); rm(subject_train);

#put names to variables and name the activities
names(Y)<-"activity"
names(subject)<-"subject"
Y<-sapply(Y,function(u) names(u)=activity_labels[u])    #name the activity
names(X)=features

#create a data.frame with subject, activity and X (summarized measurements) 
measurements.means.stdev<-cbind(subject,Y); measurements.means.stdev<-cbind(df,X);

#average of each variable for each activity and each subject.
library(dplyr); 
#get the means of all features by subject and activity
mean.measmeanstd.bysubject.byactivity<-measurements.means.stdev %>% group_by(subject,activity) %>% summarise_each(funs(mean))       

#write the file as a csv
write.csv( mean.measmeanstd.bysubject.byactivity,file="mean.measmeanstd.bysubject.byactivity.csv",quote=TRUE)

