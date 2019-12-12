# Human Activity Recognition Using Smartphones Dataset

## Dataset summary
This dataset contains sensor signal readings for 30 subjects performing various activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) collected from a Samsung Galaxy S II smartphone.

## Columns
The dataset contains the following identifying columns:

- Subject: The number of the subject (1-30)
- Activity: The number of the activity (1-6)
- Activity.Label: A human-readable description of the activity (e.g SITTING)

The dataset contains the following variables in X, Y, and Z dimensions (replace X as appropriate):

- BodyAcceleration.Mean.X  
- BodyAcceleration.STD.X
- GravityAcceleration.Mean.X
- BodyAccelerationJerk.Mean.X
- BodyAccelerationJerk.Mean.X
- BodyGyro.Mean.X
- BodyGyro.STD.X
- BodyGyroJerk.Mean.X
- BodyGyroJerk.STD.X
- BodyAcceleration.Mean.X.FFT
- BodyAcceleration.STD.X.FFT
- BodyAcceleration.Mean.FrequencyX.FTT
- BodyAccelerationJerk.Mean.X.FTT
- BodyAccelerationJerk.STD.X.FFT
- BodyAccelerationJerk.Mean.FrequencyX.FTT
- BodyGyro.Mean.X.FFT
- BodyGyro.STD.X.FFT
- BodyGyro.Mean.FrequencyX.FFT
- AngleXGravityMean

The following variables are also available:

- BodyAccelerationMagnitude.Mean
- BodyAccelerationMagnitude.STD
- BodyAccelerationJerkMagnitude.Mean
- BodyAccelerationJerkMagnitude.STD
- GravityAccelerationMagnitude.Mean
- GravityAccelerationMagnitude.STD
- BodyGyroMagnitude.Mean
- BodyGyroMagnitude.STD
- BodyGyroJerkMagnitude.Mean
- BodyGyroJerkMagnitude.STD
- BodyAccelerationMagnitude.Mean.FFT
- BodyAccelerationMagnitude.STD.FFT
- BodyAccelerationMagnitude.Mean.Frequency.FFT
- BodyGyroMagnitude.Mean.FFT
- BodyGyroMagnitude.STD.FFT
- BodyGyroMagnitude.Mean.Frequency.FFT
- BodyGyroJerkMagnitude.Mean.FFT
- BodyGyroJerkMagnitude.STD.FFT
- BodyGyroJerkMagnitude.Mean.Frequency.FFT
- AngleBodyAccelerationMeanGravity
- AngleBodyAccelerationMeanGravityMean
- AngleBodyGyroAccelerationMeanGravity
- AngleBodyGyroAccelerationMeanGravityMean

### Explanation of variables

All variables are average of measurements, grouped by subject and activity. 
- "Gyro" indicates the measurement was taken by the gyroscope
- "Acceleration" measurements were taken from the accelerometer
  - Acceleration is further separated into body and gravity measurements. 
- Linear acceleration and angular velocity were derived to obtain "Jerk" signals. 
- "Magnitude" measurements refer to the Euclidean norm of the underlying three-dimensional signals (i.e., X, Y, Z)
- A Fast Fourier Transform (FFT) is also available for signals, indicated by "FFT".

## Dataset generation

This dataset was derived from a source dataset available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following transformations were performed:

1. Two previously separate datasets "train" and "test" were merged to form a single dataset.
2. Only variables related to mean or STD of measurements were retained.
3. The dataset was merged with verbose activity labels.
4. Columns were renamed to be more descriptive (e.g. Acc -> Acceleration)
5. From this source dataset, a new aggregated dataset was created with the averages of all column values, grouped by the activity and the subject.

See README.md for more detail.
