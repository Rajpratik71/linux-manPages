GPVO(1)                                                         Linux user's manual                                                        GPVO(1)

NAME
       gpvo - GNU PIC object file viewer

SYNOPSIS
       gpvo [options] file

WARNING
       The  information  in  this man page is an extract from the full documentation of gputils and is limited to the meaning of the options.  For
       complete and current documentation, refer to "gputils.ps" located in the gputils docs directory.

DESCRIPTION
       gpvo is an COFF object file viewer for Microchip (TM) PIC (TM) micro-controllers.  COFF files are relocatable objects  output  from  gpasm.
       gpvo is part of gputils.  Check the gputils(1) manpage for details on other GNU PIC utilities.

OPTIONS
       -b, --binary
              Display binary data.

       -c, --mnemonics
              Decode special mnemonics.

       -f, --file
              Display file header.

       -h, --help
              Show the usage message and exit.

       -n, --no-names
              Suppress filenames.

       -s, --section
              Display sections.

       -t, --symbol
              Display symbol table.

       -v, --version
              Show the version information and exit.

       -x FILE, --export FILE
              Export the external symbols.

       -y, --extended
              Enable 18xx extended mode.

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

gputils-1.4.0                                                       2012-03-04                                                             GPVO(1)
