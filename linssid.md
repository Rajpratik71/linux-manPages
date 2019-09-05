linssid(1)                                                  graphical wireless scanner                                                  linssid(1)

NAME
       linssid - graphical wireless scanner

DESCRIPTION
       LinSSID runs over X Window and displays locally receivable 802.11 wireless attach points and ad hoc networks.

       A  table  is  displayed  with  various  parameters such as MAC address, channel, and signal strength. Graphs are also displayed with signal
       strength by channel and signal strength over time.

       LinSSID is graphically and functionally similar to inSSIDer (for Microsoft Windows) and Wifi Analyzer (for Android).

       LinSSID can be used to measure the local performance or to search for an interference free channel to be set in a wireless  router  (access
       point).  The wireless established link won't be affected by these operations because LinSSID needn't set the monitor mode in network inter‐
       face.

CONFIGURATION
       The wireless tools that LinSSID uses require root privilege to access. You can use the gksudo program to run LinSSID from an ordinary  user
       in X or run directly as root.

       To use as normal user, you will need setup the SUDO system and call the gksudo program.  To configure the SUDO (/etc/sudoers file), use the
       visudo command as root (do not edit the /etc/sudoers file directly! visudo will perform syntax checks before  write  the  final  configura‐
       tion):

           # visudo

       If needed, you can set a preferred editor using the EDITOR environment variable:

           # EDITOR=mcedit visudo

       The  next step is grant access as root to linssid. Considering a ordinary user called eriberto, you will need add the following line at end
       of file:

           eriberto  ALL = /usr/bin/linssid

       To start LinSSID, via command line, use:

           $ gksudo linssid

       To start in X Window, click over the icon created in desktop menu. Note that this icon will execute the 'gksudo linssid' command. So,  will
       you need the /etc/sudoers well configured to get success.

       The  other  way  to  run  LinSSID is to launch it from a root account or with su or sudo. To run directly as root, you will need to use the
       xhost command to grant to root the necessary permission to use the X environment.

SEE ALSO
       gksu(1), sudo(8), visudo(8), xhost(1)

AUTHOR
       The LinSSID was written by Warren Severin <wseverin@warsev.com>.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

LINSSID 2.7                                                          Feb 2015                                                           linssid(1)
