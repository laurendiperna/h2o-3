iris_path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/iris.csv"
iris_hex <- h2o.importFile(path = iris_path, destination_frame = "iris_hex")
