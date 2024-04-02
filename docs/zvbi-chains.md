zvbi-chains(1)                                                   VBI proxy wrapper                                                  zvbi-chains(1)

NAME
       zvbi-chains - VBI proxy wrapper

SYNOPSIS
       zvbi-chains [ options ]

DESCRIPTION
       zvbi-chains is a small wrapper which executes the VBI application given on the command line while overloading several C library calls (such
       as open(2) and read(2)) so that the application can be forced to access VBI devices via the VBI proxy instead of device files directly.

       LD_PRELOAD is used to intercept C library calls and call functions in the libzvbi-chain shared library instead.  Parameters  given  on  the
       command line (e.g. device path) are passed to the library by means of environment variables.

OPTIONS
       -dev path
              Path of a VBI device from which to read data.

       -debug level
              Enables debug output: 0 = off (default); 1 = warnings, 2 = all messages.

       -help  Print a short description of all command line options.

SEE ALSO
       zvbid(1), v4l-conf(8)
       http://zapping.sourceforge.net/  (homepage)

AUTHOR
       Tom Zoerner (tomzo AT users.sourceforge.net)

COPYRIGHT
       Copyright (C) 2003, 2004 Tom Zoerner

       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You  should  have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

                                                                                                                                    zvbi-chains(1)
