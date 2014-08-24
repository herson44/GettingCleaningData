## This function checks if the the file (data_file) of the project already exist in our directory
## If the file exists then the function start the process of get a tidy data file


data_file <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"



if (!file.exists(data_file)) {

  download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", data_file)

  unzip(data_file)}

unzip(data_file)

## Then set a independent working directory

directory <- "UCI HAR Dataset"


##========================================================================================================

## The objetive of Read_Files_In_Original_Data_Set function is read the files of test and training charters

Read_Files_In_Original_Data_Set  <- function(type="test"){
  
  file_names <- c("<directory>//<component>//X_<component>.txt", "<directory>//<component>//subject_<component>.txt",
                 "<directory>//<component>//y_<component>.txt")

  file_names <- gsub("<component>",type,file_names)
  file_names <- gsub("<directory>",directory,file_names)
  
  features <- read.table("UCI HAR Dataset//features.txt", sep=" ",col.names=c("feature_id","feature_name"))
  
  variables <- read.table(file_names[1], col.names=features$feature_name,colClasses="numeric")
  
  subjects <- read.table(file_names[2], col.names="subject_id",colClasses="integer")
  
  activtitys <- read.table(file_names[3], col.names="activity_id",colClasses="integer")
  

  cbind(variables, subjects, activtitys)}



## Then the function merges (by call the function Read_Files_In_Original_Data_Set) the training and the test sets to
## create only one data set.

Raw_Train_DataSet <- Read_Files_In_Original_Data_Set ("train")
Raw_Test_DataSet <- Read_Files_In_Original_Data_Set ("test")


One_DataSet <- rbind(Raw_Train_DataSet, Raw_Test_DataSet )


##============================================================================================

## Calculate the mean and standard deviation for each measurement 
## Select only the mean and stdev columns and two clasificaories columns

column_names <- c(names(One_DataSet)[grep(x=names(One_DataSet), pattern="((\\.(mean|std)(\\.){2,}[x-z]?)){1}", ignore.case=T)],
                       "subject_id","activity_id")
One_DataSet <- One_DataSet[,column_names]



## Then create descriptive activity names for activities in the data set
## This is a little controversial because "descriptive" is a subjective word


activity_file_name <- "<directory>//activity_labels.txt"
activity_file_name <- gsub("<directory>",directory,activity_file_name)
activities <- read.table(activity_file_name, sep=" ", col.names=c("activity_id","activity_id"))
One_DataSet <- merge(One_DataSet, activities,by="activity_id")[-1]

 
names(One_DataSet) <- gsub("\\.","", names(One_DataSet ),ignore.case=T)

names(One_DataSet) <- gsub("mean","Mean", names(One_DataSet),ignore.case=T)

names(One_DataSet) <- gsub("std","Std", names(One_DataSet),ignore.case=T)

names(One_DataSet) <- gsub("^(t)","Time", names(One_DataSet),ignore.case=T)

names(One_DataSet) <- gsub("^(f)","Frequency", names(One_DataSet),ignore.case=T)

names(One_DataSet) <- gsub("gravity","Gravity", names(One_DataSet),ignore.case=T)

names(One_DataSet) <- gsub("bodybody|body","Body", names(One_DataSet),ignore.case=T)

##==========================================================================================

## Finally create the txt file called tidy_data_GCD.txt that is an independent tidy data set

tidy_data <- aggregate(. ~ subject_id+activity_id, One_DataSet, mean)

write.table(tidy_data, file = "./tidy_data_GCD.txt",row.names=F)
