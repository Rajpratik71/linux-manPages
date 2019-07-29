GDIFFMK(1)                                                    General Commands Manual                                                   GDIFFMK(1)

NAME
SYNOPSIS
       gdiffmk [ -aaddmark ] [ -cchangemark ] [ -ddeletemark ] [ -D [ -B ] [ -Mmark1 mark2 ] ] [ -xdiffcmd ] [ -- ] [ --help ] [ --version ] file1
               file2 [ output ]

DESCRIPTION
       gdiffmk compares two groff(1), nroff(1), or troff(1) documents, file1 and file2, and creates an output which is file2  with  added  `margin
       character' (.mc) commands that indicate the differences.

       If the output filename is present, the output is written there.  If it is - or absent the output is written to the standard output.

       If the file1 or file2 argument is - the standard input is read for that input.  Clearly both cannot be -.

       Note that the output is not necessarily compatible with all macro packages and all preprocessors.  See the BUGS section below.

OPTIONS
       -aaddmark
              Use the addmark for source lines not in file1 but present in file2.  Default: +.

       -B     By  default,  the deleted texts marked by the -D option end with an added troff break command, .br, to ensure that the deletions are
              marked properly.  This is the only way to guarantee that deletions and small changes get flagged.  This option directs  the  program
              not to insert these breaks; it makes no sense to use it without -D.

       -cchangemark
              Use the changemark for changed source lines.  Default: |.

       -ddeletemark
              Use the deletemark for deleted source lines.  Default: *.

       -D     Show the deleted portions from changed and deleted text.  Default delimiting marks: [[ ... ]].

       -Mmark1 mark2
              Change the delimiting marks for the -D option.  It makes no sense to use this option without -D.

       -xdiffcmd
              Use  the  diffcmd  command  to  perform the comparison of file1 and file2.  In particular, diffcmd should accept the GNU diff -Dname
              option.  Default: diff(1).

       --     All the following arguments are treated as file names, even if they begin with -.

       --help Print a usage message on standard error output and exit.

       --version
              Print version information on the standard output and exit.

BUGS
       The output is not necessarily compatible with all macro packages and all preprocessors.  A workaround that is often successful against pre‐
       processor problems is to run gdiffmk on the output of all the preprocessors instead of the input source.

       gdiffmk  relies  on the -Dname option of GNU diff(1) to make a merged `#ifdef' output format.  It hasn't been tested whether other versions
       of diff(1) do support this option.  See also the -xdiffcmd option.

       Report bugs to ⟨bug-groff@gnu.org⟩.  Include a complete, self-contained example that will allow the bug to be  reproduced,  and  say  which
       version of gdiffmk you are using.

COPYRIGHT
       Copyright © 2004-2014 Free Software Foundation, Inc.

       This file is part of the gdiffmk utility, which is part of groff, a free software project.

       You  can redistribute and/or modify gdiffmk under the terms of the GNU General Public License as published by the Free Software Foundation,
       either version 3 of the License, or (at your option) any later version.

       gdiffmk is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty  of  MERCHANTABILITY
       or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

AUTHORS
       This document was written and is maintained by Mike Bianchi

SEE ALSO
       groff(1), nroff(1), gtroff(1), diff(1)

Groff Version 1.22.3                                              28 January 2016                                                       GDIFFMK(1)
