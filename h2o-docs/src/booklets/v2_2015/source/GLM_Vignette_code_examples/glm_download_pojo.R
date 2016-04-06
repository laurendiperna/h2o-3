library(h2o)
h2o.init()
path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/prostate.csv"
h2o_df <- h2o.importFile(path)
h2o_df$CAPSULE <- as.factor(h2o_df$CAPSULE)
glm_fit <- h2o.glm(y = "CAPSULE", x = c("AGE", "RACE", "PSA", "GLEASON"), training_frame = h2o_df, family = "binomial")
h2o.download_pojo(glm_fit)
