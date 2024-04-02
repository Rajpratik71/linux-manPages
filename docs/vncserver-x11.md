vncserver-x11(1)                                                        VNC                                                       vncserver-x11(1)

NAME
       vncserver-x11 - VNC® Server in User Mode

SYNOPSIS
       vncserver-x11 [OPTION...]

       vncserver-x11 [MODE] [OPTION...] COMMAND

DESCRIPTION
       vncserver-x11  starts  VNC  Server  in User Mode, to remote the desktop of the currently-logged on user to connected VNC Viewers. When this
       user is logged out, VNC Server automatically stops; all VNC Viewers are disconnected, and cannot reconnect.

       Run vncserver-x11 to start VNC Server and wait for connections on port 5900, if available. A user interface consisting of a  status  dialog
       and,  if  supported by the window manager, a status icon is displayed, providing connectivity information and convenient access to features
       such as file transfer and chat.

       By default, a VNC Viewer can authenticate to a VNC Server that has:

       · A Professional or Enterprise subscription by supplying the system credentials of the user starting VNC Server.  Specify  the  Permissions
         parameter to widen access to other users or groups.

       · A Home subscription by supplying a password specific to VNC Server; see vncpasswd(1).

       Note  that  an  instance of vncserver-x11 is automatically started (as the root user) by VNC Server in Service Mode; see vncserver-x11-ser‐
       viced(1).

       vncserver-x11 consumes one computer 'desktop' from your subscription, as the user starting it.

COMMANDS
       Applying a command to vncserver-x11 performs an auxiliary operation instead of starting VNC Server.

       To see a list of valid commands, run vncserver-x11 -help.

MODE
       To apply a COMMAND to the privileged instance of vncserver-x11 started by VNC Server in Service Mode, specify -service.

       Otherwise, commands apply automatically to VNC Server in User Mode.

OPTIONS
       Options are parameters, used to configure VNC Server, and also the following:

       -iconnect HOST[::PORT]
              Establishes a reverse connection to a Listening VNC Viewer on HOST at PORT (5500 by default). See vncviewer(1).

       -newinstance
              Starts a new instance of VNC Server, providing your subscription permits; see vnclicense(1).  By default,  running  vncserver-x11  a
              second time interacts with the first instance.

       -showstatus
              Displays the status dialog and status icon. This may be useful to force display in some desktop environments.

       -vncconfigfile FILE
              For  convenience, if you have many parameters to specify at the command line, populate a text file (one parameter per line; omit the
              dash) and reference it using this flag.

       To see a list of valid parameters, run vncserver-x11 -help.

VNC CONFIGURATION FILES
       Parameters can be specified as command line OPTIONS, but preferably in VNC configuration files. VNC configuration files are available for:

       · All programs, or just VNC Server

       · All users of the computer, or just the user starting VNC Server

       · Policy, in order to lock down VNC Server

       When VNC Server starts, parameters are applied in the following order:

       1. System-wide VNC configuration files

       2. Per-user VNC configuration files

       3. Command line OPTIONS

       4. Policy VNC configuration files

       This means that a particular parameter specified at the command line overrides the same parameter specified in a  per-user  or  in  a  sys‐
       tem-wide VNC configuration file, but is itself overridden by the same parameter specified in a policy VNC configuration file. Policy cannot
       be changed by users.

       Note there is a disadvantage to specifying parameters at the command line: parameters cannot be reloaded while VNC Server is  running.  VNC
       configuration files can be reloaded, however, which means that VNC Server can be reconfigured without downtime.

       For a full list of available VNC configuration files, visit https://www.realvnc.com/docs/configure-vnc.html#configure-vnc-files

LOGGING
       By default, vncserver-x11 logs basic activity to file at $HOME/.vnc/vncserver-x11.log.

       To change the log quality, quantity, or destination, specify the Log, LogDir, and LogFile parameters.

SEE ALSO
       vncserver-x11-serviced(1), vnclicense(1), vncinitconfig(1), vncpasswd(1), vncviewer(1)

AUTHOR
       Copyright © 2002-2018 RealVNC Ltd.

       RealVNC  and  VNC  are  trademarks of RealVNC Ltd and are protected by trademark registrations and/or pending trademark applications in the
       European Union, United States of America and other jurisdictions.  Protected by UK patent 2481870; US patent 8760366; EU patent 2652951.

       https://www.realvnc.com

RealVNC Ltd                                                          June 2018                                                    vncserver-x11(1)
