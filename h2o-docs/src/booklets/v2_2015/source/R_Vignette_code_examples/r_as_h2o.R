# Import the iris data into H2O
data(iris)
iris

# Converts R object "iris" into H2O object "iris_hex"
iris_hex <- as.h2o(iris, destination_frame= "iris_hex")

head(iris_hex)
