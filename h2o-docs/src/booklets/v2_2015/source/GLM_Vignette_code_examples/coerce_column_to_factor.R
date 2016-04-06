library(h2o)
h2o.init()
path = "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/prostate.csv"
h2o_df = h2o.importFile(path)
h2o_df$CAPSULE = as.factor(h2o_df$CAPSULE)
summary(h2o_df)
