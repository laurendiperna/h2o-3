



def weights_and_distributions():

    htable  = h2o.upload_file(pyunit_utils.locate("smalldata/gbm_test/moppe.csv"))
    htable["premiekl"] = htable["premiekl"].asfactor()
    htable["moptva"] = htable["moptva"].asfactor()
    htable["zon"] = htable["zon"]

    # gamma
    dl = h2o.deeplearning(x=htable[0:3],y=htable["medskad"],training_frame=htable,distribution="gamma",weights_column="antskad")
    predictions = dl.predict(htable)

    # gaussian
    dl = h2o.deeplearning(x=htable[0:3],y=htable["medskad"],training_frame=htable,distribution="gaussian",weights_column="antskad")
    predictions = dl.predict(htable)

    # poisson
    dl = h2o.deeplearning(x=htable[0:3],y=htable["medskad"],training_frame=htable,distribution="poisson",weights_column="antskad")
    predictions = dl.predict(htable)

    # tweedie
    dl = h2o.deeplearning(x=htable[0:3],y=htable["medskad"],training_frame=htable,distribution="tweedie",weights_column="antskad")
    predictions = dl.predict(htable)


weights_and_distributions()
