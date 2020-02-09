# Getting and cleaning data course project

## Variables used in the script

* `features`, `activities`, `trainingSubject`, `trainingSet`, `trainingLabels`, `testSubject`, `testSet` and `testLabels` contain the data from the downloaded files  
* `dataMerged` contains the previous datasets merged using `cbind()` and `rbind()` functions
* `dataMergedNoDup` is the dataset with no duplicated variables  
* `meanstdSet` contains only variables of the dataset related to the mean and standard deviation. The `select()` function of the dplyr library is used   
* `dataSetCol` contains the names of the data set variables and is used to clean them with the `gsub()` function.  
The variable names were replaced with descriptive variable names, using the following set of rules:
	+ Special characters (i.e. `(`, `)`, and `-`) were removed
	+ The initial `f` and `t` were expanded to `frequency` and `time` respectively.
	+ `Acc`, `Gyro`, `Mag`, `Freq`, `mean`, and `std` were replaced with `Accelerometer`, `Gyroscope`, `Magnitude`, `Frequency`, `Mean`, and `StandardDeviation` respectively.
	+ Replaced `BodyBody` with `Body`.
* `meanGroupSet` is the summarized dataset grouped by Subject and activity. The `group_by()` and `summarize_ally()` functions of the dplyr library are used   


## Variables in the tidy dataset
### Identifiers

* `subjectID`: Subject identifier, integer, ranges from 1 to 30  

* `activityID`:	Activity identifier   
	+ `WALKING`: subject was walking  
	+ `WALKING_UPSTAIRS`: subject was walking upstairs  
	+ `WALKING_DOWNSTAIRS`: subject was walking downstairs  
	+ `SITTING`: subject was sitting  
	+ `STANDING`: subject was standing  
	+ `LAYING`: subject was laying  

### Average of measurements
All measurements are floating-point values, normalised and bounded within [-1,1].  

Prior to normalisation, acceleration measurements (variables containing `Accelerometer`) were made in *g*'s (9.81 m.s⁻²) and gyroscope measurements (variables containing `Gyroscope`) were made in radians per second (rad.s⁻¹).  

Magnitudes of three-dimensional signals (variables containing `Magnitude`) were calculated using the Euclidean norm.  

The measurements are classified in two domains:  

+ Time-domain signals (variables prefixed by `time`), resulting from the capture of accelerometer and gyroscope raw signals.  

+ Frequency-domain signals (variables prefixed by `frequency`), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.  

