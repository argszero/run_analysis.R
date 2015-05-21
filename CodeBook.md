# Getting and Cleaning Data Course Project
## raw data
### download
the raw data can be download from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
### data description
the full description of the data can be found in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
```
.
├── run_analysis.R                       script to be run
└── UCI\ HAR\ Dataset                    the data directory where downloaded data uncompress to
    ├── activity_labels.txt              the mapping from activity id to name
    ├── features_info.txt                description of features
    ├── features.txt                     the maping from features(column in test and train data) index to name
    ├── README.txt
    ├── test                             test data directory
    │   ├── Inertial\ Signals
    │   │   ├── body_acc_x_test.txt
    │   │   ├── body_acc_y_test.txt
    │   │   ├── body_acc_z_test.txt
    │   │   ├── body_gyro_x_test.txt
    │   │   ├── body_gyro_y_test.txt
    │   │   ├── body_gyro_z_test.txt
    │   │   ├── total_acc_x_test.txt
    │   │   ├── total_acc_y_test.txt
    │   │   └── total_acc_z_test.txt
    │   ├── subject_test.txt             Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
    │   ├── X_test.txt                   Test set
    │   └── y_test.txt                   Test labels
    └── train                            train data directory
        ├── Inertial\ Signals
        │   ├── body_acc_x_train.txt
        │   ├── body_acc_y_train.txt
        │   ├── body_acc_z_train.txt
        │   ├── body_gyro_x_train.txt
        │   ├── body_gyro_y_train.txt
        │   ├── body_gyro_z_train.txt
        │   ├── total_acc_x_train.txt
        │   ├── total_acc_y_train.txt
        │   └── total_acc_z_train.txt
        ├── subject_train.txt             Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
        ├── X_train.txt                   Training set
        └── y_train.txt                   Training labels
```
### variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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
angle(): Angle between to vectors.

for more details ,please read features_info.txt in the data directory

## work:
1. merges the training and the test dataset
2. replace the feature index to feature name
3. filter the feature only keep mean and std
4. replace activity id to activity name
5. aggregate the dataset using function mean by "activity_name" and "subject"
6. save the tidy data to file
