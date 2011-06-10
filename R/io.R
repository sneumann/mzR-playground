
openMSfile <- function(filename,
                       format=NULL,
                       declaredOnly = TRUE,
                       verbose = FALSE) {
  if (!file.exists(filename))
    stop("File ",filename," not found.\n")
  if (is.null(format)) {
    extension <- sub("^.+\\.","",filename)
    EXTENSION <- toupper(extension)
    if (!EXTENSION %in% c("MZDATA","MZXML","MZML")) {
      wrn <- paste("Unknown file format",extension,sep=" ")
      wrn <- paste(wrn,"Using mzR class")
      warning(wrn)
    }
  } else {
    EXTENSION <- match.arg(toupper(format),c("MZDATA","MZXML","MZML"))
  }
  rampmodule <- new( Ramp ) ## Ramp module
  rampmodule$open(filename, declaredOnly = declaredOnly)
  if (!rampmodule$OK()) {
    stop("Unable to create valid cRamp object.")
  }
  if (verbose) 
    cat(filename," opened and cRamp object created successfully.\n")
  switch(EXTENSION,
         MZDATA = return(new("mzRData",ramp=rampmodule,fileName=filename)),
         MZXML  = return(new("mzRXML"  ,ramp=rampmodule,fileName=filename)),
         MZML   = return(new("mzRML"  ,ramp=rampmodule,fileName=filename)),
         return(new("mzR",ramp=rampmodule,fileName=filename)) ## if none of the previous matches
         )
}
