GPASM(1)                                                        Linux user's manual                                                       GPASM(1)

NAME
       gpasm - GNU PIC assembler

SYNOPSIS
       gpasm [options] file

WARNING
       The  information  in  this man page is an extract from the full documentation of gputils and is limited to the meaning of the options.  For
       complete and current documentation, refer to "gputils.ps" located in the gputils docs directory.

DESCRIPTION
       gpasm is an assembler for Microchip (TM) PIC (TM) micro-controllers.  It's intended to be compatible with the manufacturer's  MPASM  assem‐
       bler.  gpasm is part of gputils.  Check the gputils(1) manpage for details on other GNU PIC utilities.

OPTIONS
       Below is a summary of the gpasm options.  gpasm options always supersede any settings in the source code.

       -a FMT, --hex-format FMT
              GPASM  supports  inhx8m,  inhx8s,  inhx16,  and  inhx32  hex file formats.  This option controls which hex file format is used.  The
              default is inhx32.

       -c, --object
              Output a relocatable object (new COFF format).

       -C, --old-coff
              Output a relocatable object (old COFF format).

       -d, --debug
              Output debug messages.

       -D SYM=VAL, --define SYM=VAL
              Define SYM with value VAL. This is equivalent to placing "#define SYM VAL" in the source.

       -e [ON|OFF], --expand [ON|OFF]
              Macro expansion in the listing file is controlled using the EXPAND and NOEXPAND directives.  This option can force either  directive
              to  be  ignored.  When "ON" is selected the macros are always expanded regardless of the presence of NOEXPAND.  Likewise, "OFF" will
              force macros not to be expanded.

       -g, --debug-info
              Use debug directives for COFF.

       -h, --help
              Show the usage message and exit.

       -i, --ignore-case
              All user defined symbols and macros are case sensitive.  This option makes them case insensitive.

       -I DIR, --include DIR
              The top level assembly file is passed to gpasm as an argument.  This file can contain INCLUDE directives.  These directives open the
              specified  file  and  then  its  contents are assembled.  GPASM searches for these files in the local directory.  If the file is not
              located, the default header path is checked.  Finally, all paths specified using this argument are searched.

       -l[12[ce]|14[ce]|16[ce]], --list-chips[=([12[ce]|14[ce]|16[ce]])]
              List supported processors based on various aspects.

       -L, --force-list
              Ignore NOLIST directives.  This forces gpasm to print every line assembled in the list file output.

       -m, --dump
              Upon completion of the final pass of assembly, display the contents of instruction memory.

       --mpasm-compatible
              This option sets the MPASM compatibility mode.

       -M, --deps
              Output a dependency file.

       -n, --dos
              By default, gpasm generates hex files using ISO format.  However, some device programmers  required  a  DOS  formatted  file.   This
              option will cause gpasm to generate a DOS formatted hex file.

       -o FILE, --output FILE
              Alternate name of the output file.

       -p PROC, --processor PROC
              Select the processor.

       -P FILE, --preprocess FILE
              Write preprocessed asm file to FILE.

       -q, --quiet
              Suppress anything sent to standard output.

       -r RADIX, --radix RADIX
              The supported radices are BIN, DEC, OCT, and HEX.  The default is HEX.

       -u, --absolute
              Use absolute paths.

       -v, --version
              Show the version information and exit.

       -w [0|1|2], --warning [0|1|2]
              This  option sets the message level. "0" is the default.  It will allow all messages, warnings, and errors to be reported.  "1" will
              suppress the messages.  "2" will suppress the messages and warnings.

       -y, --extended
              Enable 18xx extended mode.

SEE ALSO
       gputils(1)

AUTHOR
       Craig Franklin <craigfranklin@users.sourceforge.net>

COPYRIGHT
       Copyright (C) 2002, 2003, 2004, 2005 James Bowman, Craig Franklin

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as  published  by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free  Software  Foundation,
       Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

gputils-1.4.0                                                       2014-05-01                                                            GPASM(1)
