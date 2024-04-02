fslint-gui(1)                                                      User Commands                                                     fslint-gui(1)

NAME
       fslint-gui - A GUI wrapper for the individual fslint command line tools

SYNOPSIS
       fslint-gui [OPTIONS] [PATHS]

DESCRIPTION
       fslint is a toolset to find various problems with filesystems, including duplicate files and problematic filenames etc.

       Individual  command  line  tools  are  available  in  addition  to  the  GUI  and  to  access  them, one can change to, or add to $PATH the
       /usr/share/fslint/fslint directory on a standard install.  Each of these commands in that directory have  a  --help  option  which  further
       details its parameters.

       findup - find DUPlicate files

       findnl - find Name Lint (problems with filenames)

       findu8 - find filenames with invalid utf8 encoding

       findbl - find Bad Links (various problems with symlinks)

       findsn - find Same Name (problems with clashing names)

       finded - find Empty Directories

       findid - find files with dead user IDs

       findns - find Non Stripped executables

       findrs - find Redundant Whitespace in files

       findtf - find Temporary Files

       findul - find possibly Unused Libraries

       zipdir - Reclaim wasted space in ext2 directory entries

PARAMETERS
       If [PATHS] are specified, they become the default search path, otherwise the current directory becomes the default.

       -f     always print full paths even if only a single path is specified

       -r     turn OFF recursion

       --version
              Display the fslint version and exit

       --help Display help for tool specific options

AUTHOR
       Written by Padraig Brady

REPORTING BUGS
       Report bugs to <P@draigBrady.com>.

COPYRIGHT
       Copyright © 2000-2009 Padraig Brady <P@draigBrady.com>.

       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details, which is available at www.gnu.org

fslint                                                              April 2010                                                       fslint-gui(1)
