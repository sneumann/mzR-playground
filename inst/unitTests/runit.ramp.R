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
    runInfo(aa)
    close(aa)
}

test.mzML <- function() {
    library(msdata)
    cdfpath <- system.file("microtofq", package = "msdata")
    file <- list.files(cdfpath, pattern="MM14.mzML",
                       full.names=TRUE, recursive = TRUE)
    aa <- openMSfile(file)
    runInfo(aa)
    close(aa)
}

test.mzData <- function() {
    library(msdata)
    cdfpath <- system.file("microtofq", package = "msdata")
    file <- list.files(cdfpath, pattern="MM14.mzdata",
                       full.names=TRUE, recursive = TRUE)
    aa <- openMSfile(file)
    runInfo(aa)
    close(aa)
}

