GPVC(1)                                                         Linux user's manual                                                        GPVC(1)

NAME
       gpvc - GNU PIC COD file viewer

SYNOPSIS
       gpvc [options] file

WARNING
       The  information  in  this man page is an extract from the full documentation of gputils and is limited to the meaning of the options.  For
       complete and current documentation, refer to "gputils.ps" located in the gputils docs directory.

DESCRIPTION
       gpvc is an COD file viewer for Microchip (TM) PIC (TM) micro-controllers.  COD files are and output from gpasm.  They  contain  information
       used for simulation.  gpvc is part of gputils.  Check the gputils(1) manpage for details on other GNU PIC utilities.

OPTIONS
       -a, --all
              Display all information in the COD file.

       -d, --directory
              Display directory header.

       -l, --listing
              Display source listing.

       -m, --message
              Display debug message area.

       -h, --help
              Show the usage message and exit.

       -r, --rom
              Display ROM.

       -s, --symbols
              Display symbols.

       -v, --version
              Show the version information and exit.

SEE ALSO
       gputils(1)

AUTHOR
       Craig Franklin <craigfranklin@users.sourceforge.net>

COPYRIGHT
       Copyright (C) 2002, 2003, 2004, 2005 Scott Dattalo

       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You  should  have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

gputils-1.4.0                                                       2012-03-04                                                             GPVC(1)
