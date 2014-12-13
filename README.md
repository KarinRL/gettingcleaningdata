==================================================================
Coursera Getting and Cleaning Data PROJECT
==================================================================
This project uses the dataset:
Human Activity Recognition Using Smartphones Dataset (HAR USD) Version 1.0
by
Davide Anguita, Alessandro Ghio, Luca Oneto, Jorge L. Reyes-Ortiz.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Reference:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly 
Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
==================================================================

In this project we collected the mean and standard deviation of measurements
of human activity of 30 volunteers assembled by the lab referenced above in a data frame called:
measurements.means.stdev
Then we created a tidy data frame which contains the mean of each variable in 
measurements.means.stdev, computed by subject and by activity in the data frame:
mean.measmeanstd.bysubject.byactivity

The files: <br>
	run_analysis.R 	contains the code for the assigned project tasks. <br>
	CodeBook.md		explains the names of the variables and all the steps in run_analysis.R <br>
	mean.measmeanstd.bysubject.byactivity.txt	output file - tidy data - with avearges of measuremnts
	                                             in above file, computed by subject and by activity
<br>	
NOTE: there were a couple of activities in the code that could have been made with a function. 
But the tasks were simple enough that I decided against it. Thus, there is no additional script files
for this project. The file run_analysis.R is self contained.

WARNINGS:<br>
1)  run_analysis.R assumes that the file getdata-projectfiles-UCI HAR Dataset.zip 
was downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and the dataset was extracted into a directory called:
UCI HAR <br>
2) The first line of code in run_analysis sets the working directory to the directory where
 UCI HAR was located in my computer. You should change it to the directory where you 
 have downloaded the UCI HAR dataset. <br>
3) The second line of code in run_analysis sets name of the folder where the UCI HAR Dataset
is located in my computer. I called that folder "UCI HAR". If you used a different name, you whould change it here. 
