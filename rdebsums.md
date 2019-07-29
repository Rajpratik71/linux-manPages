
RDEBSUMS(1)                                                      Recursive debsums                                                     RDEBSUMS(1)

NAME
       rdebsums - a recursive debsums

SYNOPSIS
       rdebsums --help  | [  debsum options  ] [  --others  ] package

DESCRIPTION
       rdebsums  runs debsums(1) over a given package and all its dependencies. It can be used to make sure a problem with a package is not due to
       file corruption.

       All but the last element of the command-line and options understood by rdebsums are sent to debsums(1).

OPTIONS
       --help Prints a short help text

       --others
              Also runs debsums on Recommended and Suggested packages.

EXAMPLES
       Check the package aptitude and all its dependencies:

       rdebsums aptitude

       The same while being significantly less verbose

       rdebsums -s aptitude

BUGS
       rdebsums is quite slow - essentially due to dpkg-query not being extremely fast.

       Currently, rdebsums will be confused by virtual packages.

       --others is actually nearly useless, as you often end up checking nearly all packages. You'll most probably win  time  by  running  debsums
       without arguments.

AUTHOR
       rdebsums was written by Vincent Fourmond <fourmond@debian.org>

SEE ALSO
       debsums(1), dpkg-query(1)

Version 0.1                                                         2007-03-29                                                         RDEBSUMS(1)
