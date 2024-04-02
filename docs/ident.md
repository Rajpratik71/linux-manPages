IDENT(1)                                                                                   General Commands Manual                                                                                   IDENT(1)



NAME
       ident - identify RCS keyword strings in files

SYNOPSIS
       ident [ -q ] [ -V ] [ file ... ]

DESCRIPTION
       ident searches for all instances of the pattern $keyword: text $ in the named files or, if no files are named, the standard input.

       These  patterns  are normally inserted automatically by the RCS command co(1), but can also be inserted manually.  The option -q suppresses the warning given if there are no patterns in a file.  The
       option -V prints RCS's version number.

       ident works on text files as well as object files and dumps.  For example, if the C program in f.c contains

              #include <stdio.h>
              static char const rcsid[] =
                "$Id: f.c,v 5.4 1993/11/09 17:40:15 eggert Exp $";
              int main() { return printf("%s\n", rcsid) == EOF; }

       and f.c is compiled into f.o, then the command

              ident  f.c  f.o

       will output

              f.c:
                  $Id: f.c,v 5.4 1993/11/09 17:40:15 eggert Exp $
              f.o:
                  $Id: f.c,v 5.4 1993/11/09 17:40:15 eggert Exp $

       If a C program defines a string like rcsid above but does not use it, lint(1) may complain, and some C compilers will optimize away the string.  The most reliable solution is to have the program use
       the rcsid string, as shown in the example above.

       ident finds all instances of the $keyword: text $ pattern, even if keyword is not actually an RCS-supported keyword.  This gives you information about nonstandard keywords like $XConsortium$.

KEYWORDS
       Here  is  the  list  of keywords currently maintained by co(1).  All times are given in Coordinated Universal Time (UTC, sometimes called GMT) by default, but if the files were checked out with co's
       -zzone option, times are given with a numeric time zone indication appended.

       $Author$
              The login name of the user who checked in the revision.

       $Date$ The date and time the revision was checked in.

       $Header$
              A standard header containing the full RCS file name, the revision number, the date and time, the author, the state, and the locker (if locked).

       $Id$   Same as $Header$, except that the RCS file name is without directory components.

       $Locker$
              The login name of the user who locked the revision (empty if not locked).

       $Log$  The log message supplied during checkin.  For ident's purposes, this is equivalent to $RCSfile$.

       $Name$ The symbolic name used to check out the revision, if any.

       $RCSfile$
              The RCS file name without directory components.

       $Revision$
              The revision number assigned to the revision.

       $Source$
              The full RCS file name.

       $State$
              The state assigned to the revision with the -s option of rcs(1) or ci(1).

       co(1) represents the following characters in keyword values by escape sequences to keep keyword strings well-formed.

              char     escape sequence
              tab      \t
              newline  \n
              space    \040
              $        \044
              \        \\

IDENTIFICATION
       Author: Walter F. Tichy.
       Manual Page Revision: 5.8; Release Date: 2011-08-30.
       Copyright © 2010, 2011 Thien-Thi Nguyen.
       Copyright © 1990, 1992, 1993 Paul Eggert.
       Copyright © 1982, 1988, 1989 Walter F. Tichy.

SEE ALSO
       ci(1), co(1), rcs(1), rcsdiff(1), rcsintro(1), rcsmerge(1), rlog(1), rcsfile(5).

       Walter F. Tichy, RCS--A System for Version Control, Software--Practice & Experience 15, 7 (July 1985), 637-654.



GNU RCS 5.8                                                                                       2011-08-30                                                                                         IDENT(1)
