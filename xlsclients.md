XLSCLIENTS(1)                           General Commands Manual                          XLSCLIENTS(1)

NAME
       xlsclients - list client applications running on a display

SYNOPSIS
       xlsclients [-display displayname] [-a] [-l] [-m maxcmdlen] [-version]

DESCRIPTION
       Xlsclients is a utility for listing information about the client applications running on a dis‐
       play.  It may be used to generate scripts representing a snapshot of the  user's  current  ses‐
       sion.

OPTIONS
       -display displayname
               This option specifies the X server to contact.

       -a      This  option  indicates that clients on all screens should be listed.  By default, only
               those clients on the default screen are listed.

       -l      List in long format, giving the window name, icon name, and class hints in addition  to
               the machine name and command string shown in the default format.

       -m maxcmdlen
               This  option specifies the maximum number of characters in a command to print out.  The
               default is 10000.

       -version
               Print the program version and exit.

ENVIRONMENT
       DISPLAY To get the default host, display number, and screen.

SEE ALSO
       X(7), xwininfo(1), xprop(1)

AUTHOR
       Jim Fulton, MIT X Consortium

X Version 11                               xlsclients 1.1.4                              XLSCLIENTS(1)
