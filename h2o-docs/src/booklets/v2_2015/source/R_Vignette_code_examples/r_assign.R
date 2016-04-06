pros_path <- "http://h2o-public-test-data.s3.amazonaws.com/smalldata/extdata/prostate.csv"
prostate_hex<-h2o.importFile(path = pros_path)

## Assign a new name to prostate dataset in the KV store
h2o.ls()

prostate_hex <- h2o.assign(data = prostate_hex, key = "myNewName")
h2o.ls()
