vncserver-virtual(1)                                                    VNC                                                   vncserver-virtual(1)

NAME
       vncserver-virtual - VNC® Server in Virtual Mode

SYNOPSIS
       vncserver-virtual [OPTION...] [:DISPLAY]

       vncserver-virtual [OPTION...] COMMAND

DESCRIPTION
       vncserver-virtual  starts  VNC  Server  in  Virtual  Mode,  to create a virtual desktop and provide a dedicated workspace for connected VNC
       Viewer(s). A virtual desktop persists until VNC Server is explicitly stopped, even if the user starting it is logged out, or all VNC  View‐
       ers  disconnect.  It  is entirely independent of the console of the host computer; neither the desktop of the currently logged on user, nor
       the login screen, are available to connected VNC Viewers.

       By default, a VNC Viewer can authenticate to a VNC Server that has:

       · A Professional or Enterprise subscription by supplying the system credentials of the user starting VNC Server.  Specify  the  Permissions
         parameter to widen access to other users or groups.

       · A Home subscription by supplying a password specific to VNC Server; see vncpasswd(1).

       Note  that,  by default, vncserver-virtual is the recommended interface to Xvnc. vncserver-virtual passes all COMMANDS and OPTIONS to Xvnc,
       and in addition runs a default desktop environment, handles logging, and prompts for a password if the VNC password  authentication  scheme
       is  chosen.  Note  there  may be circumstances in which you need to interact with Xvnc directly; see Xvnc(1). Note also that vncserver is a
       symlink to vncserver-virtual.

       Run vncserver-virtual to start VNC Server and create a virtual desktop on the first available display, for example 1. By  convention,  this
       equates  to  a  port number of 5900 + DISPLAY, so in this case port 5901. Note that no user interface is available for you to work with VNC
       Server; specify OPTIONS to configure VNC Server before it starts. Run vncserver-virtual :DISPLAY to start VNC Server on the specified  dis‐
       play, if it is available.

       Note that as an alternative VNC Server can be started automatically to create virtual desktops on demand; see vncserver-virtuald(1).

       vncserver-virtual consumes one computer 'desktop' from your subscription, as the user starting it.

COMMANDS
       Applying one of the following commands to vncserver-virtual performs an auxiliary operation instead of starting VNC Server:

       -clean Deletes any /tmp/.X11-unix directory and /tmp/.X<num> files that may persist if VNC Server is stopped abruptly.

       -help  Shows a help summary.

       -kill :DISPLAY
              Stops VNC Server, disconnecting all VNC Viewers, and destroying the virtual desktop on DISPLAY.

       -list  Shows a list of OPTIONS.

       -test  Test mode. The environment and any OPTIONS are tested, and the expected command is printed rather than executed. For example:

                 vncserver-virtual -test :1 -config=/my/Xvnc/options

              verifies  that  display 1 is available, checks that the /my/Xvnc/options file contains only valid Xvnc options in the correct format
              for the X server, prints the command, and exits.

       Note that other commands are available to perform operations on existing virtual desktops, but these must be applied to Xvnc; see Xvnc(1).

