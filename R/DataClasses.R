
setClass("mzR",
         representation(Ramp="C++Object"), 
         contains=c("Versioned"),
         prototype=prototype(
           new("Versioned", versions=c(mzR="0.1.2"))),
         validity=function(object) {
           msg <- validMsg(NULL,NULL)
           if (is.null(object@Ramp))
             msg <- validMsg(msg,"cRamp object not initialised.")
           if (!object@Ramp$OK())
             msg <- validMsg(msg,"cRamp object not OK.")
           if (is.null(msg)) TRUE
           else msg
         })

