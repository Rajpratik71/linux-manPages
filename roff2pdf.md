roff2pdf(1)                                                   General Commands Manual                                                  roff2pdf(1)

NAME
       roff2pdf - transform roff code into pdf mode

SYNOPSIS
       roff2pdf [ groffer_option ....]  [--] [ filespec ....]

       roff2pdf -h|--help

       roff2pdf -v|--version

       The  options  -v and --version print the version information of the program to standard output and exit.  The options -h and --help print a
       usage information of the program to standard output and stop the program instantly.

       All other options are assumed to be groffer options.  They are internally passed to groffer.  They override the behavior  of  the  program.
       The options are optional, they can be omitted.

       The  filespec arguments correspond to the filespec arguments of groffer.  So they are either the names of existing, readable files or - for
       standard input, or the name of a man page or a groffer(1) man page search pattern.  If no filespec is specified standard input  is  assumed
       automatically.

DESCRIPTION
       roff2pdf transforms roff code into pdf mode.  Print the result to standard output.

       There are more of these programs for generating other formats of roff input.

       roff2dvi(1)
              is for dvi mode.

       roff2html(1)
              generates html output.

       roff2ps(1)
              prints PostScript format to standard output.

       roff2text(1)
              generates text output in the groff device latin1.

       roff2x(1)
              prints the output in the groff device X that is suitable for programs like gxditview(1) or xditview(1).

SEE ALSO
       groff(1), groffer(1), roff2dvi(1), roff2html(1), roff2ps(1), roff2text(1), roff2x(1), gxditview(1).

COPYING
       Copyright © 2006-2014 Free Software Foundation, Inc.

       This file is part of groffer, which is part of GNU groff, a free software project.

       You  can redistribute it and/or modify it under the terms of the GNU General Public License version 2 (GPL2) as published by the Free Soft‐
       ware Foundation.

       The license text is available in the internet at ⟨http://www.gnu.org/licenses/gpl-2.0.html⟩.

AUTHOR
       This file was written by Bernd Warken ⟨groff-bernd.warken-72@web.de⟩.

Groff Version 1.22.3                                              28 January 2016                                                      roff2pdf(1)
