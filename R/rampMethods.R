
rampOpenFile <- function(filename, declaredOnly = FALSE, verbose = TRUE) {
  tmpramp <- new( Ramp )
  ## ramp@rcppramp <- new( modRamp$RcppRamp )
  tmpramp$open(filename, declaredOnly = declaredOnly)
  if (verbose) {
    print(tmpramp)
  }
  return(tmpramp)
}

