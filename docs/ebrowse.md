EBROWSE(1)                                                                                 General Commands Manual                                                                                 EBROWSE(1)



NAME
       ebrowse - create a class hierarchy database

SYNOPSIS
       ebrowse [options] [FILES...]

DESCRIPTION
       This manual page documents briefly the ebrowse command.  Full documentation is available in the GNU Info format.

       ebrowse is used to create the database used by the class browser in Emacs.

OPTIONS
       The program follows the usual GNU command line syntax, with long options starting with two dashes (`-').

       -a, --append
              append output to existing file

       -f, --files=FILES
              read input file names from FILE

       -I, --search-path=LIST
              set search path for input files

       -m, --min-regexp-length=N
              set minimum regexp length to N

       -M, --max-regexp-length=N
              set maximum regexp length to N

       -n, --no-nested-classes
              exclude nested classes

       -o, --output-file=FILE
              set output file name to FILE

       -p, --position-info
              print info about position in file

       -s, --no-structs-or-unions
              don't record structs or unions

       -v, --verbose
              be verbose

       -V, --very-verbose
              be very verbose

       -x, --no-regexps
              don't record regular expressions

       --help display this help

       --version
              display version info

SEE ALSO
       emacs(1), etags(1), and the full documentation for ebrowse which is maintained as a Texinfo manual.  If the info and ebrowse programs are properly installed at your site, the command

              info ebrowse

       should give you access to the complete manual.

AUTHOR
       Ebrowse was written by Gerd Moellmann.

COPYING
       Copyright (C) 2008-2013 Free Software Foundation, Inc.

       Permission is granted to make and distribute verbatim copies of this document provided the copyright notice and this permission notice are preserved on all copies.

       Permission  is  granted  to copy and distribute modified versions of this document under the conditions for verbatim copying, provided that the entire resulting derived work is distributed under the
       terms of a permission notice identical to this one.

       Permission is granted to copy and distribute translations of this document into another language, under the above conditions for modified versions, except that this permission notice may  be  stated
       in a translation approved by the Free Software Foundation.




                                                                                                                                                                                                   EBROWSE(1)
