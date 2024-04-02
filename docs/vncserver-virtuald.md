vncserver-virtuald(1)                                                   VNC                                                  vncserver-virtuald(1)

NAME
       vncserver-virtuald - VNC® Server in Virtual Mode daemon

SYNOPSIS
       vncserver-virtuald [OPTION...] [COMMAND]

DESCRIPTION
       vncserver-virtuald  is  a  daemon  that  starts VNC Server in Virtual Mode for each VNC Viewer that connects, to create virtual desktops on
       demand. The daemon can be started manually, but is designed to be started automatically at system boot time; see Starting the daemon.  Note
       that an Enterprise subscription is required.

       By  default, the daemon listens for connections on port 5999; specify the DaemonPort parameter to choose a different port. Also by default,
       a VNC Viewer can connect by supplying the credentials of any user able to log on to the computer (the daemon  mandates  system  authentica‐
       tion); specify the Permissions parameter to restrict access to particular users or groups.

       For  each  successfully-authenticating  VNC Viewer, the daemon runs vncserver-virtual; see vncserver-virtual(1).  The daemon then transfers
       the connection to the newly-created virtual desktop and consumes one computer 'desktop' from your subscription, as that  user.  The  daemon
       itself does not consume a desktop.

       By default, when a VNC Viewer disconnects, their virtual desktop is destroyed and your subscription is incremented by one desktop. If a VNC
       Viewer reconnects using the same credentials, a new virtual desktop is created; a session does not persist.  To  change  this  and  persist
       sessions, apply the ConnectToExisting parameter.

COMMANDS
       Applying a command to vncserver-virtuald performs an auxiliary operation instead of starting the daemon.

       To see a list of valid commands, run vncserver-virtuald -help.

OPTIONS
       Options are parameters, used to configure the daemon, and also the following:

       -fg    Runs in the foreground (not as a daemon), which may be useful for troubleshooting.

       To  see  a list of valid parameters, run vncserver-virtuald -help. To specify a parameter as a command line option, apply it to the command
       executing the binary in the appropriate init script; see Starting the daemon.

VNC CONFIGURATION FILES
       Parameters can be specified as command line OPTIONS, but preferably in VNC configuration files. VNC configuration files are available for:

       · All programs, or just the daemon

       · All users of the computer, or just the root user

       · Policy, in order to lock down the daemon

       When the daemon starts, parameters are applied in the following order:

       1. System-wide VNC configuration files

       2. Per-user VNC configuration files

       3. Command line OPTIONS

       4. Policy VNC configuration files

       This means that a particular parameter specified at the command line overrides the same parameter specified in a  per-user  or  in  a  sys‐
       tem-wide VNC configuration file, but is itself overridden by the same parameter specified in a policy VNC configuration file. Policy cannot
       be changed by users.

       Note there is a disadvantage to specifying parameters at the command line: parameters cannot be reloaded while the daemon is  running.  VNC
       configuration files can be reloaded, however, which means that the daemon can be reconfigured without downtime.

       For  a  list  of  the  VNC configuration files available for the daemon, and for detailed explanations of individual parameters, start with
       https://www.realvnc.com/docs/configure-vnc.html#configure-vnc-files

       Note that an equivalent set of VNC configuration files is available for each instance of vncserver-virtual started by the daemon.  To  con‐
       figure  activities related to a particular session, edit VNC configuration files for Xvnc owned by the appropriate user; see vncserver-vir‐
       tual(1).

STARTING THE DAEMON
       A suitable init script should have been installed with VNC Server; see vncinitconfig(1). To start the daemon manually:

       · For a Linux distribution using Xsystemd, run systemctl start vncserver-virtuald.service

       · For a Linux distribution using Xinit.d, run /etc/init.d/vncserver-virtuald start

       · For a Debian-compatible Linux distribution using Xinit.d, (alternatively) run service vncserver-virtuald start

       To start the daemon automatically at system boot time, use the appropriate configuration tool for your system:

       · For a Linux distribution using Xsystemd, run systemctl enable vncserver-virtuald.service

       · For a Debian-compatible Linux distribution using Xinit.d, run update-rc.d vncserver-virtuald defaults

       · For a Red Hat-compatible Linux distribution using Xinit.d, run chkconfig --add vncserver-virtuald

LOGGING
       By default, vncserver-virtuald logs basic activity to the syslog DAEMON facility.

       To change the log quality, quantity, or destination, specify the Log, LogDir, and LogFile parameters.

SEE ALSO
       vncserver-virtual(1), vnclicense(1), vncinitconfig(1), vncpasswd(1), vncviewer(1)

AUTHOR
       Copyright © 2002-2018 RealVNC Ltd.

       RealVNC and VNC are trademarks of RealVNC Ltd and are protected by trademark registrations and/or pending  trademark  applications  in  the
       European Union, United States of America and other jurisdictions.  Protected by UK patent 2481870; US patent 8760366; EU patent 2652951.

       https://www.realvnc.com

RealVNC Ltd                                                          June 2018                                               vncserver-virtuald(1)
