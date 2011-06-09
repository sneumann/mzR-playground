setMethod("instrumentInfo",
          signature="mzRXML",
          function(object) 
          return(object@ramp$getInstrumentInfo()))


setMethod("manufacturer",
          signature="mzRXML",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$manufacturer)
          })

setMethod("model",
          signature="mzRXML",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$model)
          })

setMethod("ionisation",
          signature="mzRXML",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$ionisation)
          })

setMethod("analyzer",
          signature="mzRXML",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$analyzer)
          })

setMethod("detector",
          signature="mzRXML",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$detector)
          })
