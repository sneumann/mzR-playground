
rampOpenFile <- function(filename, declaredOnly = FALSE, verbose = FALSE) {
  tmpramp <- new( Ramp )

  tmpramp$open(filename, declaredOnly = declaredOnly)

  if (!tmpramp$OK()) {
      return(tmpramp)
  }

  if (verbose) {
    print(tmpramp)
  }
  return(tmpramp)
}
