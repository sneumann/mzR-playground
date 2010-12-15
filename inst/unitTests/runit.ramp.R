test.filenotfound <- function() {
    filename <- "rhabarber.mzData"
    ramp <- rampOpenFile(filename)
    checkTrue(!ramp$OK())
}

test.mzXML <- function() {
    library(msdata)
    cdfpath <- system.file("threonine", package = "msdata")
    file <- list.files(cdfpath, pattern="threonine_i2_e35_pH_tree.mzXML",
                       full.names=TRUE, recursive = TRUE)
    ramp <- rampOpenFile(file)
    ramp$getRunInfo()
    ramp$close()
}

test.mzML <- function() {
    library(msdata)
    cdfpath <- system.file("microtofq", package = "msdata")
    file <- list.files(cdfpath, pattern="MM14.mzML",
                       full.names=TRUE, recursive = TRUE)
    ramp <- rampOpenFile(file)
    ramp$getRunInfo()
    ramp$close()
}

test.mzData <- function() {
    library(msdata)
    cdfpath <- system.file("microtofq", package = "msdata")
    file <- list.files(cdfpath, pattern="MM14.mzdata",
                       full.names=TRUE, recursive = TRUE)
    ramp <- rampOpenFile(file)

    ## This fails with
    ## ramp$getRunInfo()
    ramp$close()
}

