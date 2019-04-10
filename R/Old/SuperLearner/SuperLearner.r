# #SuperLearner Ensemble 
# 
# #for GUI
 require(tcltk)
# 
# #import Ensmble learner
 library(h2oEnsemble)
# 
# #localize h2o init
# localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = TRUE )
# 
# #upload dataset
# prostate.hex = h2o.uploadFile(path = "C:/Users/AQader/Desktop/GitHub/CancersDrugDiscovery/R/data.csv")
# 
# #create array of learner methods
# learner <- c("h2o.glm.wrapper", "h2o.randomForest.wrapper", 
#              "h2o.gbm.wrapper", "h2o.deeplearning.wrapper")
# 
# #metalearner that'll help with fine tuning
# metalearner <- "h2o.glm.wrapper"
# 
# #Train metalearner
# fit <- h2o.ensemble(x = c("x1","bday","Gender","Stage","bad","perf","Ldh","size","IPI","drug","stem"),
#                     y = "status",
#                     training_frame = prostate.hex, 
#                     family = "gaussian", 
#                     learner = learner, 
#                     metalearner = metalearner,
#                     cvControl = list(V = 5))

############GUI INTEFACE##################################GUI INTERFACE################################GUI INTERFACE


mydialog <- function(){
  
tt <- tktoplevel()
  
  filer <- function() {
    fname <- file.choose()
    print(fname)
    data.hex = h2o.importFile(path = fname)
    result = predict(object = fit, newdata = data.hex)
    print(result)
    
  }
  
  
  chooseFile.but <- tkbutton(tt, text="Choose .csv file", command=filer)
  
  
  
  tkgrid(tklabel(tt,text="CancerAI Prediction Machine"),columnspan=3, pady = 10)

  tkgrid(chooseFile.but, pady= 10, padx= 10)
  
  
}

mydialog()





