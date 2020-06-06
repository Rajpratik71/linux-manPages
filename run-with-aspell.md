RUN-WITH-ASPELL(1)                                                                   Aspell Abbreviated User's Manual                                                                  RUN-WITH-ASPELL(1)

NAME
       run-with-aspell - script to help use GNU Aspell as an ispell replacement

SYNOPSIS
       run-with-aspell <command>

DESCRIPTION
       The recommended way to use Aspell as a replacement for Ispell is to change the Ispell command from within the program being used.  If that is not possible, the run-with-aspell script may be used
       instead.

OPTIONS
       <command>
              is the name of the program with any optional arguments.

       The old method of mapping ispell to Aspell is discouraged because it can create compatibility problems with programs that actually require ispell such as ispell's own scripts.

SEE ALSO
       aspell(1), aspell-import(1), word-list-compress(1)

       Aspell is fully documented in its Texinfo manual.  See the `aspell' entry in info for more complete documentation.

AUTHOR
       This manual page was written by Sudhakar Chandrasekharan <thaths@netscape.com> and Brian Nelson <pyro@debian.org>.

GNU                                                                                             2004-03-03                                                                             RUN-WITH-ASPELL(1)
