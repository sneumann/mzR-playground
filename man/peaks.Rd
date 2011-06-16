\name{peaks}
\alias{header}
\alias{spectrum}
\alias{peaks}
\alias{peaksCount}
\alias{get3Dmap}

\title{
  Access the raw data from an \code{mzR} object.
}

\usage{
 header(object, scans, ...)

 peaksCount(object, scans, ...)

 peaks(object, scans, ...)

 get3Dmap(object, scans, lowMz, highMz, resMz, ...)
}

\arguments{
  \item{object}{An instantiated \code{mzR} object.}
  \item{scans}{A \code{numeric} specifying which scans to
    return. Optional for the \code{header}, \code{peaks} and
    \code{peaksCount} methods. If ommited, the requested data for all
    peaks is returned. } 
  \item{lowMz, highMz}{\code{Numeric}s defining the m/z range to be returned.}
  \item{resMz}{a \code{numeric} defining the m/z resolution.}
  \item{...}{Other arguments. Currently ignored.}
}

\description{
  Access the MS raw data. The \code{\link{runInfo}} function returns a
  list containing \code{scanCount}, \code{lowMZ} and \code{highMZ}, 
  \code{startMZ} and \code{endMZ} and the \code{dStartTime} and
  \code{dEndTime}. 
  
  Each scan has a header, which contains for scan-specific metadata.

  A simple resampling is performed by the function \code{get3Dmap}. 
}

\seealso{
  \code{\link{instrumentInfo}} for metadata access and the
  \code{"\linkS4class{mzR}"} class.
}

\author{
  Steffen Neumann and Laurent Gatto
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
