STARTXFCE4(1)                                                                         User Commands                                                                         STARTXFCE4(1)

NAME
       startxfce4 - initialize an Xfce session

SYNOPSIS
       startxfce4

DESCRIPTION
       startxfce4 is a script responsible for starting an Xfce session. It runs xinit passing the file specified in the FILES subsection as an argument.

       You may want to modify the default xinitrc file. In order to do that, copy /etc/xdg/xfce4/xinitrc to ~/.config/xfce4/xinitrc and modify that file.

FILES
       ~/.config/xfce4/xinitrc
              User configuration file

       /etc/xdg/xfce4/xinitrc
              System wide configuration file

SEE ALSO
       xfce4-session(1), xinit(1), dbus-launch(1), ssh-agent(1), file:///usr/share/xfce4/doc/C/xfce4-use.html#xfce4-getting-started

COPYRIGHT
       Copyright © 2005 Emanuele Rocca
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

startxfce4                                                                              June 2005                                                                           STARTXFCE4(1)
