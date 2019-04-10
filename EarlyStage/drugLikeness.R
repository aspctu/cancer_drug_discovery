
library(h2o)
require(tcltk)
library(h2oEnsemble)

localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = TRUE )




if(!(exists("prostate.deep"))){
  prostate.hex = h2o.uploadFile(path = "C:/Users/AQader/Desktop/GitHub/CancersDrugDiscovery/EarlyStage/druglikeness.csv")
  
  
learner <- c("h2o.glm.wrapper", "h2o.randomForest.wrapper", 
             "h2o.gbm.wrapper", "h2o.deeplearning.wrapper")

#metalearner that'll help with fine tuning
metalearner <- "h2o.glm.wrapper"

#Train metalearner
prostate.deep <- h2o.ensemble(x = c("logP","PSA","DC","AlRC", "ArRC","BI"),
                    y = "group",
                    training_frame = prostate.hex, 
                    learner = learner, 
                    metalearner = metalearner,
                    cvControl = list(V = 5))

}
























