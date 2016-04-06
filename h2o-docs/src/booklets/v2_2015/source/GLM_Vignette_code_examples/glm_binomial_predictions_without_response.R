# Remove the response column to simulate new data points arriving without the answer being known.
newdata <- test
newdata$CAPSULE <- NULL
newpred <- h2o.predict(glm_fit, newdata)
head(newpred)
