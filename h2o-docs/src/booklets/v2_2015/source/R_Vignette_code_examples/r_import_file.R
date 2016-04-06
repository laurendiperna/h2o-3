#To import small iris data file from H2O's package:
iris_path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/iris.csv"
iris_hex <- h2o.importFile(path = iris_path, destination_frame = "iris_hex")

#To import an entire folder of files as one data object:
# pathToFolder <- "/Users/data/airlines/"
# airlines_hex <- h2o.importFile(path = pathToFolder, destination_frame = "airlines_hex")

#To import from HDFS and connect to H2O in R using the IP and port of an H2O instance running on your  Hadoop cluster:
# h2o.init(ip<- <IPAddress>, port =54321, nthreads = -1)
# pathToData <- "hdfs://mr-0xd6.h2oai.loc/datasets/airlines_all.csv"
# airlines_hex <- h2o.importFile(path = pathToData, destination_frame = "airlines_hex")
