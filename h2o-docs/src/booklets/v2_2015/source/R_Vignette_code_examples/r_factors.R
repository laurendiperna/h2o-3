iris_path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/iris_wheader.csv"
iris_hex <- h2o.importFile(path = iris_path)
h2o.anyFactor(iris_hex)
