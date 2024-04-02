xkbctrl(1)                                                                                    Utils for X-Window                                                                                   xkbctrl(1)



NAME
       xkbctrl - get X11 keyboard data according to console keyboard mapname


SYNOPSIS
       xkbctrl [ options ]


DESCRIPTION
       xkbctrl  is  used  to  obtain  the  X11  keyboard  configuration  parameters according to a given console map name. The currently used console map is stored in the KEYTABLE variable within the file:
       /etc/sysconfig/keyboard


COMMAND LINE OPTIONS
       The one and only argument is the name of the console map but this argument is required. If the map does not exist an empty set of X11 variables is printed out.


XKB KEYBOARD SPECIFICATION
       XkbLayout
              The language dependent keyboard layout specification.

       XkbModel
              The hardware keyboard type specification.

       Protocol
              The protocol used for communication.

       XkbRules
              The XKB rules file.

       XkbOptions
              Special XKB options for key-remappings

       MapName
              The console map name.

       XkbKeyCodes
              The XKB keycodes file.

       LeftAlt
              The behaviour of the left alt key.

       RightAlt
              The behaviour of the right alt key.

       ScrollLock
              The behaviour of the scroll lock key.

       RightCtl
              The behaviour of the right ctrl key.

       Apply  The apply string used for the xkbset call.


AUTHORS
       Written by Marcus Schäfer


REPORTING BUGS
       Report bugs to <bugzilla.novell.com>.


COPYRIGHT
       Copyright © 2005 SuSE Linux Products GmbH, Inc.  This is free software; see the source for copying conditions.  There is NO  warranty;  not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR  PUR-
       POSE.



3rd Berkeley Distribution                                                                       March 15, 2005                                                                                     xkbctrl(1)
