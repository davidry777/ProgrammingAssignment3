# Code Book
The ```run_analysis.R``` script performs the 5 steps required as described
in the course project's definition. I've downloaded the data set and stored it
inside ProgrammingAssignment3 repository, later setting my working directory
to this specific repo.

### 1. Merges the training and test data sets to create one data set
  * ```x``` is created by merging ```x_train``` and ```x_test``` using the **rbind()** function.
  * ```y``` is created by merging ```y_train``` and ```y_test``` using the **rbind()** function.
  * ```subject``` is created by merging ```subject_train``` and ```subject_test``` using the **rbind()** function.
  * ```merged_data``` is created by merging ```subject```, ```x```, and ```y``` using the **cbind()** function.
  
### 2. Extracts only the measurements on the mean and standard deviation for each measurement
  * ```tidyData``` is created by subsetting ```merged_data```, selecting the following columns: ```subject```, ```code```, and the measurements on the ```mean``` and ```std```(_standard deviation_) for each measurement.