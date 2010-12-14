test.filenotfound <- function() {
    filename <- "rhabarber.mzData"
    checkTrue(rampOpenFile(filename) < 0)
}

test.mzXML <- function() {
    library(msdata)
    cdfpath <- system.file("threonine", package = "msdata")
    file <- list.files(cdfpath, pattern=".mzXML",
                       full.names=TRUE, recursive = TRUE)
    ramp <- rampOpenFile(file)
    ramp$getRunInfo()
    ramp$close()
}

test.mzML <- function() {
    library(msdata)
    cdfpath <- system.file("microtofq", package = "msdata")
    file <- list.files(cdfpath, pattern=".mzML", recursive = TRUE)
    ramp <- rampOpenFile(file)
    ramp$getRunInfo()
    ramp$close()
}

test.mzData <- function() {
    library(msdata)
    cdfpath <- system.file("microtofq", package = "msdata")
    file <- list.files(cdfpath, pattern=".mzData", recursive = TRUE)
    ramp <- rampOpenFile(file)
    ramp$getRunInfo()
    ramp$close()
}

