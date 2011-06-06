
openMSfile <- function(filename, declaredOnly = FALSE, verbose = FALSE) {
  if (!file.exists(filename))
    stop("File ",filename," not found.\n")
  rampmodule <- new( Ramp ) ## Ramp module
  rampmodule$open(filename, declaredOnly = declaredOnly)
  if (!rampmodule$OK()) {
    stop("Unable to create valid cRamp object.")
  }
  if (verbose) 
    cat(filename," opened and cRamp object created successfully.\n")
  return(new("mzR",
             Ramp=rampmodule,
             fileName=filename))
}
