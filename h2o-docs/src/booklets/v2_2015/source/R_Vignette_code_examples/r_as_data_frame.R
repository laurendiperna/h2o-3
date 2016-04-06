# Creates object that defines path
pros_path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/prostate.csv"
# Imports data set
prostate_hex <- h2o.importFile(path = pros_path, destination_frame="prostate_hex")

# Converts current data frame (prostate data set) to an R data frame
prostate.R <- as.data.frame(prostate_hex)
# Displays a summary of data frame where the summary was executed in R
summary(prostate.R)
