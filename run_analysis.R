
# download file to a local computer 
linkUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(linkUrl, "UCIdataset.zip") 

# if you receive a message with "permission denied" text, please unzip the archive manually   
if (!dir.exists("/activities")) {
    dir.create("./activities") 
}
unzip("UCIdataset.zip", exdir = "./activities") 

# change working directory to the new one with extracted files 
oldwd <- getwd() 
setwd("./activities/UCI HAR Dataset") 
list.files() 

# load data into memory 
trainSet <- read.table("./train/X_train.txt") 
trainSubj <- read.table("./train/subject_train.txt") 
trainAct <- read.table("./train/y_train.txt") 
testSet <- read.table("./test/X_test.txt") 
testSubj <- read.table("./test/subject_test.txt") 
testAct <- read.table("./test/y_test.txt") 

# add ids of participants and activities to each set    
trainSet <- cbind(trainSubj, trainAct, trainSet) 
testSet <- cbind(testSubj, testAct, testSet) 

# merge sets to a big one      
combinedAll <- rbind(trainSet, testSet) 

# add meaningful names to columns 
nameColumn <- read.table("./features.txt") 
nameColumn <- as.character(nameColumn[, 2])  
combinedAll <- setNames(combinedAll, c("person", "activity", nameColumn))  

# choose mean and std columns 
meanstdSet <- combinedAll[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545)] 

# substitute activity id values with string descriptions 
activities <- read.table("./activity_labels.txt")
meanstdSet$activity <- gsub(1, as.character(activities[1, 2]), meanstdSet$activity) 
meanstdSet$activity <- gsub(2, as.character(activities[2, 2]), meanstdSet$activity)  
meanstdSet$activity <- gsub(3, as.character(activities[3, 2]), meanstdSet$activity)  
meanstdSet$activity <- gsub(4, as.character(activities[4, 2]), meanstdSet$activity)  
meanstdSet$activity <- gsub(5, as.character(activities[5, 2]), meanstdSet$activity)  
meanstdSet$activity <- gsub(6, as.character(activities[6, 2]), meanstdSet$activity)  

# reshape data frame by person and activity to a narrow form   
meanstdSet$person <- as.factor(meanstdSet$person)
meanstdSet$activity <- as.factor(meanstdSet$activity) 
tds <- aggregate(meanstdSet, list(meanstdSet$person, meanstdSet$activity), mean) 
tds <- tds[-c(3, 4)] 
colnames(tds)[c(1, 2)] <- c("Person", "Activity") 

# save file for a submission 
write.table(tds, "tidy_set.txt", row.names = FALSE) 

# return previously saved working directory 
setwd(oldwd) 


