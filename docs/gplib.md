GPLIB(1)                                                        Linux user's manual                                                       GPLIB(1)

NAME
       gplib - GNU PIC librarian

SYNOPSIS
       gplib [options] library [member]

WARNING
       The  information  in  this man page is an extract from the full documentation of gputils and is limited to the meaning of the options.  For
       complete and current documentation, refer to "gputils.ps" located in the gputils docs directory.

DESCRIPTION
       gplib creates, modifies, and extracts from COFF archives for Microchip (TM) PIC (TM) micro-controllers.  gplib is part of  gputils.   Check
       the gputils(1) manpage for details on other GNU PIC utilities.

OPTIONS
       -c, --create
              Create a new library.

       -d, --delete
              Delete member from library.

       -h, --help
              Show the usage message and exit.

       -n, --no-index
              Don't add symbol index.

       -q, --quiet
              Quiet mode.

       -r, --replace
              Add or replace member from library.

       -s, --symbols
              List global symbols in library.

       -t, --list
              List members in library.

       -v, --version
              Show the version information and exit.

       -x, --extract
              Extract member from library.

SEE ALSO
       gputils(1)

AUTHOR
       Craig Franklin <craigfranklin@users.sourceforge.net>

COPYRIGHT
       Copyright (C) 2002, 2003, 2004, 2005 Craig Franklin

       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You  should  have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

gputils-1.4.0                                                       2012-03-04                                                            GPLIB(1)
