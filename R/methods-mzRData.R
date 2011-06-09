## no instrument info methods

## overwriting show method to skip instrument info
setMethod("show",
          signature="mzRData",
          function(object) {
            if (!isInitialized(object)) {
              cat("Your object's ramp slot is not initialized.\n")
              cat("Use initializeRamp(object,filename) to fix this.\n")
            } else {
              filename <- fileName(object)
              run <- runInfo(object)
              cat("Mass Spectrometry file handle.\n")
              cat("Filename:     ", filename, "\n")
              cat("number scans: ", run$scanCount, "\n")
              cat("lowMZ:        ", run$lowMZ, " \thighMZ: ", run$highMZ, "\n")
              cat("startMZ:      ", run$lowMZ, " \tendMZ: ",  run$highMZ, "\n")
              cat("dStartTime:   ", run$dStartTime, " \tdEndTime: ", run$dEndTime, "\n")
            }
            invisible(NULL)            
          })



