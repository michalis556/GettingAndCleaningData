Description of run_analysis.R code
========================================================

This document should serve as a documentation for our code used to prepare a tidy dataset from the data collected from the accelerometers from the Samsung Galaxy S smartphone for 30 people performing a fixed set of activities. 

 
1. The first code chunk is used to merge the test set with the train set in the UCI HAR Dataset. We first assign the two sets to two dataframes, namely test and train and attach to these dataframes the activity and subject labels found in the corresponding text files. 
 
2. We use the rbind command to merge the est and train file into a dataframe named "alldata".

3. For this project we are interested only on the means and standard deviations of the variables measured. First we attach the column names found in the features text file to the "alldata" dataframe. Then we extract the column numbers of the columns containing the words mean() and std(). These are the columns we are interested in. We store these positions and then just create a "newset" which contains only these columns.

4. Note that the columns include also the fourier transforms of the original measurements. Since we are only interested in the original variables we need to remove these columns. We find the positions of these columns using similar procedure as before and remove them.

5. Now our dataset contains only the means and standard deviations of the measurements as required. We are interested in finding the means for each Subject and Activity in the dataset. To do this we first attach the Activity labels to the set, essentially replacing the activity number with the corresponding activity name. 

6. Then we substitute the original names of the columns with new more descriptive ones. The description of each of our new names is given in the CodeBook attached with this file and the R code for the analysis.

7. We reshape our data so that the Activities and the Subjects become the main variables. We use the melt command to do this. Then we find the mean for each Activity and Subject using the dcast command.

8. Finally we write the values found for each Activity and each subject to a new tidy data file. 















