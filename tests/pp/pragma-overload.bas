' TEST_MODE : COMPILE_ONLY_OK

'' #pragma overload
'' #pragma overload = false
'' #pragma overload = true
'' #pragma push( overload )
'' #pragma push( overload, false )
'' #pragma push( overload, true )
'' #pragma pop( overload )
''

'' default value
	#assert( __FB_OPTION_OVERLOAD__ = false )

'' test implicit true

	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma overload
	#assert( __FB_OPTION_OVERLOAD__ = true )

	#pragma overload = false
	#assert( __FB_OPTION_OVERLOAD__ = false )

'' test explicit true

	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma overload = true
	#assert( __FB_OPTION_OVERLOAD__ = true )

	#pragma overload = false
	#assert( __FB_OPTION_OVERLOAD__ = false )


'' test implicit push

	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma push( overload )
	#assert( __FB_OPTION_OVERLOAD__ = true )

	#pragma pop( overload )
	#assert( __FB_OPTION_OVERLOAD__ = false )

'' test explicit push false, push false nested

	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma push( overload, false )
	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma push( overload, false )
	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma pop( overload )
	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma pop( overload )
	#assert( __FB_OPTION_OVERLOAD__ = false )

'' test explicit push false, push true nested

	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma push( overload, false )
	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma push( overload, true )
	#assert( __FB_OPTION_OVERLOAD__ = true )

	#pragma pop( overload )
	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma pop( overload )
	#assert( __FB_OPTION_OVERLOAD__ = false )

'' test explicit push true, push false nested

	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma push( overload, true )
	#assert( __FB_OPTION_OVERLOAD__ = true )

	#pragma push( overload, false )
	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma pop( overload )
	#assert( __FB_OPTION_OVERLOAD__ = true )

	#pragma pop( overload )
	#assert( __FB_OPTION_OVERLOAD__ = false )

'' test explicit push true, push false nested

	#assert( __FB_OPTION_OVERLOAD__ = false )

	#pragma push( overload, true )
	#assert( __FB_OPTION_OVERLOAD__ = true )

	#pragma push( overload, true )
	#assert( __FB_OPTION_OVERLOAD__ = true )

	#pragma pop( overload )
	#assert( __FB_OPTION_OVERLOAD__ = true )

	#pragma pop( overload )
	#assert( __FB_OPTION_OVERLOAD__ = false )
