==================================================================
Coursera Getting and Cleaning Data PROJECT
				CODE BOOK
==================================================================
This project uses the dataset from the following work:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly 
Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
==================================================================

This Code Book is divided into 3 parts:
	A. Introduces the goal of the project.
	B. Explains the variables involved.
	C. Explains the code, step by step.
	
===================================================================
A. In this project we collected the mean and standard deviation of measurements
of human activity of 30 volunteers assembled by the lab referenced above in a data frame called:
measurements.means.stdev
Then we created a tidy data frame which contains the mean of each variable in 
measurements.means.stdev, computed by subject and by activity in the data frame:
mean.measmeanstd.bysubject.byactivity

===================================================================
B. Variables
a. The volunteers are individually identified in the variable "subject" with a number from 1 to 30.

b. The activities are identified by name in the variable "activity", and they are:
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

c. Measurements of the volnteers activities were collected using an accelerometer 
and a gyroscope, and the 3-axial linear acceleration and 3-axial angular velocity 
were captured at a constant rate of 50Hz. 
For a detailed description of how the variables were collected, see HAR USD dataset from 
activityrecognition@smartlab.ws

For each record in the HAR USD dataset, we collected the mean and standard deviation of 
the following measurements:
- Triaxial acceleration from the accelerometer (total acceleration) and 
   the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- ()-feature vector with the mean and standard deviation of time (t) and frequency (f) domain variables. 

Description from [1]: 
"The features selected for this database come from the accelerometer and gyroscope 3-axial 
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter 
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ,
tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag,
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag
"
The varaibles we kept for our data set consit of selecting from each of the above variables,
their mean and the standard deviation:

tBodyAcc.mean...XYZ,
tGravityAcc.mean...XYZ ,
tBodyAccJerk.mean...XYZ , 
tBodyGyro.mean...XYZ , 
tBodyGyroJerk.mean...XYZ ,  
tBodyAccMag.mean.. , 
tGravityAccMag.mean.. ,   
tBodyAccJerkMag.mean.. , 
tBodyGyroMag.mean.. , 
tBodyGyroJerkMag.mean..  , 

fBodyAcc.mean...XYZ ,  
fBodyAccJerk.mean...XYZ , 
fBodyGyro.mean...XYZ ,  
fBodyAccMag.mean.. , 
fBodyBodyAccJerkMag.mean.. , 
fBodyBodyGyroMag.mean.. , 
fBodyBodyGyroJerkMag.mean.. , 

tBodyAcc.std...XYZ ,
tGravityAcc.std...XYZ , 
tBodyAccJerk.std...XYZ , 
tBodyGyro.std...XYZ , 
tBodyGyroJerk.std...XYZ , 
tBodyAccMag.std.. , 
tGravityAccMag.std.. , 
tBodyAccJerkMag.std.. ,
tBodyGyroMag.std.. , 
tBodyGyroJerkMag.std.. , 

fBodyAcc.std...XYZ ,  
fBodyAccJerk.std...XYZ , 
fBodyGyro.std...XYZ ,  
fBodyAccMag.std.. ,  
fBodyBodyAccJerkMag.std.. , 
fBodyBodyGyroMag.std.. ,  
fBodyBodyGyroJerkMag.std.. 

==============================================================================

C. Project Steps
	1. Set working directory to directory containing project dataset
	2. Set the name of the folder where the UCI HAR dataset is located: datadir="UCI HAR"
	3. Get the names of the features (variables) and activity_labels. 
	4. Select from features only the features containing the mean and standard deviation of
		measurements. Make sure you do not include the mean-frequency features.
	5. Read the datafiles for the training-set and the test-set
		For example, for the train-set:
		Read X_train from ./datadir/train/X_train.txt. 
			Select only the mean and standard deviation of measurements features
		Y_train from ./datadir/train/Y_train.txt
		subject_train from ./datadir/train/subject_train.txt 
		We do the same for the test-set
	6. Combine train and test sets, for X, Y and subject.
		for example: X<-rbind(X_train,X_test)
	7. Clean up space: remove train and test sets
		for example rm(X_train)
		
	8. Name everything: 
		Label the variables in X with features. 
		Name the factor variable Y as "activity" and naem the activities in Y with activity_lables.
		Name the factor variable subject as "subject".
	9. Put everything together in one data-frame called measurements.means.stdev
	This is what a portion of it looks like:
		>head(measurements.means.stdev,4)
		subject activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
		1       1 STANDING        -0.9750599        -0.9915537        -0.9689591
		2       1 STANDING        -0.9847146        -0.9915537        -0.9806831
		3       1 STANDING        -0.9847146        -0.9661929        -0.9763171
		4       1 STANDING        -0.9900291        -0.9816856        -0.9820599
		
	10. Create a tidy data-frame with summary (mean) of all features, by subject and activity
		mean.measmeanstd.bysubject.byactivity
		This is what a portion of it lookslike:
		> head(mean.measmeanstd.bysubject.byactivity,4)
		Source: local data frame [4 x 81]
		Groups: subject

		subject activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
		1       1   LAYING        -0.8298188        -0.9096780        -0.8747595
		2       1  SITTING        -0.9520837        -0.9187667        -0.9308925
		3       1 STANDING        -0.9826250        -0.9766373        -0.9764938
		4       1  WALKING        -0.3506753        -0.5576393        -0.1609796

	11. Write the data.frame into a .txt file with the same name
	
