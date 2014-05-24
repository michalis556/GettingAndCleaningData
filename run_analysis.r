
##                                           ##
##   MERGE THE TEST SET WITH THE TRAIN SET   ##
##                                           ##




## This is the test file directory
testurl<-"UCI HAR Dataset\\test\\x_test.txt"
test<-read.table(testurl,row.names=NULL)    

## This is the activity file directory for test set
acturl<-"UCI HAR Dataset\\test\\y_test.txt"
testact<-read.table(acturl,row.names=NULL)

## This is the subject file directory for test set
suburl<-"UCI HAR Dataset\\test\\subject_test.txt"
testsub<-read.table(suburl,row.names=NULL)



## This is the train file directory
trainurl<-"UCI HAR Dataset\\train\\X_train.txt"
train<-read.table(trainurl,row.names=NULL)  

## This is the tactivity file directory for the train set
actrurl<-"UCI HAR Dataset\\train\\y_train.txt"
trainact<-read.table(actrurl,row.names=NULL)  

## This is the subject file directory for test set
subturl<-"UCI HAR Dataset\\train\\subject_train.txt"
trainsub<-read.table(subturl,row.names=NULL)





## Attach the activity and subject columns on the test and the train sets
test$activity<-testact$V1
train$activity<-trainact$V1
test$subject<-testsub$V1
train$subject<-trainsub$V1

## create a dataframe for test file
datatest<-as.data.frame.matrix(test)  


## create a dataframe for train file
datatrain<-as.data.frame.matrix(train) 


## merge test and train file into alldata
alldata<-rbind(datatest,datatrain)      


##                                           ##
##    CREATE A DATASET CONTAINING ONLY THE   ##
##    MEANS AND THE STANDARD DEVIATIONS      ##
##                                           ##


## Create a list with all the features in the dataset
featuresurl<-"UCI HAR Dataset\\features.txt"
features<-read.table(featuresurl)   
features$V2<-as.character(features$V2)


## Pass the names of the features as column names of the dataset
for(i in 1:length(features$V2)){
        
        colnames(alldata)[i]<-features$V2[i]
}


##extract the positions of the means and the standard deviations. Note that the means are
##abbreviated by mean() and the standard deviations by std()

posmean<-vector("integer")
j=1
posstd<-vector("integer")
k=1

for(i in 1:length(colnames(alldata))){
        
        ##vectors to identify column positions of means and standard deviations
     
        
        ##identify if a column name contains the text mean() or the text std()
        grepmean = grepl("mean()",colnames(alldata)[i])
        grepstd = grepl("std()",colnames(alldata)[i])
        
                          ## Store the positions of the means
        if(grepmean == "TRUE"){
                
                posmean[j]=i
                j=j+1
        }                 ##Store the positions of the standard deviations
                else if(grepstd == "TRUE"){
                        
                        posstd[k]=i
                       k=k+1
                }

}

## bind the positions of means and standard deviations in one vector
positions<-c(posmean,posstd)

## CREATE A NEW DATASET WITH ONLY THE MEANS AND THE STANDARD DEVIATIONS
newset<-alldata[,positions]



## REMOVE ALL THE MEASUREMENTS THAT WHERE TRANSFORMED USING FOURIER TRANSFORM
posmeas<-vector("integer")
z=1


for(i in 1:length(colnames(newset))){
  
  
  ##identify if a column name contains the text mean() or the text std()
  grepmeas = grepl("^t",colnames(newset)[i])

  
  ## Store the positions of the measurements
  if(grepmeas == "TRUE"){
    
    posmeas[z]=i
    z=z+1
  }               
  
}

## CREATE A NEW DATASET WITH ONLY THE MEANS AND THE STANDARD DEVIATIONS     ##
## OF MEASUREMENTS ADDING THE ACTIVITY LABELS AND SUBJECT LABELS            ##

newset<-newset[,posmeas]
newset$Activity<-alldata$activity
newset$Subject<-alldata$subject