OPTIONS
       Options can be any combination of the following:

       · Parameters, used to configure VNC Server. Run vncserver-virtual -list and examine the output at the bottom.  Note  it  is  preferable  to
         specify parameters in VNC configuration files.

       · Xvnc  options, used to configure the built-in X server. Run vncserver-virtual -list and examine the output at the top, and see Xserver(1)
         for more information on shared options. Note it may be more convenient to specify Xvnc options in Xvnc configuration files.

       · The following additional Xvnc options, which may also be specified in Xvnc configuration files:

         -blackpixel N
                Specifies the pixel value for black.

         -config FILE
                Loads Xvnc options from FILE (one per line, in the format expected by the X server) instead of those in $HOME/.vnc/config.

         -depth D
                Specifies the pixel depth in bits of the virtual desktop. The default is 16; alternatives are 8, 15, and 24.

         -geometry WxH
                Specifies the size of the virtual desktop. The default is 1024x768.

         -iconnect HOST[::PORT]
                Establishes a reverse connection to a Listening VNC Viewer on HOST at PORT (5500 by default). See vncviewer(1).

         -linebias N
                Adjusts thin line pixelization.

         -pixdepths list-of-int
                Supports the given list of pixmap depths.

         -pixelformat FMT
                Specifies the pixel format (RGBnnn or BGRnnn). The default for depth 8 is to use a colormap (palette); the default for depth 16 is
                RGB565 and for depth 24, RGB888.

         -screen N WxHxD [XxY]
                Sets the width, height, depth, and origin of screen N.

         -showstatus
                Causes the VNC Server status dialog to be displayed to connected VNC Viewers (the dialog is hidden by default).

         -vncconfigfile FILE
                For  convenience,  if  you have many parameters to specify at the command line, populate a text file (one parameter per line; omit
                the dash) and reference it using this flag.

         -whitepixel N
                Specifies the pixel value for white.

       · The following special options, which must NOT be specified in Xvnc configuration files:

         -config FILE
                Loads Xvnc options from FILE (one per line, in the format expected by the X server) instead of those in $HOME/.vnc/config.

         -nocheckpasswd
                Does not prompt for a password if the VNC password authentication scheme is chosen.

VNC CONFIGURATION FILES
       Parameters can be specified as command line OPTIONS, but preferably in VNC configuration files. VNC configuration files are available for:

       · All programs, or just VNC Server

       · All users of the computer, or just the user starting VNC Server

       · Policy, in order to lock down VNC Server (Enterprise subscription required)

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

XVNC CONFIGURATION FILES
       Xvnc options can be specified as command line OPTIONS, or in Xvnc configuration files:

       · To specify Xvnc options for all users of the computer, create /etc/vnc/config.custom.

       · To specify Xvnc options for a particular user, create $HOME/.vnc/config (though see also the -config flag).

       For more information, see https://www.realvnc.com/docs/configure-xvnc.html

       Note if you specify the same Xvnc option in multiple locations there is no guarantee which will actually take effect.

X STARTUP SCRIPT
       By default, vncserver-virtual runs /etc/vnc/xstartup to select a desktop environment for the virtual desktop. You may want to choose a dif‐
       ferent desktop environment, or run particular applications:

       · To make changes for all users of the computer, create /etc/vnc/xstartup.custom. If this file exists, the default script is not run.

       · To make changes for a particular user, create $HOME/.vnc/xstartup.  If this file exists, no system-wide script is run for that user.

SUPPORTED DESKTOP ENVIRONMENTS
       The Xorg server built-in to VNC Server may have different capabilities to the system Xorg server; most notably, hardware acceleration might
       not be available. For this reason, some desktop environments (particularly those with a reliance on graphical effects) may not work.

       For  a  better  user  experience out-of-the-box on some distributions (particularly Red Hat), run vncserver-virtual in conjunction with the
       system Xorg server. More desktop environments and applications will likely be compatible. For more information on this  alternative  imple‐
       mentation, see https://support.realvnc.com/knowledgebase/article/View/546

ADDITIONAL FILES
       vncserver-virtual  creates  $HOME/.vnc/HOST:DISPLAY.pid,  containing  the  process ID of the virtual desktop. This file is required for the
       -kill command.

LOGGING
       By default, vncserver-virtual logs basic activity to Standard Error, and automatically redirects it to file at $HOME/.vnc/HOST:DISPLAY.log.
       The log output of any applications in the X startup script is also included.

       To change the log quality, quantity, or destination, specify the Log, LogDir, and LogFile parameters.

SEE ALSO
       Xvnc(1), vncserver-virtuald(1), vnclicense(1), vncinitconfig(1), vncpasswd(1), vncviewer(1)

AUTHOR
       Copyright © 2002-2018 RealVNC Ltd.

       RealVNC  and  VNC  are  trademarks of RealVNC Ltd and are protected by trademark registrations and/or pending trademark applications in the
       European Union, United States of America and other jurisdictions.  Protected by UK patent 2481870; US patent 8760366; EU patent 2652951.

       https://www.realvnc.com

RealVNC Ltd                                                          June 2018                                                vncserver-virtual(1)
