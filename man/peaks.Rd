\name{peaks}
\alias{header}
\alias{peaks}
\alias{peaksCount}
\alias{get3Dmap}

\title{
  Access the raw data from an mzR object.
}
\usage{
 header(object, scans, ...)

 peaksCount(object, scans, ...)

 peaks(object, scans, ...)

 get3Dmap(object, scans, lowMz, highMz, resMz)

}
\arguments{
  \item{object}{an instantiated mzR object.}
  \item{scans}{specify restriction to one or more scans.}
  \item{lowMz, highMz}{Range.}
  \item{resMz}{Resolution.}
  \item{...}{All other arguments are passed on to XXX.}
}
\description{
  
  Access the MS raw data. The \code{runInfo()} returns a list of with
  scanCount, lowMZ and highMZ, startMZ and endMZ and the dStartTime
  and dEndTime.
  
  Each scan has a header, which contains
  for each scan the metadata.

  A simple resampling is performed by the function get3Dmap().  
}

\examples{
 library(msdata)
 filepath <- system.file("microtofq", package = "msdata")
 file <- list.files(filepath, pattern="MM14.mzML",
                    full.names=TRUE, recursive = TRUE)
  mz <- openMSfile(file)

  runInfo(mz)
  colnames(header(mz))
  
  close(mz)
}