##                                           ##
##    PUT LABELS ON ACTIVITIES               ##
##                                           ##


## read the activity text file into R and pass the names to the values of 
## the activities in the new set
actnamesurl<-"UCI HAR Dataset\\activity_labels.txt"
activitynames<-read.table(actnamesurl)
activities<-gsub("_"," ",activitynames$V2)

##substitute numbers with activity names in activity column
for(i in 1:length(activities)){
  newset$Activity<-gsub(i,activities[i],newset$Activity)
}



##                                           ##
##    PUT LABELS ON MEASUREMENTS             ##
##                                           ##


newnames<-gsub("tBodyAcc-mean()-","Body Acceleration Mean ",names(newset),fixed=TRUE)
newnames<-gsub("tBodyAcc-std()-","Body Acceleration Std ",newnames,fixed=TRUE)
newnames<-gsub("tGravityAcc-mean()-","Gravity Acceleration Mean ",newnames,fixed=TRUE)
newnames<-gsub("tGravityAcc-std()-","Gravity Acceleration Std ",newnames,fixed=TRUE)
newnames<-gsub("tBodyGyro-mean()-","Body Gyroscope Mean ",newnames,fixed=TRUE)
newnames<-gsub("tBodyGyro-std()-","Gravity Gyroscope Std ",newnames,fixed=TRUE)
newnames<-gsub("tBodyAccJerk-mean()-","Body Linear Acceleration Jerk Mean ",newnames,fixed=TRUE)
newnames<-gsub("tBodyAccJerk-std()-","Body Linear Acceleration Jerk Std ",newnames,fixed=TRUE)
newnames<-gsub("tBodyGyroJerk-mean()-","Body Angular Velocity Jerk Mean ",newnames,fixed=TRUE)
newnames<-gsub("tBodyGyroJerk-std()-","Body Angular Velocity Jerk Std ",newnames,fixed=TRUE)
newnames<-gsub("tBodyAccMag-mean()","Body Linear Acceleration Magnitude Mean",newnames,fixed=TRUE)
newnames<-gsub("tBodyAccMag-std()","Body Linear Acceleration Magnitude Std",newnames,fixed=TRUE)
newnames<-gsub("tGravityAccMag-mean()","Body Gravity Acceleration Magnitude Mean",newnames,fixed=TRUE)
newnames<-gsub("tGravityAccMag-std()","Body Gravity Acceleration Magnitude Std",newnames,fixed=TRUE)
newnames<-gsub("tBodyAccJerkMag-mean()","Body Linear Acceleration Jerk Magnitude Mean",newnames,fixed=TRUE)
newnames<-gsub("tBodyAccJerkMag-std()","Body Linear Acceleration Jerk Magnitude Std",newnames,fixed=TRUE)
newnames<-gsub("tBodyGyroMag-mean()","Body Angular Velocity Magnitude Mean",newnames,fixed=TRUE)
newnames<-gsub("tBodyGyroMag-std()","Body Angular Velocity Magnitude Std",newnames,fixed=TRUE)
newnames<-gsub("tBodyGyroJerkMag-mean()","Body Angular Velocity Magnitude Jerk Mean",newnames,fixed=TRUE)
newnames<-gsub("tBodyGyroJerkMag-std()","Body Angular Velocity Magnitude Jerk Std",newnames,fixed=TRUE)

names(newset)<-newnames


##                                           ##
##    FIND THE AVERAGE OF EACH VARIABLE      ##
##    FOR EACH ACTIVITY AND EACH SUBJECT     ##
##    AND EXTRACT A TIDY SET WITH THESE      ##
##                                           ##

library(reshape2)

Melt<-melt(newset,id=c("Activity","Subject"))

tidy<-dcast( Melt, Subject+Activity~variable,mean)


## write the data into a tidy dataset##

write.table(tidy,file="TidySet.txt")
