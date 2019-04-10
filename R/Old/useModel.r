## Use Model as API Endpoint

## Load Library
suppressPackageStartupMessages(library(h2o))

h2o.init()

## Load Pre-trained model
load(file = "C:/Users/AQader/Documents/deep.rda")



predict_drug <- function(x1,bday,Gender,Stage,bad,perf,Ldh,size,IPI,drug,stem) {
  dfTop = data.frame("x1","bday","Gender","Stage","bad","perf","Ldh","size","IPI","drug","stem")
  
  df1 = data.frame(x1,bday,Gender,Stage,bad,perf,Ldh,size,IPI,drug,stem)
  
  write.table(dfTop, file = "predict.csv", append = T, col.names = F, sep = ",", quote = F)
  write.table(df1, file = "predict.csv", append = T, col.names = F, sep = ",", quote = F)
  
  getwd()
  
  data.hex = h2o.importFile("predict.csv")
  
  result = h2o.predict(object = prostate.deep, newdata = data.hex)
  
  ## Return the predicted class
  return(result)
  
}