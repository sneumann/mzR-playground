\name{openMSfile}
\alias{openMSfile}
\alias{close,mzR-method}
\alias{isInitialized,mzR-method}
\alias{isInitialized}
\alias{initializeRamp,mzR-method}
\alias{initializeRamp}
\alias{runInfo,mzR-method}
\alias{runInfo}
\alias{fileName,mzR-method}
\alias{fileName}
\alias{manufacturer,mzR-method}
\alias{manufacturer}
\alias{model,mzR-method}
\alias{model}
\alias{ionisation,mzR-method}
\alias{ionisation}
\alias{analyzer,mzR-method}
\alias{analyzer}
\alias{detector,mzR-method}
\alias{detector}
\alias{header,mzR,missing-method}
\alias{header,mzR,numeric-method}
\alias{header}
\alias{mzR-class}
\alias{instrumentInfo,mzR-method}
\alias{instrumentInfo}
\alias{peaks,mzR,missing-method}
\alias{peaks,mzR,numeric-method}
\alias{peaks}
\alias{peaksCount,mzR,missing-method}
\alias{peaksCount,mzR,numeric-method}
\alias{peaksCount}
\alias{length,mzR-method}
\alias{length}
\alias{get3Dmap,mzR-method}
\alias{get3Dmap}

\title{
  No documentation yet
}

\description{
  Temporary dummy documentation files.
}

\examples{
 library(msdata)
 cdfpath <- system.file("microtofq", package = "msdata")
 file <- list.files(cdfpath, pattern="MM14.mzML",
                    full.names=TRUE, recursive = TRUE)
  aa <- openMSfile(file)
  runInfo(aa)
  ## close(aa)
}
