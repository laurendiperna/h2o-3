library(h2o)
h2o.init(nthreads = -1)

# Import iris dataset to H2O
iris_path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/iris_wheader.csv"
iris_hex <- h2o.importFile(path = iris_path, destination_frame = "iris_hex")

# Apply function to groups by class of flower
# uses h2o's ddply, since iris_hex is an H2OFrame object
res <- h2o.group_by(data = iris_hex, by = "class", mean("sepal_len", na.rm=T),gb.control=list(na.methods="rm"))
head(res)
