---
output:
  pdf_document: default
  html_document: default
---

README

This repo contains the "Getting and Cleaning Data" Course Project, and contains:
  
_"CodeBook.md":_ A code book with information about the data, the variables and its features.

_"README.md"_ This file.

_"run_analysis.R":_ 
The script who performs all data transformations, and does the following steps:
  
  
1) "MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET":  

_datapaths:_ A vector that contains all file paths from "UCI HAR Dataset" directory.  

_xvarnames:_ A vector of length 561 that contains all variable names for the features in "X" data.
Because some characters are not allowed for column names in data table, this vector are modified:   
* "()" converted to ".." This is important to find "mean()" and "std()" variables, now named "mean.."
and "std..".  
* "(", ")", ",", "-" deleted (converted to "").

_mergedata:_ 

  * Description: This function detect and import "x" (measurements), "y" (activity) and 
"subject" data. The function searches the data by set type ("test" or "train" data) in the directories.

  * Usage: mergedata(type, paths=datapaths)

  * Arguments: 
    + type: Set type. Values allowed: "test" and "train".
    + paths: By default the value "datapaths".
    
Finally, uses "rbind" to merge all data into one data set called "dataset".
  
  
2) "EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH 
MEASUREMENT":

Uses "dplyr" to select "mean.." and "std.." strings in variable names.
  
  
3) "USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET:"

_act_labels:_ A table with activity labels (walking, walking upstairs, 
walking downstairs, sitting, standing, laying) and an index per label (numbers 1 to 6).
By "read.table" imports the raw data from "activity_labels.txt" and uses "gsub"
function and "stringr" package to clean the labels and make more readeable.

Then uses "merge" function to merge the Activity data to "dataset", and dplyr 
functions to rearrange, relocate and change class to some variables.
  
  
4) "APPROPIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES":

Uses "gsub" function to clean the variable names.

Finally, uses "write.table" to export data set into a file called "dataset.txt".
  
  
5) "FROM THE DATA IN STEP 4, CREATES A SECOND, INDEPENDENT TIDY DATA SET WITH 
THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT":

Uses "dplyr" functions ("group_by" and "summarise_if") to create a new data set 
called "dataset2", that contains one row by activity (6 per subject) by subject (30).
The first variables has the basic data ('Subject', 'Activity_Index', 'Activity', 'Type') 
and the other ones contains the averages of each variable by activity by subject.

Then uses "write.table" to export data set into a file called "datasummary.txt".

Finally, uses "rm" function to remove all secondary data.













