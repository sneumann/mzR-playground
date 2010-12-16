#include <Rcpp.h>
#include "RcppRamp.hpp"

RCPP_MODULE(modRamp){
 using namespace Rcpp ;
 class_<RcppRamp>( "Ramp" )
   .constructor()
   .method( "open", &RcppRamp::open )
   .method( "close", &RcppRamp::close )
   .method( "getFilename", &RcppRamp::getFilename )
   .method( "getRunInfo", &RcppRamp::getRunInfo )
   .method( "getInstrumentInfo", &RcppRamp::getInstrumentInfo )
   .method( "getScanHeaderInfo", &RcppRamp::getScanHeaderInfo )
   .method( "getAllScanHeaderInfo", &RcppRamp::getAllScanHeaderInfo )
   .method( "getPeakList", &RcppRamp::getPeakList )
   .method( "get3DMap", &RcppRamp::get3DMap )
   .method( "getLastScan", &RcppRamp::getLastScan )
   .method( "OK", &RcppRamp::OK )
 ;
}

