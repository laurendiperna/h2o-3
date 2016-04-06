library(h2o)
h2o.init()
path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/prostate.csv"
h2o_df <- h2o.importFile(path)
gaussian.fit <- h2o.glm(y = "VOL", x = c("AGE", "RACE", "PSA", "GLEASON"), training_frame = h2o_df, family = "gaussian")
