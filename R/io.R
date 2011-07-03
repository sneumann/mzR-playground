openMSfile <- function(filename,
                       backend="Ramp",
                       verbose = FALSE) {
  if (!file.exists(filename))
    stop("File ",filename," not found.\n")

  if (tolower(backend) != "ramp") 
    stop("Currently only 'Ramp' supported.")
  ## Currently, only Ramp is available
  rampModule <- new( Ramp ) 
  rampModule$open(filename)
  if (!rampModule$OK()) {
    stop("Unable to create valid cRamp object.")
  }
  return(new("mzRramp",
             backend=rampModule,
             fileName=filename))
}
