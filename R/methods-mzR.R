##################################################
## methods common to all format-specific classes,
## directly inherited from the mzR class

## Instrument info methods defined at the sub-class level

setMethod("get3Dmap",
          signature="mzR",
          function(object,scans,lowMz,highMz,resMz) 
          return(object@ramp$get3DMap(scans,lowMz,highMz,resMz)))

setMethod("initializeRamp",
          signature="mzR",
          function(object,filename,declaredOnly = TRUE) {
            if (!file.exists(filename))
              stop("File ",filename," not found.\n")
            object@ramp$open(filename, declaredOnly = declaredOnly)
            if (isInitialized(object)) invisible(TRUE)
            else stop("Could not initialize ramp slot.")
          })

setMethod("length",
          signature=c("mzR"),
          function(x) return(x@ramp$getLastScan()))

setMethod("peaks",
          signature=c("mzR","numeric"),
          function(object,scans) {
            if (length(scans)==1) {
              return(object@ramp$getPeakList(scans)$peaks)
            } else {
              return(sapply(scans,function(x) object@ramp$getPeakList(x)$peaks))
            }
          })

setMethod("peaks",
          signature=c("mzR","missing"),
          function(object) {
            n <- length(object)
            return(peaks(object,1:n))
          })

setMethod("peaksCount",
          signature=c("mzR","numeric"),
          function(object,scans) {
            if (length(scans)==1) {
              return(object@ramp$getPeakList(scans)$peaksCount)
            } else {
              return(sapply(scans,function(x) object@ramp$getPeakList(x)$peaksCount))
            }
          })

setMethod("peaksCount",
          signature=c("mzR","missing"),
          function(object) {
            n <- length(object)
            return(peaksCount(object,1:n))
          })

setMethod("header",
          signature=c("mzR","missing"),
          function(object) return(object@ramp$getAllScanHeaderInfo()))

setMethod("header",
          signature=c("mzR","numeric"),
          function(object, scans) {
            if (length(scans)==1) {
              return(object@ramp$getScanHeaderInfo(scans))
            } else {
              return(data.frame(t(sapply(scans,function(x) object@ramp$getScanHeaderInfo(x)))))
            }
          })

setMethod("close", 
          signature="mzR",
          function(con,...) return(con@ramp$close()))

setMethod("isInitialized", 
          signature="mzR",
          function(object) return(object@ramp$OK()))

setMethod("runInfo",
          signature="mzR",
          function(object) return(object@ramp$getRunInfo()))

## Added fileName slot in mzR version 0.1.3 - using
## that one in accessor method
setMethod("fileName",
          signature="mzR",
          function(object) return(object@fileName))
## setMethod("fileName",
##           signature="mzR",
##           function(object) return(object@ramp$getFilename()))
## Added fileName slot in mzR version 0.1.3 - using


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

