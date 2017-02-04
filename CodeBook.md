#Code Book 

## Tidy_data.csv

Variables in the Data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.  
These signals were used to estimate variables of the feature vector for each pattern:    
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag 
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  
  
The set of variables that were estimated from these signals are:   

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
 
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  


This code book is created as an abstract from the features_info.txt file which is available for the UCI NAR dataset.
Additional variables which this analysis adds are:
* subject, which refers to the subject who performed the activity (it is coded from 1 to 30)
* activity_label identifies which activity the particular row represents
* y also identifies which activity the particular row represents but in terms of numeric value


##Tidy_average_data.csv
The variables in this data set are the same as the ones which we have identified in the tidy_data.csv 
The difference here is that this obsrevation represent the average of each column in the tidy_data.csv in terms 
of subject and activity_label buckets. 





