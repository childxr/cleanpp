## Objective
This CodeBook explains how the run_analysis.R process to get the final tidy set.

## Procedure
Basically, the final tidy set, which stored in 'stat.txt', comes after 10 steps:
* combine test dataset: merge subject, y and X test dataset by columns and produce a test dataset called 'test' with dimension 2947 * 563
* combine training dataset: merge subject, y, and X training dataset by columns and produce training dataset called 'train' with dimension 7352 * 563
* merge training and test set: merge test dataset and training dataset into one set by rows called 'total'
* produce 1:1 match activity name according to activity code: according to activity code which is in the second column of the total dataset, create a character vector called 'activityName' contains the activity names to each entry of the activity code.
* extract interested features: features in total dataset including subject, activity code and features computed in mean() or std() are interested features. These feature names are extracted into a character vector call 'intereased_features' and their corresponding indexes are extracted into a numeric vector call 'indexes'. According to the indexes, a subset of total dataset called 'tmpInterested' is created.
* add activity name into dataset: combine activityName with tmpInterested dataset, producing 'totalInterested' which contains all of interested features.
* reorder columns: reorder to columns in totalInterested dataset such at the columns is in the order of subject, activityCode, activityName, features computed with mean() or std()..
* Compute average of interested features per subject per activity: aggregate data for each subject and activity, and compute the average of interested features obtained by mean() or std(). The result is saved into a dataframe called 'stat'
* Add feature names to rows and columns of the output dataset: give the each row the name according to their index in the stat. Give their column names as 'subject', 'activityCode', 'activityName', 'AVE[+ original name in input dataset]'
* Output the result to stat.txt file: write the final dataset stat into stat.txt 

## Output: stat.txt
The dimension of stat is 180 * 69. 180 is the final rows of the output, 69 is 69 interested features:
 [1] "subject"                       
 [2] "activityCode"                  
 [3] "activityName"                   
 [4] "AVEtBodyAcc-mean()-X"          
 [5] "AVEtBodyAcc-mean()-Y"           
 [6] "AVEtBodyAcc-mean()-Z"          
 [7] "AVEtBodyAcc-std()-X"            
 [8] "AVEtBodyAcc-std()-Y"           
 [9] "AVEtBodyAcc-std()-Z"            
[10] "AVEtGravityAcc-mean()-X"       
[11] "AVEtGravityAcc-mean()-Y"        
[12] "AVEtGravityAcc-mean()-Z"       
[13] "AVEtGravityAcc-std()-X"         
[14] "AVEtGravityAcc-std()-Y"        
[15] "AVEtGravityAcc-std()-Z"         
[16] "AVEtBodyAccJerk-mean()-X"      
[17] "AVEtBodyAccJerk-mean()-Y"      
[18] "AVEtBodyAccJerk-mean()-Z"      
[19] "AVEtBodyAccJerk-std()-X"       
[20] "AVEtBodyAccJerk-std()-Y"       
[21] "AVEtBodyAccJerk-std()-Z"        
[22] "AVEtBodyGyro-mean()-X"         
[23] "AVEtBodyGyro-mean()-Y"          
[24] "AVEtBodyGyro-mean()-Z"         
[25] "AVEtBodyGyro-std()-X"           
[26] "AVEtBodyGyro-std()-Y"          
[27] "AVEtBodyGyro-std()-Z"           
[28] "AVEtBodyGyroJerk-mean()-X"     
[29] "AVEtBodyGyroJerk-mean()-Y"      
[30] "AVEtBodyGyroJerk-mean()-Z"     
[31] "AVEtBodyGyroJerk-std()-X"       
[32] "AVEtBodyGyroJerk-std()-Y"      
[33] "AVEtBodyGyroJerk-std()-Z"       
[34] "AVEtBodyAccMag-mean()"         
[35] "AVEtBodyAccMag-std()"           
[36] "AVEtGravityAccMag-mean()"      
[37] "AVEtGravityAccMag-std()"        
[38] "AVEtBodyAccJerkMag-mean()"     
[39] "AVEtBodyAccJerkMag-std()"       
[40] "AVEtBodyGyroMag-mean()"        
[41] "AVEtBodyGyroMag-std()"          
[42] "AVEtBodyGyroJerkMag-mean()"    
[43] "AVEtBodyGyroJerkMag-std()"      
[44] "AVEfBodyAcc-mean()-X"          
[45] "AVEfBodyAcc-mean()-Y"           
[46] "AVEfBodyAcc-mean()-Z"          
[47] "AVEfBodyAcc-std()-X"            
[48] "AVEfBodyAcc-std()-Y"           
[49] "AVEfBodyAcc-std()-Z"            
[50] "AVEfBodyAccJerk-mean()-X"      
[51] "AVEfBodyAccJerk-mean()-Y"       
[52] "AVEfBodyAccJerk-mean()-Z"      
[53] "AVEfBodyAccJerk-std()-X"        
[54] "AVEfBodyAccJerk-std()-Y"       
[55] "AVEfBodyAccJerk-std()-Z"        
[56] "AVEfBodyGyro-mean()-X"         
[57] "AVEfBodyGyro-mean()-Y"          
[58] "AVEfBodyGyro-mean()-Z"         
[59] "AVEfBodyGyro-std()-X"           
[60] "AVEfBodyGyro-std()-Y"          
[61] "AVEfBodyGyro-std()-Z"           
[62] "AVEfBodyAccMag-mean()"         
[63] "AVEfBodyAccMag-std()"           
[64] "AVEfBodyBodyAccJerkMag-mean()" 
[65] "AVEfBodyBodyAccJerkMag-std()"   
[66] "AVEfBodyBodyGyroMag-mean()"    
[67] "AVEfBodyBodyGyroMag-std()"      
[68] "AVEfBodyBodyGyroJerkMag-mean()"
[69] "AVEfBodyBodyGyroJerkMag-std()"