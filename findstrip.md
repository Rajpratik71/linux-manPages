FINDSTRIP(1)                                                       Debian Manual                                                      FINDSTRIP(1)

NAME
       findstrip - find programs that are not stripped

SYNOPSIS
       findstrip

DESCRIPTION
       findstrip  searches  (starting  point  is  the  current directory, doesn't cross device boundaries) unstripped files.  Files are considered
       unstripped, if output of file(1) contains the string "no .*strip".

       The output is a list of unstripped files, line by line.

SEE ALSO
       zum(1), nodup(1), finddup(1).

AUTHOR
       Oleg Kibirev <oleg@gd.cs.CSUFresno.edu>.

       Manual page by Heiko Schlittermann <heiko@lotte.sax.de>.

Debian Project                                                    April 16, 2001                                                      FINDSTRIP(1)
