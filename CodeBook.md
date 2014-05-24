Codebook
========================================================

This codebook should serve as a documentation for the transformations we made on our dataset for the analysis of the data collected from the accelerometers from the Samsung Galaxy S smartphone. 

For the purpose of this study we kept only the means and standard deviations of the measurements in our dataset. Note that each entry which ends with XYZ represents the same variable measured in the three dimensions:

X: Horizontal (Length) 

Y: Horizontal (Width)

Z: Vertical

Below we present the labels of the variables we have in our dataset and their representation:

1. Body Acceleration Mean XYZ - Body Acceleration Mean measured using the accelerometer

2. Body Acceleration Std XYZ - Body Acceleration Standard Deviation measured using the accelerometer.

3. Gravity Acceleration Mean XYZ - Gravitational Acceleration Mean measured using the accelerometer.

4. Gravity Acceleration Std XYZ - Gravitational Acceleration Standard Deviation measured using the accelerometer.

5. Body Gyroscope Mean XYZ - Body Gyroscope Mean measured using the gyroscope.

6. Gravity Gyroscope Std XYZ - Body Gyroscope Standard Deviation measured using the gyroscope.

7. Body Linear Acceleration Jerk Mean XYZ - Body Linear Acceleration Mean derived from the Body Acceleration and the Gravity Acceleration Means.

8. Body Linear Acceleration Jerk Std XYZ - Body Linear Acceleration Standard Deviation derived from the Body Acceleration and the Gravity Acceleration Standard Deviations.

9. Body Angular Velocity Jerk Mean XYZ - Body Angular Velocity Mean derived from the Gyroscope Mean.

10. Body Angular Velocity Jerk Std XYZ - Body Angular Velocity Standard Deviation derived from the Gyroscope Standard Deviation.

11. Body Linear Acceleration Magnitude Mean - Magnitude of Body Linear Acceleration Mean using the three-dimensional signals, calculated using the Euclidean norm.

12. Body Linear Acceleration Magnitude Std - Magnitude of Body Acceleration Standard Deviation using the three-dimensional signals, calculated using the Euclidean norm.

13. Body Gravity Acceleration Magnitude Mean - Magnitude of Body Gravity Acceleration Standard Deviation using the three-dimensional signals, calculated using the Euclidean norm.

14. Body Gravity Acceleration Magnitude Std - Magnitude of Body Gravity Acceleration Standard Deviation using the three-dimensional signals, calculated using the Euclidean norm.

15. Body Linear Acceleration Jerk Magnitude Mean - Magnitude of Body Linear Acceleration Standard Deviation using the three-dimensional signals, calculated using the Euclidean norm. 

16. Body Linear Acceleration Jerk Magnitude Std - Magnitude of Body Linear Acceleration Standard Deviation using the three-dimensional signals, calculated using the Euclidean norm.

17. Body Angular Velocity Magnitude Mean - Magnitude of Body Angular Velocity using the three-dimensional signals, calculated using the Euclidean norm. 

18. Body Angular Velocity Magnitude Std - Magnitude of Body Angular Velocity Standard Deviation using the three-dimensional signals, calculated using the Euclidean norm.

19. Body Angular Velocity Magnitude Jerk Mean - Magnitude of Body Gyroscope Acceleration using the three-dimensional signals, calculated using the Euclidean norm. 

20. Body Angular Velocity Magnitude Jerk Std - Magnitude of Body Gyroscope Acceleration Standard Deviation using the three-dimensional signals, calculated using the Euclidean norm. 


We have also attached the labels of the subjects and the activities they performed. For our study we have 30 subjects each performing 6 activities:

1. WALKING

2. WALKING UPSTAIRS

3. WALKING DOWNSTAIRS

4. SITTING

5. STANDING

6. LAYING

Finally we have transformed our data so that Activities and Subjects are the row variables and calculated the mean of each of the measurements described above for these  
variables. 
