library(h2o)
h2o.init()
weather.hex <- h2o.importFile("http://h2o-public-test-data.s3.amazonaws.com/smalldata/junit/weather.csv")

# Get a summary of the data
summary(weather.hex)
