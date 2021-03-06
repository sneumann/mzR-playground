\name{mzR-class}
\Rdversion{1.1}
\docType{class}
\alias{mzR-class}
\alias{mzRramp-class}
\alias{mzRnetCDF-class}
\alias{class:mzR}
\alias{class:mzRramp}
\alias{class:mzRnetCDF}

\alias{close,mzRramp-method}
\alias{close,mzRnetCDF-method}
\alias{close}
\alias{analyzer,mzRramp-method}
\alias{detector,mzRramp-method}
\alias{fileName,mzR-method}
\alias{get3Dmap,mzRramp-method}
\alias{header,mzRramp,missing-method}
\alias{header,mzRramp,numeric-method}
\alias{header,mzRnetCDF,missing-method}
\alias{header,mzRnetCDF,numeric-method}
\alias{initializeRamp,mzRramp-method}
\alias{instrumentInfo,mzRramp-method}
\alias{ionisation,mzRramp-method}
\alias{isInitialized,mzRramp-method}
\alias{isInitialized,mzRnetCDF-method}
\alias{length,mzRramp-method}
\alias{length,mzRnetCDF-method}
\alias{length}
\alias{manufacturer,mzRramp-method}
\alias{model,mzRramp-method}
\alias{peaksCount,mzRramp,missing-method}
\alias{peaksCount,mzRramp,numeric-method}
\alias{peaks,mzRramp,missing-method}
\alias{peaks,mzRramp,numeric-method}
\alias{peaks,mzRnetCDF,missing-method}
\alias{peaks,mzRnetCDF,numeric-method}
\alias{runInfo,mzRramp-method}

\title{Class \code{mzR} and sub-classes}
\description{
  The class \code{mzR} is the main class for the common mass spectrometry
  formats. It is a virtual class and thus not supposed to be instanciated
  directly.

  The sub-classes implement specific APIs to access the underlying data
  and metadata in the files. Currently, \code{mzRramp} is the only
  available implementation. It uses the ISB 'RAMP' random access C/C++
  API to access the relevant information in \code{mzData}, \code{mzXML}
  and \code{mzML} files.

  Additional sub-classes using the proteowizard API and netCDF are
  planned.
}

\section{Objects from the Class}{
  \code{mzR} is a virtual class, so instances cannot be created.

  Objects can be created by calls of the form \code{new("mzRramp",
    ...)}, but more often they will be created with
  \code{\link{openMSfile}}.  
}

\section{Slots}{
  \describe{
    \item{\code{fileName}:}{Object of class \code{character} storing the
      original filename used when the instance was created. }
    \item{\code{backend}:}{ One of the implemented backens or
      \code{NULL}. }
    \item{\code{.__classVersion__}:}{Object of class \code{"Versioned"},
      from Biobase.}
  }
}
\section{Extends}{
  Class \code{"\linkS4class{Versioned}"}, directly.
}

\section{Methods}{
  Methods currently implemented for \code{mzR}
  \describe{
    \item{fileName}{\code{signature(object = "mzR")}: ... }
  }
  
  Methods currently implemented for \code{mzRramp}
  \describe{
    \item{analyzer}{\code{signature(object = "mzRramp")}: ... }
    \item{close}{\code{signature(con = "mzRramp")}: ... }
    \item{detector}{\code{signature(object = "mzRramp")}: ... }
    \item{fileName}{\code{signature(object = "mzRramp")}: ... }
    \item{get3Dmap}{\code{signature(object = "mzRramp")}: ... }
    \item{header}{\code{signature(object = "mzRramp", scans = "missing")}: ... }
    \item{header}{\code{signature(object = "mzRramp", scans = "numeric")}: ... }
    \item{header}{\code{signature(object = "mzRnetCDF", scans = "missing")}: ... }
    \item{header}{\code{signature(object = "mzRnetCDF", scans = "numeric")}: ... }
    \item{initializeRamp}{\code{signature(object = "mzRramp")}: ... }
    \item{instrumentInfo}{\code{signature(object = "mzRramp")}: ... }
    \item{ionisation}{\code{signature(object = "mzRramp")}: ... }
    \item{isInitialized}{\code{signature(object = "mzRramp")}: ... }
    \item{length}{\code{signature(x = "mzRramp")}: ... }
    \item{manufacturer}{\code{signature(object = "mzRramp")}: ... }
    \item{model}{\code{signature(object = "mzRramp")}: ... }
    \item{peaksCount}{\code{signature(object = "mzRramp", scans = "missing")}: ... }
    \item{peaksCount}{\code{signature(object = "mzRramp", scans = "numeric")}: ... }
    \item{peaks}{\code{signature(object = "mzRramp", scans = "missing")}: ... }
    \item{peaks}{\code{signature(object = "mzRramp", scans = "numeric")}: ... }
    \item{peaks}{\code{signature(object = "mzRnetCDF", scans = "missing")}: ... }
    \item{peaks}{\code{signature(object = "mzRnetCDF", scans = "numeric")}: ... }
    \item{runInfo}{\code{signature(object = "mzRramp")}: ... }
  }
}

\references{
  RAMP: http://tools.proteomecenter.org/wiki/index.php?title=Software:RAMP
  Proteowizard: http://proteowizard.sourceforge.net/
}

\author{
  Steffen Neumann and Laurent Gatto
}

\examples{
 library(msdata)
 filepath <- system.file("microtofq", package = "msdata")
 file <- list.files(filepath, pattern="MM14.mzML",
                    full.names=TRUE, recursive = TRUE)
  mzml <- openMSfile(file)
  close(mzml)
}

\keyword{classes}
