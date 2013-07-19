#include "fbcu.bi"

namespace fbc_tests.optimizations.float_bop_cast_rhs

sub testCodeGeneration cdecl( )
	'' -gen gas should generate good code for all of these

	#macro check( TL, TR, rhsexpr )
		scope
			dim l as TL = 10, r as TR = 5
			l += rhsexpr
			CU_ASSERT( l = 15 )
		end scope
		scope
			dim l as TL = 10, r as TR = 5
			l -= rhsexpr
			CU_ASSERT( l = 5 )
		end scope
		scope
			dim l as TL = 10, r as TR = 5
			l /= rhsexpr
			CU_ASSERT( l = 2 )
		end scope
	#endmacro

	check( single,  byte, r )
	check( single,  byte, cdbl( r ) )
	check( single,  byte, csng( r ) )
	check( single, ubyte, r )
	check( single, ubyte, cdbl( r ) )
	check( single, ubyte, csng( r ) )

	check( single,  short, r )
	check( single,  short, cdbl( r ) )
	check( single,  short, csng( r ) )
	check( single, ushort, r )
	check( single, ushort, cdbl( r ) )
	check( single, ushort, csng( r ) )

	check( single,  long, r )
	check( single,  long, cdbl( r ) )
	check( single,  long, csng( r ) )
	check( single, ulong, r )
	check( single, ulong, cdbl( r ) )
	check( single, ulong, csng( r ) )

	check( single,  integer, r )
	check( single,  integer, cdbl( r ) )
	check( single,  integer, csng( r ) )
	check( single, uinteger, r )
	check( single, uinteger, cdbl( r ) )
	check( single, uinteger, csng( r ) )

	check( single,  longint, r )
	check( single,  longint, cdbl( r ) )
	check( single,  longint, csng( r ) )
	check( single, ulongint, r )
	check( single, ulongint, cdbl( r ) )
	check( single, ulongint, csng( r ) )

	check( single, single, r )
	check( single, single, cdbl( r ) )
	check( single, single, csng( r ) )
	check( single, double, r )
	check( single, double, cdbl( r ) )
	check( single, double, csng( r ) )

	check( double,  byte, r )
	check( double,  byte, cdbl( r ) )
	check( double,  byte, csng( r ) )
	check( double, ubyte, r )
	check( double, ubyte, cdbl( r ) )
	check( double, ubyte, csng( r ) )

	check( double,  short, r )
	check( double,  short, cdbl( r ) )
	check( double,  short, csng( r ) )
	check( double, ushort, r )
	check( double, ushort, cdbl( r ) )
	check( double, ushort, csng( r ) )

	check( double,  long, r )
	check( double,  long, cdbl( r ) )
	check( double,  long, csng( r ) )
	check( double, ulong, r )
	check( double, ulong, cdbl( r ) )
	check( double, ulong, csng( r ) )

	check( double,  integer, r )
	check( double,  integer, cdbl( r ) )
	check( double,  integer, csng( r ) )
	check( double, uinteger, r )
	check( double, uinteger, cdbl( r ) )
	check( double, uinteger, csng( r ) )

	check( double,  longint, r )
	check( double,  longint, cdbl( r ) )
	check( double,  longint, csng( r ) )
	check( double, ulongint, r )
	check( double, ulongint, cdbl( r ) )
	check( double, ulongint, csng( r ) )

	check( double, single, r )
	check( double, single, cdbl( r ) )
	check( double, single, csng( r ) )
	check( double, double, r )
	check( double, double, cdbl( r ) )
	check( double, double, csng( r ) )
end sub

private sub ctor( ) constructor
	fbcu.add_suite( "tests/optimizations/float-bop-cast-rhs" )
	fbcu.add_test( "code generation", @testCodeGeneration )
end sub

end namespace
