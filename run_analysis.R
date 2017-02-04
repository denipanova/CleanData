################################################################################
### Clean Data Course
### Final project

#### raw data
#setworking dir
#setwd('/home/didi')

zipfile = tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",zipfile, mode="wb")
unzip(zipfile)
#look at the directories 
list.dirs()
# change to the unziped folder
setwd('UCI HAR Dataset/') 
#list the directories so that we can loop through them
directories = list.dirs()
l = sapply(directories, function(x) nchar(x))

## get only teh appropriate directories, meaning not the current directory 
## and the sub directories  
directories = directories[l>1&l<20]
## load in the data 

for ( d in 1:length(directories)){ #we do not choose the current one 
  current_dir = directories[d] #set which is the current directory
  print(current_dir)
  #find the text files inside thsi directory
  temp_files = list.files(current_dir,pattern="*.txt") 
  #loop through these files and read them in 
  for(f in 1:length(temp_files)){
    #appoint the path to the file
    file_name = paste(current_dir,temp_files[f], sep = '/')
    print(file_name)
    #assign name to the file 
    assign(gsub('.txt','',temp_files[f]), read.table(file_name, header = FALSE))
  }
}

### Merge the data sets
# first create train
train = cbind(subject_train, X_train, y_train)
## load in the feature names 
features = as.vector(read.table('features.txt')[,2])
colnames(train) = c('subject',features,"y")

#then do the test
test = cbind(subject_test, X_test, y_test)
colnames(test) = c('subject',features,"y")

##merge them together
data = rbind(train,test)


## Extract the mean and st dev of every measure

mean_col = grep('mean',colnames(data))
std_col = grep('std',colnames(data))

mean_std_data = data[,c(mean_col,std_col)]



### activity labels 
activity_labels = read.table('activity_labels.txt')

## add activity label by merging them to teh data set

data = merge(data,activity_labels,by.x = 'y',by.y ='V1', all.x = TRUE)
colnames(data)[ncol(data)] = 'activity_label'

##### create new data set with the average for each variable for each subject and each label
if (!exists("data.table")) install.packages("data.table")
library('data.table')
data = as.data.table(data)
average_data = data[,lapply(.SD, mean), by=.(subject,activity_label)]



### Save the Tidy DATA SET

write.csv(data,'tidy_data.csv')
write.csv(average_data,'tidy_average_data.csv')



