



def insert_missing():
  air_path = [pyunit_utils.locate("smalldata/airlines/allyears2k_headers.zip")]

  data = h2o.import_file(path=air_path)

  hour1 = data["CRSArrTime"] / 100
  mins1 = data["CRSArrTime"] % 100
  arrTime = hour1*60 + mins1

  hour2 = data["CRSDepTime"] / 100
  mins2 = data["CRSDepTime"] % 100
  depTime = hour2*60 + mins2

  data["TravelTime"] = h2o.ifelse((arrTime-depTime)>0,(arrTime-depTime),float("nan"))[0]

  data.show()


insert_missing()
