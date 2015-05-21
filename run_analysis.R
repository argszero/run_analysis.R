# read subject test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
# read subject train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
# merge subject
subject <- rbind(subject_test,subject_train)

# read x test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
# read x train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
# merge x
x <- rbind(x_test,x_train)

# read y test data
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
# read y train data
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
# merge y
y <- rbind(y_test,y_train)

# bind subject, x, y together
data <- cbind(subject,x,y)

# read features
features <- read.table("UCI HAR Dataset/features.txt")
# set col names
colnames(data)<-c("subject",as.vector(features$V2),"activity")
# filter features with mean and std
features_mean_std= features$V2[grep("mean()|std()",features$V2)]
# Extracts only the measurements on the mean and standard deviation 
# for each measurement
data_mean_std<-data[,c("subject",as.vector(features_mean_std),"activity")]

# read activity labels
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels)
colnames(activity_labels)<-c("activity_index","activity_name")

# Uses descriptive activity names to name the activities in the data set
data_merge<-merge(data_mean_std,
                                 activity_labels,by.x ="activity",
                                 by.y="activity_index")

# remove column "data_merge"
data_merge$activity<-NULL

# independent tidy data set with the average of each variable for 
# each activity and each subject
data_tidy<-aggregate(
  data_merge[,!(names(data_merge) %in% c("activity","activity_name","subject"))],
  by=list(activity_name=data_merge$activity_name,
          subject=data_merge$subject),FUN = mean)
# save tidy data to txt file
write.table(data_tidy,file="data_tidy.txt",row.name=FALSE,sep=",")
