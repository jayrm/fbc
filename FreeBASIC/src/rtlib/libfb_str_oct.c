/*
 *  libfb - FreeBASIC's runtime library
 *	Copyright (C) 2004-2005 Andre V. T. Vicentini (av1ctor@yahoo.com.br) and others.
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2.1 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/*
 * str_oct.c -- oct$ routines
 *
 * chng: oct/2004 written [v1ctor]
 *
 */

#include <malloc.h>
#include <stdlib.h>
#include "fb.h"


/*:::::*/
static FBSTRING *hOCT ( unsigned int num, int len )
{
	FBSTRING 	*dst;

	/* alloc temp string */
    dst = fb_hStrAllocTemp( NULL, len * 4 );
	if( dst != NULL )
	{
		/* convert */
#ifdef TARGET_WIN32
		_itoa( num, dst->data, 8 );
#else
		sprintf( dst->data, "%o", num );
#endif
        fb_hStrSetLength( dst, strlen( dst->data ) );
	}
	else
		dst = &fb_strNullDesc;

	return dst;
}

/*:::::*/
FBCALL FBSTRING *fb_OCT_b ( unsigned char num )
{
	return hOCT( num, sizeof( char ) );
}

/*:::::*/
FBCALL FBSTRING *fb_OCT_s ( unsigned short num )
{
	return hOCT( num, sizeof( short ) );
}

/*:::::*/
FBCALL FBSTRING *fb_OCT_i ( unsigned int num )
{
	return hOCT( num, sizeof( int ) );
}

