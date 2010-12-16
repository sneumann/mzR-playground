\name{Ramp-class}
\alias{Ramp}
\alias{MS}
\alias{Ramp-class}
\alias{rampOpenFile}
\alias{validityRamp}
\docType{class}
\title{A class for handling file input from mzXML-files}
\description{
The class is a file handler for the mass spectrometry file format mzXML. It implements random access to the spectra. The class is an R frontend for the RAMP parser by the Institute of Systems Biology.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new(Ramp)}. The function \code{rampOpenFile(filename)} creates a Ramp object and opens a file. 
}
\section{Methods}{
  \describe{
    \item{open(filename, declaredScansOnly)}{opens a file. declaredScansOnly: suppress RAMP's behavior of creating sparse tables to accomodate unlisted scans.}
    \item{close}{closes the file and releases all cached content.}
    \item{OK}{returns TRUE, if the file is opened properly.}
    \item{getFilename}{obtains the filename of the opened mzXML file.}
    \item{getRunInfo}{obtains minimal info on the msRun contained in the file.}
    \item{getInstrumentInfo}{obtain minimal info on the instrument contained in the file.}
    \item{getAllScanHeaderInfo}{returns minimal header info for all scans like spectrum number, msLevel, and retentionTime.}
    \item{getScanHeaderInfo(scanNumber)}{returns minimal header info for one scan. It is recommended to use getAllScanHeaderInfo.}
    \item{getLastScan}{getting for the last scan number (not necessarily the number of scans because of missing scans).}
    \item{getPeakList(scanNumber)}{This function performs a non-sequential parsing operation on an indexed msxml file to obtain peak info for a numbered scan.}
    \item{get3DMap(scanNumbers)}{Returns the intensities of the givens scan numbers as a matrix.}
    }
}

\section{Example}{
A short example sequence to read data from an mzXML file. First open the file.

\code{library(mzXML)}

\code{ramp <- rampOpenFile("myfile.mzXML")}

We can obtain different kind of header information.

\code{ramp$getRunInfo()}

\code{ramp$getInstrumentInfo()}

\code{SH <- ramp$getAllScanHeaderInfo()}

\code{head(SH)}

Read a single spectrum from the file.

\code{PL <-ramp$getPeakList(1000)}

\code{PL$peaksCount}

\code{head(PL$peaks)}

\code{plot(PL$peaks[,1],PL$peaks[,2], type="h", lwd=3)}

You should close the file when not needed any more. This will release the memory of cached content.

\code{ramp$close()}
}

\keyword{mzXML, proteomics, mass spectrometry}
