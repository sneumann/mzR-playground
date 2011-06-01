\name{mzR-class}
\Rdversion{1.1}
\docType{class}
\alias{mzR-class}
\alias{analyzer,mzR-method}
\alias{close,mzR-method}
\alias{detector,mzR-method}
\alias{fileName,mzR-method}
\alias{get3Dmap,mzR-method}
\alias{header,mzR,missing-method}
\alias{header,mzR,numeric-method}
\alias{initializeRamp,mzR-method}
\alias{instrumentInfo,mzR-method}
\alias{ionisation,mzR-method}
\alias{isInitialized,mzR-method}
\alias{length,mzR-method}
\alias{manufacturer,mzR-method}
\alias{model,mzR-method}
\alias{peaksCount,mzR,missing-method}
\alias{peaksCount,mzR,numeric-method}
\alias{peaks,mzR,missing-method}
\alias{peaks,mzR,numeric-method}
\alias{runInfo,mzR-method}

\title{Class \code{"mzR"}}
\description{
  The class mzR is a wrapper for the ISB random acces parser RAMP.
  It keeps both the metadata for the run (like fileName, instrument
  description or ionisation). It also provides access to the actual MS
  raw data, such as the peaks.
}
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{new("mzR", versions,
    ...)}, but more often they will be created with \code{openMSfile}.
}

\section{Slots}{
  \describe{
    \item{\code{Ramp}:}{Object of class \code{"C++Object"}, created with
    Rcpp.}
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
  Steffen Neumann
}

\examples{
showClass("mzR")
}

\keyword{classes}
