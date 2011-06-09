\name{mzR-class}
\Rdversion{1.1}
\docType{class}
\alias{mzR-class}
\alias{mzRData-class}
\alias{mzRML-class}
\alias{mzRXML-class}
\alias{class:mzR}
\alias{class:mzRData}
\alias{class:mzRML}
\alias{class:mzRXML}
\alias{close,mzR-method}
\alias{close}
\alias{analyzer,mzRML-method}
\alias{analyzer,mzRXML-method}
\alias{detector,mzRXML-method}
\alias{detector,mzRML-method}
\alias{fileName,mzR-method}
\alias{get3Dmap,mzR-method}
\alias{header,mzR,missing-method}
\alias{header,mzR,numeric-method}
\alias{initializeRamp,mzR-method}
\alias{instrumentInfo,mzR-method}
\alias{instrumentInfo,mzRML-method}
\alias{instrumentInfo,mzRXML-method}
\alias{ionisation,mzRML-method}
\alias{ionisation,mzRXML-method}
\alias{isInitialized,mzR-method}
\alias{length,mzR-method}
\alias{length}
\alias{manufacturer,mzRXML-method}
\alias{manufacturer,mzRML-method}
\alias{model,mzRXML-method}
\alias{model,mzRML-method}
\alias{peaksCount,mzR,missing-method}
\alias{peaksCount,mzR,numeric-method}
\alias{peaks,mzR,missing-method}
\alias{peaks,mzR,numeric-method}
\alias{runInfo,mzR-method}

\title{Class \code{"mzR"} and sub-classes}
\description{
  The class mzR is a wrapper for the ISB random acces parser RAMP.
  It keeps both the metadata for the run (like fileName, instrument
  description or ionisation). It also provides access to the actual MS
  raw data, such as the peaks.

  \code{"mzRData"}, \code{"mzRXML"}, \code{"mzRXML"} are format specific
  sub-classes that extend \code{"mzR"}. Currently, they do not add new
  splots. Although the API is kept consistent across the sub-classes,
  some accessor methods are defined specifically for some of them and
  other methods have sub-class specific implementations.
}

\section{Objects from the Class}{
  Objects can be created by calls of the form \code{new("mzR", versions,
    ...)}, but more often they will be created with \code{openMSfile}.
}

\section{Slots}{
  \describe{
    \item{\code{ramp}:}{Object of class \code{"C++Object"}, created with
      Rcpp.}
    \item{\code{pwiz}:}{Currently \code{NULL}. Future usage of the
      proteowizard API will be done through this slot.}
    \item{\code{fileName}:}{Object of class \code{character} storing the
      original filename used when the instance was created. }
    \item{\code{.__classVersion__}:}{Object of class \code{"Versioned"},
      from Biobase.}
  }
}
\section{Extends}{
  Class \code{"\linkS4class{Versioned}"}, directly.
}

\section{Methods}{
  \describe{
    \item{analyzer}{\code{signature(object = "mzR")}: ... }
    \item{close}{\code{signature(con = "mzR")}: ... }
    \item{detector}{\code{signature(object = "mzR")}: ... }
    \item{fileName}{\code{signature(object = "mzR")}: ... }
    \item{get3Dmap}{\code{signature(object = "mzR")}: ... }
    \item{header}{\code{signature(object = "mzR", scans = "missing")}: ... }
    \item{header}{\code{signature(object = "mzR", scans = "numeric")}: ... }
    \item{initializeRamp}{\code{signature(object = "mzR")}: ... }
    \item{instrumentInfo}{\code{signature(object = "mzR")}: ... }
    \item{ionisation}{\code{signature(object = "mzR")}: ... }
    \item{isInitialized}{\code{signature(object = "mzR")}: ... }
    \item{length}{\code{signature(x = "mzR")}: ... }
    \item{manufacturer}{\code{signature(object = "mzR")}: ... }
    \item{model}{\code{signature(object = "mzR")}: ... }
    \item{peaksCount}{\code{signature(object = "mzR", scans = "missing")}: ... }
    \item{peaksCount}{\code{signature(object = "mzR", scans = "numeric")}: ... }
    \item{peaks}{\code{signature(object = "mzR", scans = "missing")}: ... }
    \item{peaks}{\code{signature(object = "mzR", scans = "numeric")}: ... }
    \item{runInfo}{\code{signature(object = "mzR")}: ... }
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
}

\keyword{classes}
