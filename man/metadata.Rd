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
  \item{object}{an instantiated mzR object.}
}
\description{
  Obtain the metadata about the analytical setup of a run.
  runInfo() will show a summary, whereas all other functions
  return a single pieve of information. 
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
