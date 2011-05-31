## Obsolete; file existance is checked in openMSfile
## test.filenotfound <- function() {
##     filename <- "rhabarber.mzData"
##     aa <- openMSfile(filename)
##     checkTrue(!isInitialized(aa))
## }

test.mzXML <- function() {
    library(msdata)
    cdfpath <- system.file("threonine", package = "msdata")
    file <- list.files(cdfpath, pattern="threonine_i2_e35_pH_tree.mzXML",
                       full.names=TRUE, recursive = TRUE)
    aa <- openMSfile(file)
    show(aa)
    length(aa)
    runInfo(aa)
    instrumentInfo(aa)
    peaks(aa)
    peaks(aa,1)
    peaks(aa,2:3)
    peaksCount(aa)
    header(aa)
    header(aa,1)
    header(aa,2:3)
    fileName(aa)
    close(aa)
}

test.mzML <- function() {
    library(msdata)
    cdfpath <- system.file("microtofq", package = "msdata")
    file <- list.files(cdfpath, pattern="MM14.mzML",
                       full.names=TRUE, recursive = TRUE)
    aa <- openMSfile(file)
    show(aa)
    length(aa)
    runInfo(aa)
    instrumentInfo(aa)
    peaks(aa)
    peaks(aa,1)
    peaks(aa,2:3)
    peaksCount(aa)
    header(aa)
    header(aa,1)
    header(aa,2:3)
    fileName(aa)
    close(aa)    
}

test.mzData <- function() {
    library(msdata)
    cdfpath <- system.file("microtofq", package = "msdata")
    file <- list.files(cdfpath, pattern="MM14.mzdata",
                       full.names=TRUE, recursive = TRUE)
    aa <- openMSfile(file)
    show(aa)
    length(aa)
    runInfo(aa)
    instrumentInfo(aa)
    peaks(aa)
    peaks(aa,1)
    peaks(aa,2:3)
    peaksCount(aa)
    header(aa,1)
    header(aa,2:3)
    fileName(aa)
    close(aa)    
}

