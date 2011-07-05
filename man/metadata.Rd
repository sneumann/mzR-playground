\name{metadata}
\alias{analyzer}
\alias{detector}
\alias{instrumentInfo}
\alias{ionisation}
\alias{manufacturer}
\alias{model}
\alias{runInfo}

\title{
  Access the metadata from an mzR object.
}
\usage{
runInfo(object)
analyzer(object)
detector(object)
instrumentInfo(object)
ionisation(object)
manufacturer(object)
model(object)
}
\arguments{
  \item{object}{An instantiated \code{mzR} object.}
}

\description{
  Accessors to the analytical setup metadata of a run.
  \code{runInfo} will show a summary, whereas all other functions
  return a single piece of information. 
}


\seealso{
    \code{\link{spectrum}} to access the metadata for the spectra in a
  \code{"\linkS4class{mzR}"} class.  
}

\examples{
 library(msdata)
 filepath <- system.file("microtofq", package = "msdata")
 file <- list.files(filepath, pattern="MM14.mzML",
                    full.names=TRUE, recursive = TRUE)
  mz <- openMSfile(file)
  fileName(mz)
  runInfo(mz)
  close(mz)
}