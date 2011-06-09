setMethod("instrumentInfo",
          signature="mzRML",
          function(object) 
          return(object@ramp$getInstrumentInfo()))


setMethod("manufacturer",
          signature="mzRML",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$manufacturer)
          })

setMethod("model",
          signature="mzRML",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$model)
          })

setMethod("ionisation",
          signature="mzRML",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$ionisation)
          })

setMethod("analyzer",
          signature="mzRML",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$analyzer)
          })

setMethod("detector",
          signature="mzRML",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$detector)
          })
