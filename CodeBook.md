==================================================================
<h2> Coursera Getting and Cleaning Data PROJECT <br>
				CODE BOOK  </h2>
==================================================================
This project uses the dataset from the following work:<br>
<h6>Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. <br>
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. <br>
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012</h6>
==================================================================

This Code Book is divided into 3 parts:<br>
	A. Introduces the goal of the project.<br>
	B. Explains the variables involved.<br>
	C. Explains the code, step by step.<br>
	

===================================================================
<h2>A. Introduction </h2>
In this project we collected the mean and standard deviation of measurements
of human activity of 30 volunteers assembled by the lab referenced above in a data frame called:<br>
**measurements.means.stdev** <br>
Then we created a tidy data frame which contains the mean of each variable in 
measurements.means.stdev, computed by subject and by activity in the data frame:<br>
**mean.measmeanstd.bysubject.byactivity**


===================================================================
<h2>B. Variables</h2>
	a. The volunteers are individually identified in the variable "subject" with a number from 1 to 30.

	b. The activities are identified by name in the variable "activity", and they are: <br>
		WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

	c. Measurements of the volnteers activities were collected using an accelerometer and a gyroscope,<br> and the 3-axial linear acceleration and 3-axial angular velocity were captured at a constant<br> rate of 50Hz. For a detailed description of how the variables were collected,<br> see HAR USD dataset from activityrecognition@smartlab.ws. <br> For each record in the HAR USD dataset, we collected the mean and standard deviation of 
the following measurements:<br>
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- ()-feature vector with the mean and standard deviation of time (t) and frequency (f) domain variables. 

**Description from [1]: **<br>
"The features selected for this database come from the accelerometer and gyroscope 3-axial <br>
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) <br>
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter <br>
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.<br> 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals <br>
(tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz.<br>
<br>
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals <br>
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). <br>
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). <br>

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). <br>

These signals were used to estimate variables of the feature vector for each pattern:  <br>
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.<br>

tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ,
tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag,
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag
"<br>
The varaibles we kept for our data set consit of selecting from each of the above variables,
their mean and the standard deviation: <br>

tBodyAcc.mean...XYZ,<br>
tGravityAcc.mean...XYZ ,<br>
tBodyAccJerk.mean...XYZ , <br>
tBodyGyro.mean...XYZ , <br>
tBodyGyroJerk.mean...XYZ , <br> 
tBodyAccMag.mean.. , <br>
tGravityAccMag.mean.. ,  <br> 
tBodyAccJerkMag.mean.. , <br>
tBodyGyroMag.mean.. , <br>
tBodyGyroJerkMag.mean..  ,<br> 

fBodyAcc.mean...XYZ ,  <br>
fBodyAccJerk.mean...XYZ , <br>
fBodyGyro.mean...XYZ ,  <br>
fBodyAccMag.mean.. , <br>
fBodyBodyAccJerkMag.mean.. ,<br> 
fBodyBodyGyroMag.mean.. , <br>
fBodyBodyGyroJerkMag.mean.. , <br>

tBodyAcc.std...XYZ ,<br>
tGravityAcc.std...XYZ , <br>
tBodyAccJerk.std...XYZ , <br>
tBodyGyro.std...XYZ , <br>
tBodyGyroJerk.std...XYZ , <br>
tBodyAccMag.std.. , <br>
tGravityAccMag.std.. , <br>
tBodyAccJerkMag.std.. ,<br>
tBodyGyroMag.std.. , <br>
tBodyGyroJerkMag.std.. , <br>

fBodyAcc.std...XYZ ,  <br>
fBodyAccJerk.std...XYZ , <br>
fBodyGyro.std...XYZ ,  <br>
fBodyAccMag.std.. ,  <br>
fBodyBodyAccJerkMag.std.. ,<br> 
fBodyBodyGyroMag.std.. ,  <br>
fBodyBodyGyroJerkMag.std.. <br>


==============================================================================

<h3>C. Project Steps</h3>
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
	6. Combine train and test sets, for X, Y and subject.<br>
		for example: X<-rbind(X_train,X_test)<br>
	7. Clean up space: remove train and test sets<br>
		for example rm(X_train)<br>
		
	8. Name everything: <br>
		Label the variables in X with features. <br>
		Name the factor variable Y as "activity" and naem the activities in Y with activity_lables.<br>
		Name the factor variable subject as "subject".<br>
	9. Put everything together in one data-frame called **measurements.means.stdev**<br>
	This is what a portion of it looks like:<br>
		>head(measurements.means.stdev,4)<br>
		subject activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z<br>
		1       1 STANDING        -0.9750599        -0.9915537        -0.9689591<br>
		2       1 STANDING        -0.9847146        -0.9915537        -0.9806831<br>
		3       1 STANDING        -0.9847146        -0.9661929        -0.9763171<br>
		4       1 STANDING        -0.9900291        -0.9816856        -0.9820599<br>
		
	10. Create a tidy data-frame with summary (mean) of all features, by subject and activity<br>
		**mean.measmeanstd.bysubject.byactivity**<br>
		This is what a portion of it lookslike:<br>
		> head(mean.measmeanstd.bysubject.byactivity,4)<br>
		Source: local data frame [4 x 81]<br>
		Groups: subject<br>

		subject activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z<br>
		1       1   LAYING        -0.8298188        -0.9096780        -0.8747595<br>
		2       1  SITTING        -0.9520837        -0.9187667        -0.9308925<br>
		3       1 STANDING        -0.9826250        -0.9766373        -0.9764938<br>
		4       1  WALKING        -0.3506753        -0.5576393        -0.1609796<br>

	11. Write the data.frame into a .txt file with the same name
	
