vncviewer(1)                                      VNC                                     vncviewer(1)

NAME
       vncviewer - VNC® Viewer

SYNOPSIS
       vncviewer [OPTION...] [HOST][:DISPLAY]

       vncviewer [OPTION...] -listen [PORT]

DESCRIPTION
       vncviewer is a VNC Viewer (client). It can connect to any computer running a protocol-compliant
       VNC Server, displaying the remote desktop for the user to control.

       Run vncviewer to start VNC Viewer and show an address book listing available computers to  con‐
       nect to, or to allow the user to enter identifying information for a new computer.

       Run vncviewer and specify a HOST and DISPLAY to start VNC Viewer and simultaneously establish a
       direct connection to a particular computer, for example vncviewer snoopy:2 to connect to a com‐
       puter  'snoopy' on display number 2 (equivalent to port 5902). Note either the hostname or dis‐
       play number can be omitted, so for example vncviewer :1 connects to display number 1 on  local‐
       host (port 5901), and vncviewer snoopy connects to display 0 on 'snoopy' (port 5900).

       Run  vncviewer -useaddressbook snoopy:2 to establish a direct connection to 'snoopy' and either
       add it to the address book (if new) or apply stored settings (if connected to before).

       Run vncviewer -listen to start VNC Viewer listening for a reverse direct connection from a  VNC
       Server, on port 5500 by default.

OPTIONS
       Options are parameters, used to configure VNC Viewer, and also the following:

       -config FILE.vnc
              Loads  the parameters and connection information (such as HOST and password) stored in a
              .vnc file.

              To see a list of valid parameters, run vncviewer -help.

VNC CONFIGURATION FILES
       Parameters can be specified as command line OPTIONS, but preferably in VNC configuration files.
       VNC configuration files are available for:

       • All programs, or just VNC Viewer

       • All users of the computer, or just the user starting VNC Viewer

       • Policy, in order to lock down VNC Viewer

       When VNC Viewer starts, parameters are applied in the following order:

       1. System-wide VNC configuration files

       2. Per-user VNC configuration files

       3. Command line OPTIONS

       4. Policy VNC configuration files

       This means that a particular parameter specified at the command line overrides the same parame‐
       ter specified in a per-user or in a system-wide VNC configuration file, but is itself  overrid‐
       den  by  the  same  parameter  specified  in  a policy VNC configuration file. Policy cannot be
       changed by users.

       For     a     full     list     of     available     VNC     configuration     files,     visit
       https://www.realvnc.com/docs/configure-vnc.html#configure-vnc-files

LOGGING
       By default, vncviewer logs basic activity to the standard error stream.

       To  change  the log quality, quantity, or destination, specify the Log, LogDir, and LogFile pa‐
       rameters.

SEE ALSO
       vncserver-x11(1), vncserver-virtual(1), vncserver-x11-serviced(1)

AUTHOR
       Copyright © 2002-2018 RealVNC Ltd.

       RealVNC and VNC are trademarks of RealVNC Ltd and  are  protected  by  trademark  registrations
       and/or pending trademark applications in the European Union, United States of America and other
       jurisdictions.  Protected by UK patent 2481870; US patent 8760366; EU patent 2652951.

       https://www.realvnc.com

RealVNC Ltd                                    June 2018                                  vncviewer(1)
