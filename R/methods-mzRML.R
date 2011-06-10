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


setMethod("show",
          signature="mzR",
          function(object) {
            if (!isInitialized(object)) {
              cat("Your object's ramp slot is not initialized.\n")
              cat("Use initializeRamp(object,filename) to fix this.\n")
            } else {
              filename <- fileName(object)
              info <- instrumentInfo(object)
              run <- runInfo(object)
              cat("Mass Spectrometry file handle.\n")
              cat("Filename:     ", filename, "\n")
              if (!any(is.na(info))) {
                cat("Manufacturer: ", info$manufacturer, "\n")
                cat("Model:        ", info$model, "\n")
                cat("Ionisation:   ", info$ionisation, "\n")
                cat("Analyzer:     ", info$analyzer, "\n")
                cat("Detector:     ", info$detector, "\n")
              }
              cat("number scans: ", run$scanCount, "\n")
              cat("lowMZ:        ", run$lowMZ, " \thighMZ: ", run$highMZ, "\n")
              cat("startMZ:      ", run$lowMZ, " \tendMZ: ",  run$highMZ, "\n")
              cat("dStartTime:   ", run$dStartTime, " \tdEndTime: ", run$dEndTime, "\n")
            }
            invisible(NULL)
          })

