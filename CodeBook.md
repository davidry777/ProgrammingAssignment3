# Code Book
The ```run_analysis.R``` script performs the 5 steps required as described
in the course project's definition. I've downloaded the data set and stored it
inside ProgrammingAssignment3 repository, later setting my working directory
to this specific repo.

## Before doing anything, you must assign the following variables:
* ```features``` <- ```features.txt```
* ```activities``` <- ```activity_labels.txt```
* ```subject_test``` <- ```test/subject_test.txt```
* ```x_test``` <- ```test/X_test.txt```
* ```y_test``` <- ```test/y_test.txt```
* ```x_train``` <- ```test/X_train.txt```
* ```y_train``` <- ```test/y_train.txt```
* ```subject_train``` <- ```test/y_train.txt```

### 1. Merges the training and test data sets to create one data set
  * ```x``` is created by merging ```x_train``` and ```x_test``` using the **rbind()** function.
  * ```y``` is created by merging ```y_train``` and ```y_test``` using the **rbind()** function.
  * ```subject``` is created by merging ```subject_train``` and ```subject_test``` using the **rbind()** function.
  * ```merged_data``` is created by merging ```subject```, ```x```, and ```y``` using the **cbind()** function.
  
### 2. Extracts only the measurements on the mean and standard deviation for each measurement
  * ```tidyData``` is created by subsetting ```merged_data```, selecting the following columns: ```subject```, ```code```, and the measurements on the ```mean``` and ```std```(_standard deviation_) for each measurement.
  
### 3. Uses descriptive activity names to name the activities in the data set
  * All numbers in ```code``` column of the ```tidyData``` are replaced with corresponding activity from the second column of the ```activities``` variable.