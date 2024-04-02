GPLINK(1)                                                       Linux user's manual                                                      GPLINK(1)

NAME
       gplink - GNU PIC linker

SYNOPSIS
       gplink [options] [objects] [libraries]

WARNING
       The  information  in  this man page is an extract from the full documentation of gputils and is limited to the meaning of the options.  For
       complete and current documentation, refer to "gputils.ps" located in the gputils docs directory.

DESCRIPTION
       gplink combines a number of object and archive files, relocates their data, and ties up their symbol references.  It outputs an  executable
       for Microchip (TM) PIC (TM) micro-controllers.  gplink is part of gputils.  Check the gputils(1) manpage for details on other GNU PIC util‐
       ities.

OPTIONS
       -a FMT, --hex-format FMT
              gplink supports inhx8m, inhx8s, inhx16, and inhx32 hex file formats.  This option controls which  hex  file  format  is  used.   The
              default is inhx32.

       -c, --object
              Output an executable object.

       -d, --debug
              Display debug messages.

       -f VALUE, --fill VALUE
              Fill  unused  unprotected  program  memory  with  value.   The value supercedes the linker script fill value.  The value must not be
              greater than 0xffff.  The value is hex.  The value may be preceeded by "0x".

       -h, --help
              Show the usage message and exit.

       -I DIR, --include DIR
              Specify include directory.

       -l, --no-list
              Disable list file output.

       -m, --map
              Output a map file.

       --mplink-compatible
              This option sets the MPLINK compatibility mode.

       -o FILE, --output FILE
              Alternate name of the output file.

       -O OPT, --optimize OPT
              Optimization level.  Default value is 1.

       -q, --quiet
              Suppress anything sent to standard output.

       -r, --use-shared
              Attempt to relocate unshared data sections to shared memory if relocation fails.

       -s FILE, --script FILE
              Linker script.

       -t SIZE, --stack SIZE
              Create a stack section.

       -u, --macro symbol=[value]
              Add macro value for script.

       -v, --version
              Show the version information and exit.

       -w, --processor-mismatch
              Disable "processor mismatch" warning.

SEE ALSO
       gputils(1)

AUTHOR
       Craig Franklin <craigfranklin@users.sourceforge.net>

COPYRIGHT
       Copyright (C) 2002, 2003, 2004, 2005 Craig Franklin

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as  published  by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free  Software  Foundation,
       Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

gputils-1.4.0                                                       2013-05-10                                                           GPLINK(1)
