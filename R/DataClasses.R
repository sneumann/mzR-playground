#################################################################
## 'mzR': main class, from which format-specific classes inherit.
##
## Currently, data MS data accessed using the ramp C++ code
## (see mzR/src/*ramp.* files) and interfaced though the ramp
## slot using a Rcpp module (see mzR/src/RcppRamp*)
##
## In future versions, the proteowizard API will be used and
## interaced though the pwiz slot. 

setClass("mzR",
         representation(ramp="C++Object",
                        pwiz="ANY",
                        fileName="character"),
         contains=c("Versioned"),
         prototype=prototype(
           new("Versioned", versions=c(mzR="0.1.4")),
           pwiz=NULL),
         validity=function(object) {
           msg <- validMsg(NULL,NULL)
           if (is.null(object@ramp))
             msg <- validMsg(msg,"cRamp object not initialised.")
           if (!object@ramp$OK())
             msg <- validMsg(msg,"cRamp object not OK.")
           if (object@fileName!=object@ramp$getFilename())
             msg <- validMsg(msg,"R slot and ramp filenames do not match.") 
           if (is.null(msg)) TRUE
           else msg
         })


################################################################
## Format-specific sub-classes
##
## Different format-specific sub-classes are defined to take 
## format specificities into account. All formats do not contain 
## the same information, and format specific methods will be
## implemented accordingly.
## 
## These differences are minor so far, using the ramp API.
## Currently, the only example is the instrument info related
## methods (instrumentInfo, analyzer, ...), that do not work for
## mzData files. These methods are implemented for mzRML and
## mzRXML objects only, as opposed the runInfo, peaks, ...,
## that are implemented at the super-class level and thus
## inherited by all sub-classes.
## The mzR show method is also reimplemented for mzRData objects,
## where the instument information is ommited.
##
## We expect however more such differences to come up when using
## the protewizard API.

## mzData specific class
setClass("mzRData",
         contains=c("mzR"),
         prototype=prototype(
           new("Versioned", versions=c(mzRData="0.1.0"))))

## mzXML specific class
setClass("mzRXML",
         contains=c("mzR"),
         prototype=prototype(
           new("Versioned", versions=c(mzRXML="0.1.0"))))

## mzML specific class
setClass("mzRML",
         contains=c("mzR"),
         prototype=prototype(
           new("Versioned", versions=c(mzRML="0.1.0"))))
