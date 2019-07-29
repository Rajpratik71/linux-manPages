GPSTRIP(1)                                                      Linux user's manual                                                     GPSTRIP(1)

NAME
       gpstrip - discard symbols from object file

SYNOPSIS
       gpstrip [options] [file(s)]

WARNING
       The  information  in  this man page is an extract from the full documentation of gputils and is limited to the meaning of the options.  For
       complete and current documentation, refer to "gputils.ps" located in the gputils docs directory.

DESCRIPTION
       gpstrip discards symbols from GNU PIC object files.  gpstrip is part of gputils.  Check the gputils(1) manpage for details on other GNU PIC
       utilities.

OPTIONS
       -g, --strip-debug
              Strip debug symbols.

       -h, --help
              Show the usage message and exit.

       -k SYMBOL, --keep-symbol SYMBOL
              Keep symbol.

       -n SYMBOL, --strip-symbol SYMBOL
              Remove symbol.

       -o FILE, --output FILE
              Alternate name of output file.

       -p, --preserve-dates
              Preserve dates.

       -r SECTION, --remove-section SECTION
              Remove section.

       -s, --strip-all
              Remove all symbols.

       -u, --strip-unneeded
              Strip symbols not need for relocations.

       -v, --version
              Show the version information and exit.

       -V, --verbose
              Verbose mode.

       -x, --discard-all
              Remove non-global symbols.

SEE ALSO
       gputils(1)

AUTHOR
       Craig Franklin <craigfranklin@users.sourceforge.net>

COPYRIGHT
       Copyright (C) 2005 Craig Franklin

       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You  should  have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

gputils-1.4.0                                                       2012-03-04                                                          GPSTRIP(1)
