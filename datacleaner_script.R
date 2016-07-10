
#' Start Time
t_start<-Sys.time()

#' Get file path
dirpath<-getwd()
filepath<-file.path(dirpath,"UCI HAR Dataset")

#' Read Files and Convert to data table
x_train<-read.table(file.path(filepath, "train", "x_train.txt"))
x_train<-data.table(x_train)
x_test<-read.table(file.path(filepath,"test","x_test.txt"))
x_test<-data.table(x_test)

y_train<-read.table(file.path(filepath,"train","y_train.txt"))
y_train<-data.table(y_train)
y_test<-read.table(file.path(filepath,"test","y_test.txt"))
y_test<-data.table(y_test)

subject_train<-read.table(file.path(filepath,"train","subject_train.txt"))
subject_train<-data.table(subject_train)

subject_test<-read.table(file.path(filepath,"test","subject_test.txt"))
subject_test<-data.table(subject_test)

activitynames<-read.table(file.path(filepath,"activity_labels.txt"))
activitynames<-data.table(activitynames)

datafeatures<-read.table(file.path(filepath,"features.txt"),stringsAsFactors = FALSE)
datafeatures<-data.table(datafeatures)

#' Bind Data and nameing the columns
setnames(datafeatures, names(datafeatures), c("featurenum", "featurename"))
subject <- rbind(subject_train, subject_test)
setnames(subject, "V1", "subject")
activity <- rbind(y_train, y_test)
setnames(activity, "V1", "activitynum")
data <- rbind(x_train, x_test)
setnames(data, names(data), datafeatures$featurename)

#' Finding Features containing Mean and Standard Deviation
featureslog <- grepl("-mean\\(\\)|-std\\(\\)", datafeatures$featurename)

#'Subsetting required data
data<-data[,featureslog, with=FALSE]

#'Bind and set names and merge required data from different files using activity number
subject <- cbind(subject, activity)
data <- cbind(subject, data)
setnames(activitynames, names(activitynames), c("activitynum", "activityname"))
data <- merge(data, activitynames, by="activitynum", all.x=TRUE)

#' Remove activity number from data as it is no longer required
data<-select(data,-activitynum)
data$subject<-as.factor(data$subject)
data<-group_by(data,subject, activityname)
datatidy<-data %>%  summarise_each(funs(mean(.)))

#End Time and Total Time
t_end<- Sys.time()
t_total<-t_end-t_start
timetext<-c("Start Time : ", "End Time : " , "Total Time :")
timetaken<-c(as.character(t_start),as.character(t_end),as.character(t_total))

#`------------------------End of Script-------------------------
paste(timetext,timetaken)


