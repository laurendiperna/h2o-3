library(h2o)
h2o.init()
path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/prostate.csv"
h2o_df <- h2o.importFile(path)
h2o_df$CAPSULE = as.factor(h2o_df$CAPSULE)
rand_vec <- h2o.runif(h2o_df, seed = 1234)
train <- h2o_df[rand_vec <= 0.8,]
valid <- h2o_df[(rand_vec > 0.8) & (rand_vec <= 0.9),]
test <- h2o_df[rand_vec > 0.9,]
glm_fit <- h2o.glm(y = "CAPSULE", x = c("AGE", "RACE", "PSA", "GLEASON"), training_frame = train, validation_frame = valid, family = "binomial")

# Make and export predictions.
pred <- h2o.predict(glm_fit, test)
h2o.exportFile(pred, "/tmp/pred.csv", force = TRUE)
# Or you can export the predictions to hdfs:
#   h2o.exportFile(pred, "hdfs://namenode/path/to/file.csv")

# Calculate metrics.
perf <- h2o.performance(glm_fit, test)
print(perf)
