
## Description of the project 

This directory contains a data set obtained from accelerometer and gyroscope of comodity smartphone Samsung Galaxy S II and the detailed description of data transformation from a raw data set to a one that is ready for further processing. In the dataset one can find information about 30 subjects who perform one out of six activities while wearing smartphone on the waist. The set of performed activities are walking, walking upstairs, walking downstairs, sitting, standing and laying. Each subject and activity pair has a number of variables that contain a data collected from sensors. More detailed information about a data you can find in Codebook [https://github.com/mixacom/GetAndCleanDataProject/blob/master/codebook.md]. 

### Raw data set 

The original data set has been collected by Reyes-Ortiz et al. and available at this site [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]. Using  embedded accelerometer and gyroscope of the smartphone, authors captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See https://github.com/mixacom/GetAndCleanDataProject/blob/master/raw_features_info.txt for more details. 

## Transformation of the raw data set 

### Main steps 

1. Download and unpack the data.
2. Combine together train and test data. 
3. Add new columns with information about ID of subject and type of activity. 
4. Select only mean and standard deviation columns from the original data set. 
5. Combine features by subject and activity. 

More information availabe at cookbook [https://github.com/mixacom/GetAndCleanDataProject/blob/master/codebook.md]. 



## Reference  

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

