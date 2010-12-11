
# grab the namespace
.NAMESPACE <- environment()

# dummy module, will be replace later
MS <- new( "Module" )

.onLoad <- function(pkgname, libname) {
  unlockBinding( "MS" , .NAMESPACE )
  assign( "MS",  Module( "modRamp" ), .NAMESPACE )
  assign( "Ramp",  MS$Ramp, .NAMESPACE )

  setMethod("show",signature=Ramp, function(object) {
    filename = object$getFilename()
    info = object$getInstrumentInfo()
    run = object$getRunInfo()
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
  }, where = .NAMESPACE )

  lockBinding( "MS", .NAMESPACE )
}

