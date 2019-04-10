
require(tcltk)  

tkmessageBox(message="DISCLAIMER!! This program is not supposed to be a substitute to a medical treatement. This is to AID you." )
first <- function()
  source("C:/Users/AQader/Desktop/GitHub/CancersDrugDiscovery/R/New/GDSCManovaDeepLearning.R")
second <- function()
  source("C:/Users/AQader/Desktop/GitHub/CancersDrugDiscovery/EarlyStage/drugLikeness.R")


doctorPredicter <- function(){

  
    fname <- file.choose()
    print(fname)
    data.hex = h2o.importFile(path = fname)
    result = predict(object = fit, newdata = data.hex)
    a <- as.data.frame(result$pred)[,1]
    if (a < .50) {
      tkmessageBox(message="Prediction is 0. This is not the reccomended treatment" )
      
    }
    if (a > .50) {
      tkmessageBox(message="Prediction is 1. This is the reccomended treatment" )
    }
    
}


earlyStager <-function(){
  fname <- file.choose()
  print(fname)
  data.hex = h2o.importFile(path = fname)
  result = predict(object = prostate.deep, newdata = data.hex)
  print(result)
  a <- as.data.frame(result$pred)[,1]
  print(a)
   
  if(a<.50){
    tkmessageBox(message="This chemical does NOT pass the virtual screening." )
  }
  if(a>.50){
    tkmessageBox(message="This chemical does pass the virtual screening." )
    
  }
  
}

  




















tt <- tktoplevel()

tkgrid(tklabel(tt,text="Early Stage Drug-Genome Prediction Service "),columnspan=3, pady = 10)

Doctortrain.but <- tkbutton(tt, text = "Train", command = first, pady= 20, padx= 50)
Doctorpredict.but <- tkbutton(tt, text = "Predict", command = doctorPredicter, pady= 20, padx= 50)

tkgrid(Doctortrain.but, Doctorpredict.but)	

tkgrid(tklabel(tt,text="Predictive Early Stage Virtual Screening"),columnspan=3, pady = 10)

Patienttrain.but <- tkbutton(tt, text = "Train", command = second, pady= 20, padx= 50)
Patientpredict.but <- tkbutton(tt, text = "Predict", command = earlyStager, pady= 20, padx= 50)


tkgrid(Patienttrain.but, Patientpredict.but)	

topMenu <- tkmenu(tt,  title = "Menu")           # Create a menu
tkconfigure(tt, menu = topMenu) # Add it to the 'tt' window
fileMenu <- tkmenu(topMenu, tearoff = FALSE)
tkadd(fileMenu, "command", label = "Quit", command = function() tkdestroy(tt))





tkadd(topMenu, "cascade", label = "File", menu = fileMenu)




tkfocus(tt)
