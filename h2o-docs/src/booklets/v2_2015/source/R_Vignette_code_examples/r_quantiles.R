pros_path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/prostate.csv"
prostate_hex <- h2o.importFile(path = pros_path)
# Returns the percentiles at 0, 10, 20, ..., 100%
prostate.qs <- quantile(prostate_hex$PSA, probs = (1:10)/10)
prostate.qs

# Take the outliers or the bottom and top 10% of data
PSA.outliers <- prostate_hex[prostate_hex$PSA <= prostate.qs["10%"] | prostate_hex$PSA >=   prostate.qs["90%"],]
# Check that the number of rows return is about 20% of the original data
nrow(prostate_hex)

nrow(PSA.outliers)

nrow(PSA.outliers)/nrow(prostate_hex)
