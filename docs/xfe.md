XFE(1)                                                                                                                                      XFE(1)

NAME
       xfe - A lightweight file manager for X Window

SYNOPSIS
       xfe [-h] [--help] [-v] [--version] [-i] [--iconic] [-m] [--maximized] [-p n] [--panel n] [FOLDER | FILE...]

DESCRIPTION
       X  File Explorer (xfe) is a lightweight file manager for X Window, written using the FOX toolkit.  It is desktop independent and can easily
       be customized.  It has Windows Commander or MS-Explorer look and it's very fast and small.  Xfe is based on the popular, but discontinued X
       Win Commander, written by Maxim Baranov.

AUTHOR
       Roland Baudin <roland65@free.fr>.

OPTIONS
       xfe accepts the following options:

       -h, --help
              Print the help screen and exit.

       -v, --version
              Print version information and exit.

       -i, --iconic
              Start iconified.

       -m, --maximized
              Start maximized.

       -p n, --panel n
              Force panel view mode to n (n=0 => Tree and one panel, n=1 => One panel, n=2 => Two panels, n=3 => Tree and two panels).

       FOLDER | FILE
              Specifies  a  list  of  folders  or  files  to  open  when  starting  xfe.   They can be regular paths like /home/test, or URIs like
              file:///home/test.  The first two folders are displayed in the file panels, the others are ignored.  The number of files to open  is
              not limited.

SEE ALSO
       xfw(1), xfi(1), xfp(1)

Roland Baudin                                                     3 December 2014                                                           XFE(1)
