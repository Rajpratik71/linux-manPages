WPA_GUI(8)                                                                                                                              WPA_GUI(8)

NAME
       wpa_gui - WPA Graphical User Interface

SYNOPSIS
       wpa_gui [ -p path to ctrl sockets ] [ -i ifname ] [ -t ]

OVERVIEW
       wpa_gui  is  a  QT graphical frontend program for interacting with wpa_supplicant. It is used to query current status, change configuration
       and request interactive user input.

       wpa_gui supports (almost) all of the interactive status and configuration features of the  command  line  client,  wpa_cli.  Refer  to  the
       wpa_cli manpage for a comprehensive list of the interactive mode features.

COMMAND ARGUMENTS
       -p path
              Change the path where control sockets should be found.

       -i ifname
              Specify  the  interface  that  is being configured. By default, choose the first interface found with a control socket in the socket
              path.

       -t     Start program in the system tray only (if the window manager supports it). By default the main status window is shown.

SEE ALSO
       wpa_cli(8) wpa_supplicant(8)

LEGAL
       wpa_supplicant is copyright (c) 2003-2015, Jouni Malinen <j@w1.fi> and contributors.  All Rights Reserved.

       This program is licensed under the BSD license (the one with advertisement clause removed).

                                                                 06 December 2016                                                       WPA_GUI(8)
