xfce4-session-logout(1)                                                          General Commands Manual                                                          xfce4-session-logout(1)

NAME
       xfce4-session-logout - Logs out from Xfce

SYNOPSIS
       xfce4-session-logout

DESCRIPTION
       This manual page documents briefly the xfce4-session-logout command.

       The  xfce4-session-logout  command allows you to programmatically logout from your Xfce session. It requests the session manager to display the logout confirmation screen, or, if
       given one of the command-line options below, causes the session manager to take the requested action immediately.

OPTIONS
       xfce4-session-logout takes the following command line options:

       --logout
              Log out without displaying the logout dialog.

       --halt Halt without displaing the logout dialog.

       --reboot
              Reboot without displaying the logout dialog.

       --suspend
              Suspend without displaying the logout dialog.

       --hibernate
              Hibernate without displaying the logout dialog.

       --fast Do a fast shutdown.  This instructs the session manager not to save the session, but instead to quit everything quickly.

       --help Print a help screen and exit.

       --version
              Output version information and exit.

AUTHOR
       xfce4-session-logout and this manual page were written by Brian Tarricone <kelnos@xfce.org> and Benedikt Meurer <benny@xfce.org> as part of the Xfce project.

REPORTING BUGS
       Report bugs to http://bugzilla.xfce.org/.

COPYRIGHT
       Copyright © 2004 Benedikt Meurer.
       Copyright © 2008 Brian Tarricone.

                                                                                       Oct 7, 2008                                                                xfce4-session-logout(1)
