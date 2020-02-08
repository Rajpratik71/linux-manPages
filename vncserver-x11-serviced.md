vncserver-x11-serviced(1)                         VNC                        vncserver-x11-serviced(1)

NAME
       vncserver-x11-serviced - VNC® Server in Service Mode

SYNOPSIS
       vncserver-x11-serviced [OPTION...] [COMMAND]

DESCRIPTION
       vncserver-x11-serviced  is  a daemon that starts VNC Server in Service Mode, to remote the con‐
       sole of a computer to connected VNC Viewers for as long as the daemon runs.  This  may  be  the
       desktop  of  the  currently logged-on user, or else the login screen. The daemon can be started
       manually, but is designed to be started automatically at system boot  time;  see  Starting  the
       daemon. Note that the daemon survives a restart of the X server.

       When  the  daemon  starts,  it  immediately  runs  vncserver-x11  as  the  root  user; see vnc‐
       server-x11(1). This means that to work with VNC Server in Service Mode  you  actually  interact
       with a privileged instance of VNC Server in User Mode; see VNC configuration files.

       By default, a VNC Viewer can authenticate to a VNC Server that has:

       • A  Professional  or Enterprise subscription by supplying the system credentials of either the
         root user or of a member of the admin, sudo (Ubuntu) or wheel (Red Hat) groups.  Specify  the
         Permissions parameter to widen or restrict access to other users or groups.

       • A Home subscription by supplying a password specific to VNC Server; see vncpasswd(1).

       Note that vncserver-x11-serviced consumes one computer 'desktop' from your subscription, as the
       root user.

COMMANDS
       Applying a command to vncserver-x11-serviced performs an auxiliary operation instead of  start‐
       ing the daemon.

       To see a list of valid commands, run vncserver-x11-serviced -help.

OPTIONS
       -fg    Runs in the foreground (not as a daemon), which may be useful for troubleshooting.

VNC CONFIGURATION FILES
       To  configure  VNC Server in Service Mode, specify parameters for the instance of vncserver-x11
       owned by the root user. See vncserver-x11(1) for more information.

USER INTERFACE
       Under some window managers, VNC Server is unable to determine the identity of the current desk‐
       top  owner, and consequently the VNC Server user interface (a status dialog and icon) cannot be
       automatically displayed. If this is the case, run the following command (as the desktop  owner,
       not as root):

          vncserverui -serviceui

       It  may  be  convenient to include this in a user's .xsession file (or appropriate startup file
       for the desktop environment).

STARTING THE DAEMON
       A suitable init script should have been installed with VNC  Server;  see  vncinitconfig(1).  To
       start the daemon manually:

       • For a Linux distribution using Xsystemd, run systemctl start vncserver-x11-serviced.service

       • For a Linux distribution using Xinit.d, run /etc/init.d/vncserver-x11-serviced start

       • For  a  Debian-compatible  Linux distribution using Xinit.d, (alternatively) run service vnc‐
         server-x11-serviced start

       To start the daemon automatically at system boot time, use the appropriate  configuration  tool
       for your system:

       • For a Linux distribution using Xsystemd, run systemctl enable vncserver-x11-serviced.service

       • For  a Debian-compatible Linux distribution using Xinit.d, run update-rc.d vncserver-x11-ser‐
         viced defaults

       • For a  Red  Hat-compatible  Linux  distribution  using  Xinit.d,  run  chkconfig  --add  vnc‐
         server-x11-serviced

LOGGING
       See vncserver-x11(1).

       To  change  the log quality, quantity, or destination, specify the Log, LogDir, and LogFile pa‐
       rameters.

SEE ALSO
       vncserver-x11(1), vnclicense(1), vncinitconfig(1), vncpasswd(1), vncviewer(1)

AUTHOR
       Copyright © 2002-2018 RealVNC Ltd.

       RealVNC and VNC are trademarks of RealVNC Ltd and  are  protected  by  trademark  registrations
       and/or pending trademark applications in the European Union, United States of America and other
       jurisdictions.  Protected by UK patent 2481870; US patent 8760366; EU patent 2652951.

       https://www.realvnc.com

RealVNC Ltd                                    June 2018                     vncserver-x11-serviced(1)
