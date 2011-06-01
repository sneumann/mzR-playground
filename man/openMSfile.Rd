\name{openMSfile}
\alias{openMSfile}
\alias{initializeRamp}
\alias{isInitialized}
\alias{fileName}

\title{
  Create and check mzR objects from an mzXML, mzData or mzML file.
}
\usage{
 openMSfile(filename, declaredOnly = FALSE, verbose = FALSE)

 initializeRamp(object, filename, declaredOnly = FALSE)

 isInitialized(object)

 fileName(object)

}
\arguments{
  \item{filename}{path name of the mzData, mzXML or mzML file to read}
  \item{declaredOnly}{suppress RAMP's behavior of creating sparse
    tables to accomodate unlisted scans.}  
  \item{object}{an instantiated mzR object.}
  \item{verbose}{Enable informational output.}
}
\description{
  The openMSfile() constructor will create a new mzR object, open the
  given file and all header information is loaded into the RAMP slot of
  the mzR object.

  If the object was created manually with e.g. new("mzR"), then
  initializeRamp() will open the given file. An mzR object can be
  queried, whether it is assigned to a raw file with isInitialized(),
  and finally fileName(object) will return the path to the file "behind"
  the mzR object.  }

\examples{
 library(msdata)
 filepath <- system.file("microtofq", package = "msdata")
 file <- list.files(filepath, pattern="MM14.mzML",
                    full.names=TRUE, recursive = TRUE)
  mz <- openMSfile(file)
  fileName(mz)
  isInitialized(mz)
  runInfo(mz)
  
  close(mz)
}
