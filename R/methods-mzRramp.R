setMethod("get3Dmap",
          signature="mzRramp",
          function(object,scans,lowMz,highMz,resMz) 
          return(object@backend$get3DMap(scans,lowMz,highMz,resMz)))

setMethod("initializeRamp",
          signature="mzRramp",
          function(object,filename,declaredOnly = TRUE) {
            if (!file.exists(filename))
              stop("File ",filename," not found.\n")
            object@backend$open(filename, declaredOnly = declaredOnly)
            if (isInitialized(object)) invisible(TRUE)
            else stop("Could not initialize ramp slot.")
          })

setMethod("length",
          signature=c("mzRramp"),
          function(x) return(x@backend$getLastScan()))

setMethod("peaks",
          signature=c("mzRramp","numeric"),
          function(object,scans) {
            if (length(scans)==1) {
              return(object@backend$getPeakList(scans)$peaks)
            } else {
              return(sapply(scans,function(x) object@backend$getPeakList(x)$peaks))
            }
          })

setMethod("peaks",
          signature=c("mzRramp","missing"),
          function(object) {
            n <- length(object)
            return(peaks(object,1:n))
          })

setMethod("peaksCount",
          signature=c("mzRramp","numeric"),
          function(object,scans) {
            if (length(scans)==1) {
              return(object@backend$getPeakList(scans)$peaksCount)
            } else {
              return(sapply(scans,function(x) object@backend$getPeakList(x)$peaksCount))
            }
          })

setMethod("peaksCount",
          signature=c("mzRramp","missing"),
          function(object) {
            n <- length(object)
            return(peaksCount(object,1:n))
          })

setMethod("header",
          signature=c("mzRramp","missing"),
          function(object) return(object@backend$getAllScanHeaderInfo()))

setMethod("header",
          signature=c("mzRramp","numeric"),
          function(object, scans) {
            if (length(scans)==1) {
              return(object@backend$getScanHeaderInfo(scans))
            } else {
              return(data.frame(t(sapply(scans,function(x) unlist(object@backend$getScanHeaderInfo(x))))))
            }
          })

setMethod("close", 
          signature="mzRramp",
          function(con,...) return(con@backend$close()))

setMethod("isInitialized", 
          signature="mzRramp",
          function(object) return(object@backend$OK()))

setMethod("runInfo",
          signature="mzRramp",
          function(object) return(object@backend$getRunInfo()))


setMethod("instrumentInfo",
          signature="mzRramp",
          function(object) 
          return(object@backend$getInstrumentInfo()))


setMethod("manufacturer",
          signature="mzRramp",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$manufacturer)
          })

setMethod("model",
          signature="mzRramp",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$model)
          })

setMethod("ionisation",
          signature="mzRramp",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$ionisation)
          })

setMethod("analyzer",
          signature="mzRramp",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$analyzer)
          })

setMethod("detector",
          signature="mzRramp",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$detector)
          })


setMethod("show",
          signature="mzRramp",
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
              if (any(info != "")) {
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

