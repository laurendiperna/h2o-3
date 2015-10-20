



def spaces_in_column_names():
    
    

    train_data = h2o.upload_file(path=pyunit_utils.locate("smalldata/jira/spaces_in_column_names.csv"))
    train_data.show()
    train_data.describe()
    X = ["p r e d i c t o r 1","predictor2","p r e d i ctor3","pre d ictor4","predictor5"]
    gbm = h2o.gbm(x=train_data[X], y=train_data["r e s p o n s e"].asfactor(), ntrees=1, distribution="bernoulli", min_rows=1)
    gbm.show()


spaces_in_column_names()
