GSPATH(1)                                                      GNUstep System Manual                                                     GSPATH(1)

NAME
       gspath - Utility to display standard directory/path information

SYNOPSIS
       gspath

DESCRIPTION
       This  utility  can be used to print out a single directory or path in order for external applications to know what paths the GNUstep system
       is using.  It was written to provide information for the GNUstep make package.

       The gspath usility is called with exactly one argument, which determines what it prints.

Arguments
       To display the path to the defaults directory for the current user, use the defaults argument.

       To display the directory search path needed to locate dynamic libraries, use the libpath argument.

       To display the directory search path needed to locate commmand-line programs, use the path argument.

       To display the GNUstep home directory of the current user, use the user argument.

HISTORY
       Work on gspath started July 2005.

       This manual page first appeared in gnustep-base 1.11.1 (July 2005).

AUTHORS
       gspath was written by Richard Frith-Macdonald <rfm@gnu.org>.

       This man page was written by Richard Frith-Macdonald <rfm@gnu.org>.

GNUstep                                                              July 2005                                                           GSPATH(1)
