
##Read and combine data
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",sep="")
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt",sep="")
y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt",sep="")

subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",sep="")
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt",sep="")
y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt",sep="")

train<-cbind(x_train,y_train,subject_train)
test<-cbind(x_test,y_test,subject_test)
data<-rbind(train,test)


##Extracts only the measurements on the mean and standard deviation for each measurement
features<-read.csv("./UCI HAR Dataset/features.txt",header=FALSE)
pick<-grepl("mean|std",features[,1])
col<-features[pick,]
col_prefix<-strsplit(as.character(col),"\\s")
firstelement<-function(x){x[1]}
n<-as.numeric(sapply(col_prefix,firstelement))
n<-append(n,c(ncol(train)-1,ncol(train)))
data.1<-data[,n]


##Assign Column Name and clean Column Name
secondelement<-function(x){x[2]}
name<-sapply(col_prefix,secondelement)
revised_name<-gsub("-",".",name)
revised_name<-gsub("\\(|)","",revised_name)
names(data.1)<-append(revised_name,c("activity","subject"))


##Uses descriptive activity names to name the activities
activity_labels<-read.csv("./UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE,col.names=c("activity","activity.name"))
library(dplyr)
data.2<-left_join(data.1,activity_labels,by="activity")
data.2$activity<-NULL

##Create tidy data with one observation for each row
data.3<-data.2 %>% group_by(subject,activity.name)
data.4<-summarise_each(data.3,funs(mean))
write.table(data.4,file="cleandata.txt",row.name=FALSE)
