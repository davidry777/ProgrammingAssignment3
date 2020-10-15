# Step 1: Merging training and test sets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, x)

# Step 2: Extracting measurements on the mean and standard deviation for each 
# measurement.
tidyData <- merged_data %>% 
  select(subject, code, contains("mean"), contains("std"))

# Step 3: Uses descriptive activity names to name the activities.
tidyData$code <- activities[tidyData$code, 2]

# Step 4: Labeling the data set with descriptive variable names.
names(tidyData)[2] = "activity"
names(tidyData)<-gsub("Acc", "Accelerometer", names(tidyData))
names(tidyData)<-gsub("Gyro", "Gyroscope", names(tidyData))
names(tidyData)<-gsub("BodyBody", "Body", names(tidyData))
names(tidyData)<-gsub("Mag", "Magnitude", names(tidyData))
names(tidyData)<-gsub("^t", "Time", names(tidyData))
names(tidyData)<-gsub("^f", "Frequency", names(tidyData))
names(tidyData)<-gsub("tBody", "TimeBody", names(tidyData))
names(tidyData)<-gsub("-mean()", "Mean", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-std()", "STD", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-freq()", "Frequency", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("angle", "Angle", names(tidyData))
names(tidyData)<-gsub("gravity", "Gravity", names(tidyData))

# Step 5: Create a second tidy data set with the average of each variable for 
# each activity and each subject.
finalData <- tidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(finalData, "FinalData.txt", row.name=FALSE)
