library(h2o)
h2o.init()
path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/prostate.csv"
h2o_df <- h2o.importFile(path)
gamma.inverse <- h2o.glm(y = "DPROS", x = c("AGE","RACE","CAPSULE","DCAPS","PSA","VOL"), training_frame = h2o_df, family = "gamma", link = "inverse")
gamma.log <- h2o.glm(y="DPROS", x = c("AGE","RACE","CAPSULE","DCAPS","PSA","VOL"), training_frame = h2o_df, family = "gamma", link = "log")
