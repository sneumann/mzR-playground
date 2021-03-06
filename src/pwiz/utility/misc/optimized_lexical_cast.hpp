//
// $Id: optimized_lexical_cast.hpp 1195 2009-08-14 22:12:04Z chambm $
//
//
// Original author: Matt Chambers <matt.chambers .@. vanderbilt.edu>
//
// Copyright 2008 Spielberg Family Center for Applied Proteomics
//   Cedars Sinai Medical Center, Los Angeles, California  90048
// Copyright 2008 Vanderbilt University - Nashville, TN 37232
//
// Licensed under the Apache License, Version 2.0 (the "License"); 
// you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at 
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
// See the License for the specific language governing permissions and 
// limitations under the License.
//

#ifndef _OPTIMIZED_LEXICAL_CAST_HPP_
#define _OPTIMIZED_LEXICAL_CAST_HPP_

#include <cstdlib>
#include <cerrno>
#include <boost/lexical_cast.hpp>

// optimized string->numeric conversions
namespace boost
{
	template<>
	inline float lexical_cast( const std::string& str )
    {
		errno = 0;
		const char* stringToConvert = str.c_str();
		const char* endOfConversion = stringToConvert;
		float value = (float) strtod( stringToConvert, const_cast<char**>(&endOfConversion) );
		if( ( value == 0.0f && stringToConvert == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	template<>
	inline double lexical_cast( const std::string& str )
	{
		errno = 0;
		const char* stringToConvert = str.c_str();
		const char* endOfConversion = stringToConvert;
		double value = strtod( stringToConvert, const_cast<char**>(&endOfConversion) );
		if( ( value == 0.0 && stringToConvert == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	template<>
	inline int lexical_cast( const std::string& str )
	{
		errno = 0;
		const char* stringToConvert = str.c_str();
		const char* endOfConversion = stringToConvert;
		int value = (int) strtol( stringToConvert, const_cast<char**>(&endOfConversion), 0 );
		if( ( value == 0 && stringToConvert == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	template<>
	inline long lexical_cast( const std::string& str )
	{
		errno = 0;
		const char* stringToConvert = str.c_str();
		const char* endOfConversion = stringToConvert;
		long value = strtol( stringToConvert, const_cast<char**>(&endOfConversion), 0 );
		if( ( value == 0l && stringToConvert == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	template<>
	inline unsigned int lexical_cast( const std::string& str )
	{
		errno = 0;
		const char* stringToConvert = str.c_str();
		const char* endOfConversion = stringToConvert;
		unsigned int value = (unsigned int) strtoul( stringToConvert, const_cast<char**>(&endOfConversion), 0 );
		if( ( value == 0u && stringToConvert == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	template<>
	inline unsigned long lexical_cast( const std::string& str )
	{
		errno = 0;
		const char* stringToConvert = str.c_str();
		const char* endOfConversion = stringToConvert;
		unsigned long value = strtoul( stringToConvert, const_cast<char**>(&endOfConversion), 0 );
		if( ( value == 0ul && stringToConvert == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	/*template<>
	inline float lexical_cast( const char*& str )
	{
		errno = 0;
		const char* endOfConversion = str;
		float value = (float) strtod( str, const_cast<char**>(&endOfConversion) );
		if( ( value == 0.0f && str == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	template<>
	inline double lexical_cast( const char*& str )
	{
		errno = 0;
		const char* endOfConversion = str;
		double value = strtod( str, const_cast<char**>(&endOfConversion) );
		if( ( value == 0.0 && str == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	template<>
	inline int lexical_cast( const char*& str )
	{
		errno = 0;
		const char* endOfConversion = str;
		int value = (int) strtol( str, const_cast<char**>(&endOfConversion), 0 );
		if( ( value == 0 && str == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	template<>
	inline long lexical_cast( const char*& str )
	{
		errno = 0;
		const char* endOfConversion = str;
		long value = strtol( str, const_cast<char**>(&endOfConversion), 0 );
		if( ( value == 0l && str == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	template<>
	inline unsigned int lexical_cast( const char*& str )
	{
		errno = 0;
		const char* endOfConversion = str;
		unsigned int value = (unsigned int) strtoul( str, const_cast<char**>(&endOfConversion), 0 );
		if( ( value == 0u && str == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}

	template<>
	inline unsigned long lexical_cast( const char*& str )
	{
		errno = 0;
		const char* endOfConversion = str;
		unsigned long value = strtoul( str, const_cast<char**>(&endOfConversion), 0 );
		if( ( value == 0ul && stringToConvert == endOfConversion ) || // error: conversion could not be performed
			errno != 0 ) // error: overflow or underflow
			throw bad_lexical_cast();//throw bad_lexical_cast( std::type_info( str ), std::type_info( value ) );
		return value;
	}
	*/
} // boost

#endif // _OPTIMIZED_LEXICAL_CAST_HPP_
