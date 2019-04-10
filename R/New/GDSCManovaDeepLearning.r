
#library(h2o)
require(tcltk)
library(h2oEnsemble)

localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = TRUE )



prostate.hex = h2o.uploadFile(path = "C:/Users/AQader/Desktop/GitHub/CancersDrugDiscovery/R/New/gdsc_manova_output_w5.csv")




if (!(exists("fit"))){
  #create array of learner methods
  learner <- c("h2o.glm.wrapper", "h2o.randomForest.wrapper", 
               "h2o.gbm.wrapper", "h2o.deeplearning.wrapper")
  
  #metalearner that'll help with fine tuning
  metalearner <- "h2o.glm.wrapper"
  
  #Train metalearner
  fit <- h2o.ensemble(x = c("drug", "gene", "no_mut", "mut", "amp", "del"),
                      y = "stats",
                      training_frame = prostate.hex, 
                      learner = learner, 
                      metalearner = metalearner,
                      cvControl = list(V = 5))


}












