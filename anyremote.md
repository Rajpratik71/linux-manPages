anyRemote(1)                                                  General Commands Manual                                                 anyRemote(1)

NAME
       anyremote - control PC with Bluetooth/Wi-Fi cell phone

SYNOPSIS
       anyremote [-f file] [-s peer[,peer ...]] [-log] [-a]

                 [-fe port] [-u username] [-name SDP service name] [-password]

       anyremote -h|-v

DESCRIPTION
       anyRemote is remote control software for applications using Bluetooth or WiFi.

       It supports wide range of modern cell phones like Nokia, HTC, SonyEricsson, Motorola and others.

       anyRemote was developed as thin "communication" layer between device with Bluetooth or WiFi support (which can be cell phone or tablet com‐
       puter) and Linux PC.

       In theory anyRemote could be configured to manage almost any kind of software.

       anyRemote is console application, but in addition there are GUI frontends for Gnome and KDE.

OPTIONS
   -h
       print short help and exit

   -v
       print version number and exit

   -f /path/to/configuration/file
       By default anyremote will try to find and use $HOME/.anyremote.cfg, then ./.anyremote.cfg. It is possible  to  specify  configuration  file
       directly with -f option.

   -s peer[,peer ...]
       where peer can be one of:

            bluetooth:_channel_ (Server mode - bluetooth connection)

            tcp:_port_         (Server mode - TCP/IP connection)

            web:_port_         (Server mode - Web interface)

            cmxml:_port_       (Server mode - XML services interface)

            local:/dev/ircommX  (Server mode - IR connection)

            rfcomm:XX:XX:XX:XX:XX:XX:CC (AT mode - bluetooth connection,

                 where XX:XX:XX:XX:XX:XX is bluetooth device address and

                 CC is channel number - integer from 1 to 32)

            /dev/ttyACM#       (AT mode - cable connection)

            /dev/ircomm#       (AT mode - IR connection)

            ilirc:_AF_LOCAL socket file_ (use with inputlircd)

            stdin

            avahi - register SDP service using Avahi

       Default peer value is bluetooth:19,tcp:5197,web:5080

       It is possible to specify several peers for Server mode configuration files only.

       It is possible to specify only single peer of web: or cmxml: type.

   -log
       print verbose logging information to $HOME/.anyRemote/anyremote.log

   -a
       reconnect automatically in case of connection failure, used only in AT mode

   -fe _port_
       Work as backend for GUI frontend. Use specified port to connect to frontend.

   -name SDP_service_name
       if bluetooth or TCP/IP connection is used, allows one to specify SDP service name.

       Default value for SDP service name is "anyRemote"

   -password
       If this option is specified, then anyRemote will ask the client for the password.

       Password phrase should be stored in $HOME/.anyRemote/password file in a plain text.

   -u|--user _username_
       if started from root, allows one to set effective user ID to specified user

AUTHORS
       Mikhail Fedotov anyremote@mail.ru

       http://anyremote.sf.net

BUGS
       If you find any bugs, please report to anyremote@mail.ru

LICENCE
       This    is   free   software.   You   may   redistribute   copies   of   it   under   the   terms   of   the  GNU  General  Public  License
       http://www.gnu.org/licenses/gpl.html. There is NO WARRANTY, to the extent permitted by law.

                                                                 December  8, 2014                                                    anyRemote(1)
