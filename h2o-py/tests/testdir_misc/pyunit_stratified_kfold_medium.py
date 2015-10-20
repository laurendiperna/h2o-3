



def stratified_kfold():

  NFOLDS=5

  fr = h2o.import_file(pyunit_utils.locate("bigdata/laptop/covtype/covtype.data"))

  stratified = fr[54].stratified_kfold_column(n_folds=NFOLDS)
  stratified.show()

  dist = (fr[54].table()["Count"] / fr[54].table()["Count"].sum()).as_data_frame().to_dict("list")["Count"]  # get a raw list of means

  overall_result = reduce(lambda x,y: x.cbind(y), [fr[stratified==i,54].table()["Count"]/fr[stratified==i,54].table()["Count"].sum() for i in range(NFOLDS)])
  overall_result.show()
  df = overall_result.as_data_frame()  # get the overall result here


  # show that folds are consistent
  print
  print "Show that all folds are consistent with one another: "
  print df.mean(axis=1)  # print the average
  print df.var(axis=1)   # print the standard deviation
  print

  # now show that folds are consistent with the original distribution of classes
  for i in range(len(dist)):
    print "Stratification variance for class #%s: %s" %(i, (df.ix[i].sub(dist[i]).pow(2).sum()) / (df.shape[0] - 1))



stratified_kfold()
