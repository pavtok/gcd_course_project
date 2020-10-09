---
title: CodeBook
author: pavtok
date: 4/10/2020
output:
  pdf_document: default
  html_document: default
urlcolor: blue  
---

## 01. Introduction

The raw data belongs to the work Human Activity Recognition Using Smartphones Dataset Version 1.0^[Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012]. The complete information can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The complete data is in the folder UCI HAR Dataset (can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)). Inside are the 'train' and 'test' folders, which have the same data structure: both contains "X_(...).txt", "y_(...).txt", "subject_(...).txt" and a folder "Inertial Signals".

The script "run_analysis.R" merges all 'X', 'y' and 'subject' data from both sources into one data set. Then keeps the activity, subject data and the mean and standard deviation variables. Then cleans variable names. Finally, creates a second data set which contains a summary with averages of all numeric variables.  


## 02. Data

* _dataset.txt_
    
  + Number of variables: 70
  + Number of rows: 10299
  + Description: This data set takes subject ("subject_(...).txt"), _mean_ and _standard deviation_ variables from original data set ("X_(...).txt") 
  and activity data ("y_(...).txt"), from the 'test' and 'train' raw data. The first variables has the basic data ('Subject', 'Activity_Index', 'Activity', 'Type') and the other ones contains the features.
  
  
* _datasummary.txt_
  
  + Number of variables: 70
  + Number of rows: 180
  + Description: This data set is a summary of the previous data set ("dataset"). Has one row by activity (6 per subject) by subject (30). The first variables has the basic data ('Subject', 'Activity_Index', 'Activity', 'Type') and the other ones contains the averages of each variable by activity by subject.

## 03. Variables
  
* Subject
  + Class: Factor
  + Description: Each number identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
  
* Activity_Index
  + Class: Factor
  + Description: Each number identifies the activity: 
    + 1: walking
    + 2: walking upstairs
    + 3: walking downstairs
    + 4: sitting
    + 5: standing
    + 6: laying
  
* Activity
  + Class: Character
  + Description: The same as the previous one, but with more explicit labels.
  
* Type
  + Class: Factor
  + Description: Indicates which set type it belongs to: 'train' or 'test' data.
  
* Features variables:
  + Class: Numeric
  + Variable names:
    + t_Body_Acc_mean_X
    + t_Body_Acc_mean_Y
    + t_Body_Acc_mean_Z
    + t_Gravity_Acc_mean_X
    + t_Gravity_Acc_mean_Y
    + t_Gravity_Acc_mean_Z
    + t_Body_Acc_Jerk_mean_X
    + t_Body_Acc_Jerk_mean_Y
    + t_Body_Acc_Jerk_mean_Z
    + t_Body_Gyro_mean_X
    + t_Body_Gyro_mean_Y
    + t_Body_Gyro_mean_Z
    + t_Body_Gyro_Jerk_mean_X
    + t_Body_Gyro_Jerk_mean_Y
    + t_Body_Gyro_Jerk_mean_Z
    + t_Body_Acc_Mag_mean
    + t_Gravity_Acc_Mag_mean
    + t_Body_Acc_Jerk_Mag_mean
    + t_Body_Gyro_Mag_mean
    + t_Body_Gyro_Jerk_Mag_mean
    + f_Body_Acc_mean_X
    + f_Body_Acc_mean_Y
    + f_Body_Acc_mean_Z
    + f_Body_Acc_Jerk_mean_X
    + f_Body_Acc_Jerk_mean_Y
    + f_Body_Acc_Jerk_mean_Z
    + f_Body_Gyro_mean_X
    + f_Body_Gyro_mean_Y
    + f_Body_Gyro_mean_Z
    + f_Body_Acc_Mag_mean
    + f_Body_Acc_Jerk_Mag_mean
    + f_Body_Gyro_Mag_mean
    + f_Body_Gyro_Jerk_Mag_mean
    + t_Body_Acc_std_X
    + t_Body_Acc_std_Y
    + t_Body_Acc_std_Z
    + t_Gravity_Acc_std_X
    + t_Gravity_Acc_std_Y
    + t_Gravity_Acc_std_Z
    + t_Body_Acc_Jerk_std_X
    + t_Body_Acc_Jerk_std_Y
    + t_Body_Acc_Jerk_std_Z
    + t_Body_Gyro_std_X
    + t_Body_Gyro_std_Y
    + t_Body_Gyro_std_Z
    + t_Body_Gyro_Jerk_std_X
    + t_Body_Gyro_Jerk_std_Y
    + t_Body_Gyro_Jerk_std_Z
    + t_Body_Acc_Mag_std
    + t_Gravity_Acc_Mag_std
    + t_Body_Acc_Jerk_Mag_std
    + t_Body_Gyro_Mag_std
    + t_Body_Gyro_Jerk_Mag_std
    + f_Body_Acc_std_X
    + f_Body_Acc_std_Y
    + f_Body_Acc_std_Z
    + f_Body_Acc_Jerk_std_X
    + f_Body_Acc_Jerk_std_Y
    + f_Body_Acc_Jerk_std_Z
    + f_Body_Gyro_std_X
    + f_Body_Gyro_std_Y
    + f_Body_Gyro_std_Z
    + f_Body_Acc_Mag_std
    + f_Body_Acc_Jerk_Mag_std
    + f_Body_Gyro_Mag_std
    + f_Body_Gyro_Jerk_Mag_std

  + Description: These are only the mean and standard deviation variables. The original description is: "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using 
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz.  
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."



