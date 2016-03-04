


if(!file.exists("getcleandata.zip")) { fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

  download.file(fileurl,dest="getcleandata.zip",method="curl")
  unzip("getcleandata.zip")}

#read the training files
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("UCI HAR Dataset/train/Y_train.txt")
strain<-read.table("UCI HAR Dataset/train/subject_train.txt")

#read the test files
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("UCI HAR Dataset/test/Y_test.txt")
stest<-read.table("UCI HAR Dataset/test/subject_test.txt")

#read activity and features table
activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt")
activitylabels[,2]<-as.character(labels[,2])
colnames(activitylabels)=c("activity_id", "activity_type")

features<-read.table("UCI HAR Dataset/features.txt")
features[,2]<-as.character(features[,2])

colnames(ytest)="activity_id"
colnames(xtest)=features[,2]
colnames(strain)="subject"

colnames(ytrain)="activity_id"
colnames(xtrain)=features[,2]
colnames(stest)="subject"

#create tables
total_training<-cbind(ytrain,xtrain,strain)
total_test<-cbind(ytest,xtest,stest)

total_data<-rbind(total_training,total_test)

#create column name vector
total_names<-names(total_data)

logvec<-grepl("activity",total_names) | grepl("subject",total_names) | grepl(".*mean.*",total_names) | grepl(".*std.*",total_names)

#subset the data
new_data<-total_data[logvec==TRUE]

#combine data sets to include activity type
new_data<-merge(activitylabels,new_data,by="activity_id")

colnames<-names(new_data)
 #clean up the names
colnames=gsub("-mean"," Mean ",colnames)
colnames=gsub("-std"," Standard Deviation",colnames)
colnames=gsub("[()]","",colnames)
colnames=gsub("^(t)","Time ",colnames)
colnames=gsub("^(f)","Frequency ",colnames)
colnames=gsub("[Mm]ag","Magnitude",colnames)
colnames=gsub("[Bb]ody[Bb]ody|[Bb]ody","Body ",colnames)


colnames(new_data)<-colnames

tidydata<-aggregate(.~subject+activity_type,new_data,mean)
tidydata<-tidydata[order(tidydata$subject, tidydata$activity_type),]

write.table(tidydata,file="tidydata.txt",row.names = TRUE)





























