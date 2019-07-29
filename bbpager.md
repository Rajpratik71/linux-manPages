BBPAGER(1)                                                            bbpager                                                           BBPAGER(1)

NAME
       bbpager - pager for the Blackbox window manager

SYNOPSIS
       bbpager

DESCRIPTION
       bbpager is a pager for Blackbox and all other Blackbox-compatible Window Managers.

       bbpager supports colors and gradients changing, moving windows (also to other desktop), and optional placement in the Blackbox slit.

       It's also possible to define how the desktops are displayed, by defining the number of rows or columns to use.

CONFIGURATION
       By  default  bbpager reads the Blackbox style-file as defined in ~/.blackboxrc and copies as much of the style as possible. See blackbox(1)
       for further information.

       If the resource bbpager.autoConfig is turned true, the tool will periodically check the main config files, ~/.blackboxrc for Blackbox users
       and bbpager.nobb for other WM's to see if they have changed. If so bbpager will reconfigure itself accordingly.

FILES
       The location of bbpager's configuration files is as follows:

       /etc/bbtools/bbpager.rc the global configuration file

       $HOME/.bbtools/bbpager.rc the local configuration file

AUTHOR
       This  manual  page  was written by Emanuele Rocca <emarocca@libero.it>, for the Debian GNU/Linux system (but may be used by others). It was
       updated by Kevin Coyner <kcoyner@debian.org> in February 2007.

SEE ALSO
       blackbox(1), fluxbox(1), bbkeys(1).

bbtools                                                             March 2003                                                          BBPAGER(1)
