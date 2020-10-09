library(dplyr)
library(stringr)

###############################################################################

# 1. MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET:

# Loading all datapaths:
datapaths <- list.files(paste(getwd(), "/UCI HAR Dataset", sep=""), 
                   recursive = TRUE, full.names = TRUE)

# Importing 'x' variable names:
xvarnames <- 
  read.table(datapaths[grepl("features.txt", datapaths)], 
             col.names = c("number", "variables")) %>%
  select(variables) %>%
  unlist %>%
  gsub(pat="[(][)]", rep="..") %>%      # converts "()" into ".." 
  gsub(pat="[(),-]", rep="")            # delete other characters


# This function detect and import 'x' (measurements), 'y' (activity) and 
# 'Subject' data. The function searches the data in the paths, by type 
# ('test' or 'train' data):
mergedata <- function(type, paths = datapaths)
{
  # Importing data (x, y, subject):
  for (d in 1:length(paths))
  {
  if (grepl(paste("/X_", type, sep=""), paths[d])==TRUE)
  {xdata <- read.table(paths[d], col.names = xvarnames)}
  if (grepl(paste("/y_", type, sep=""), paths[d])==TRUE)
    {ydata <- read.table(paths[d], col.names = "Activity_Index")} 
  if (grepl(paste("/subject_", type, sep=""), paths[d])==TRUE)
    {sdata <- read.table(paths[d], col.names = "Subject")}
  }
  result <- 
    cbind(sdata, ydata, xdata) %>%          # Bind all data cols (subject, y, x).
    mutate(Type=as.factor(type),            # Create a 'Type' column.
           Subject=as.factor(Subject)) %>%  # Class 'Subject' to 'factor'.
    relocate(Type, .after = Subject)        # Relocate 'Type' as second column.
}

# Use 'rbind' to create one dataset with all data ('test' and 'train'):
dataset <- rbind(mergedata(type="test"), mergedata(type="train"))


###############################################################################

# 2.EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH 
# MEASUREMENT (searches the original "mean()" and "std()" strings):

dataset <- 
  dataset %>%
  select(Subject, Type, Activity_Index, contains("mean..") | contains("std.."))  


###############################################################################

# 3. USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET:

# Importing and formatting activity labels:
act_labels <- 
  read.table(datapaths[grepl("activity_labels", datapaths)], header = FALSE,
             col.names = c("Activity_Index", "Activity")) %>%
  mutate(Activity = gsub(pattern = "_", replacement=" ", x = Activity)) %>%
  mutate(Activity = str_to_sentence(Activity))

# Merging 'Activity' labels in dataset:
dataset <- 
  dataset %>%
  merge(y=act_labels, by="Activity_Index") %>%    # Merge 'activity' labels.
  relocate(Activity, .after="Activity_Index") %>% # Relocate 'Activity'.
  relocate(Subject) %>%                           # Relocate 'Subject' as first.    
  arrange(Subject) %>%                            # Arrange by 'Subject'.
  mutate(Activity_Index = 
           as.factor(Activity_Index))             # 'Activity_Index' class
                                                  # to 'factor'.


###############################################################################

# 4. APPROPIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES:

dvariables <- 
  variable.names(dataset) %>%                               
  gsub(pat="[..]", rep="") %>%                # remove ".."    
  gsub(pat= "BodyBody", rep="Body") %>%       # remove "Body" duplicates 
  gsub(pat="mean", rep="_mean") %>%           # separate 'mean' word with "_"
  gsub(pat="std", rep="_std") %>%             # separate 'std' word with "_"
  gsub(pat="([a-z])([A-Z])", rep="\\1_\\2")   # separate by uppercases with "_"

colnames(dataset) <- dvariables

write.table(dataset, file = "dataset.txt", row.names = FALSE)

###############################################################################

# 5. FROM THE DATA IN STEP 4, CREATES A SECOND, INDEPENDENT TIDY DATA SET
# WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT:

datasummary <- 
  dataset %>%
  group_by(Subject, Activity_Index, Activity, Type) %>%
  summarise_if(.predicate = is.numeric, .funs = mean)

write.table(datasummary, file = "datasummary.txt", row.names = FALSE)

###############################################################################

# Remove all secondary data:
rm(act_labels, dvariables, datapaths, xvarnames)





