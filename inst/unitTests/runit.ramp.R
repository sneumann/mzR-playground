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
    mzxml <- openMSfile(file)
    checkTrue(class(mzxml)=="mzRramp")
    show(mzxml)
    length(mzxml)
    runInfo(mzxml)
    instrumentInfo(mzxml)
    mzR::peaks(mzxml)
    mzR::peaks(mzxml,1)
    mzR::peaks(mzxml,2:3)
    mzR::peaksCount(mzxml)
    mzR::header(mzxml)
    mzR::header(mzxml,1)
    mzR::header(mzxml,2:3)
    fileName(mzxml)
    close(mzxml)
}

test.mzML <- function() {
    library(msdata)
    cdfpath <- system.file("microtofq", package = "msdata")
    file <- list.files(cdfpath, pattern="MM14.mzML",
                       full.names=TRUE, recursive = TRUE)
    mzml <- openMSfile(file)
    checkTrue(class(mzml)=="mzRramp")
    show(mzml)
    length(mzml)
    runInfo(mzml)
    instrumentInfo(mzml)
    mzR::peaks(mzml)
    mzR::peaks(mzml,1)
    mzR::peaks(mzml,2:3)
    mzR::peaksCount(mzml)
    mzR::header(mzml)
    mzR::header(mzml,1)
    mzR::header(mzml,2:3)
    fileName(mzml)
    close(mzml)    
}

test.mzData <- function() {
    library(msdata)
    cdfpath <- system.file("microtofq", package = "msdata")
    file <- list.files(cdfpath, pattern="MM14.mzdata",
                       full.names=TRUE, recursive = TRUE)
    mzdata <- openMSfile(file)
    checkTrue(class(mzdata)=="mzRramp")
    show(mzdata)
    length(mzdata)
    runInfo(mzdata)
    checkTrue(all(instrumentInfo(mzdata)==""))
    mzR::peaks(mzdata)
    mzR::peaks(mzdata,1)
    mzR::peaks(mzdata,2:3)
    mzR::peaksCount(mzdata)
    mzR::header(mzdata,1)
    mzR::header(mzdata,2:3)
    fileName(mzdata)
    close(mzdata)    
}

