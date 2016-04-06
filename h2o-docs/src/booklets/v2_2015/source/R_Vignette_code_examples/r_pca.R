ausPath <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/australia.csv"
airlines_hex <- h2o.importFile(path = ausPath)

australia_pca <- h2o.prcomp(training_frame = airlines_hex, transform = "STANDARDIZE",k = 3)
australia_pca
