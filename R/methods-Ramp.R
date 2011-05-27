setMethod("get3Dmap",
          signature="mzR",
          function(object,scans,lowMz,highMz,resMz) 
          return(object@Ramp$get3DMap(scans,lowMz,highMz,resMz)))

setMethod("initializeRamp",
          signature="mzR",
          function(object,filename,declaredOnly=FALSE) {
            if (!file.exists(filename))
              stop("File ",filename," not found.\n")
            object@Ramp$open(filename, declaredOnly = declaredOnly)
            if (isInitialized(object)) invisible(TRUE)
            else stop("Could not initialize Ramp slot.")
          })

setMethod("length",
          signature=c("mzR"),
          function(x) return(x@Ramp$getLastScan()))


setMethod("peaks",
          signature=c("mzR","numeric"),
          function(object,scans) {
            if (length(scans)==1) {
              return(object@Ramp$getPeakList(scans)$peaks)
            } else {
              return(sapply(scans,function(x) object@Ramp$getPeakList(x)$peaks))
            }
          })

setMethod("peaks",
          signature=c("mzR","missing"),
          function(object) {
            n <- lengh(object)
            return(peaks(obejct,1:n))
          })

setMethod("peaksCount",
          signature=c("mzR","numeric"),
          function(object,scans) {
            if (length(scans)==1) {
              return(object@Ramp$getPeakList(scans)$peaksCount)
            } else {
              return(sapply(scans,function(x) object@Ramp$getPeakList(x)$peaksCount))
            }
          })

setMethod("peaksCount",
          signature=c("mzR","missing"),
          function(object) {
            n <- lengh(object)
            return(peaksCount(obejct,1:n))
          })

setMethod("header",
          signature=c("mzR","missing"),
          function(object) return(object@Ramp$getAllScanHeaderInfo()))

setMethod("header",
          signature=c("mzR","numeric"),
          function(object, scans) {
            if (length(scans)==1) {
              return(object@Ramp$getScanHeaderInfo(scans))
            } else {
              return(data.frame(t(sapply(scans,function(x) object@Ramp$getScanHeaderInfo(x)))))
            }
          })

setMethod("close", 
          signature="mzR",
          function(con,...) return(con@Ramp$close()))

setMethod("isInitialized", 
          signature="mzR",
          function(object) return(object@Ramp$OK()))

setMethod("runInfo",
          signature="mzR",
          function(object) return(object@Ramp$getRunInfo()))

setMethod("fileName",
          signature="mzR",
          function(object) return(object@Ramp$getFilename()))

setMethod("instrumentInfo",
          signature="mzR",
          function(object) return(object@Ramp$getInstrumentInfo()))

setMethod("manufacturer",
          signature="mzR",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$manufacturer)
          })

setMethod("model",
          signature="mzR",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$model)
          })

setMethod("ionisation",
          signature="mzR",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$ionisation)
          })

setMethod("analyzer",
          signature="mzR",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$analyzer)
          })

setMethod("detector",
          signature="mzR",
          function(object) {
            info <- instrumentInfo(object)           
            return(info$detector)
          })


setMethod("show",
          signature="mzR",
          function(object) {
            if (!isInitialized(object)) {
              cat("Your object's Ramp slot is not initialized.\n")
              cat("Use initializeRamp(object,filename) to fix this.\n")
            } else {
              filename <- fileName(object)
              info <- instrumentInfo(object)
              run <- runInfo(object)
              cat("Mass Spectrometry file handle.\n")
              cat("Filename:     ", filename, "\n")
              cat("Manufacturer: ", info$manufacturer, "\n")
              cat("Model:        ", info$model, "\n")
              cat("Ionisation:   ", info$ionisation, "\n")
              cat("Analyzer:     ", info$analyzer, "\n")
              cat("Detector:     ", info$detector, "\n")
              cat("number scans: ", run$scanCount, "\n")
              cat("lowMZ:        ", run$lowMZ, " \thighMZ: ", run$highMZ, "\n")
              cat("startMZ:      ", run$lowMZ, " \tendMZ: ",  run$highMZ, "\n")
              cat("dStartTime:   ", run$dStartTime, " \tdEndTime: ", run$dEndTime, "\n")
            }
          })


