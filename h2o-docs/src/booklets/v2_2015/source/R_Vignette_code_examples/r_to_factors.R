# Import prostate data
pros_path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/prostate.csv"
prostate_hex <- h2o.importFile(path = pros_path)

# Converts column 4 (RACE) to an enum
as.factor(prostate_hex[,4])

prostate_hex[,4] <- as.factor(prostate_hex[,4])
as.factor(prostate_hex[,4])

# Summary will return a count of the factors
summary(prostate_hex[,4])
