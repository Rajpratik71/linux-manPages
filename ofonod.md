ofonod(8)                                                     System Manager's Manual                                                    ofonod(8)

NAME
       ofonod - oFono mobile telephony daemon

SYNOPSIS
       ofonod [options]

DESCRIPTION
       ofonod is a daemon which provides an oFono stack for interfacing mobile telephony devices.  oFono is controlled through D-Bus; for example,
       one can tell ofonod to send AT commands over /dev/rfcomm0  by  calling  the  D-Bus  method  org.ofono.at.Manager.Create.   /etc/dbus-1/sys‐
       tem.d/ofono.conf is used to manage D-Bus permissions for oFono.

OPTIONS
       --debug, -d
              Enable  debug information output. Note multiple arguments to -d can be specified, colon, comma or space separated. The arguments are
              relative source code filenames for which debugging output should be enabled; output shell-style globs  are  accepted  (e.g.:  "plug‐
              ins/*:src/main.c").

       --nodetach, -n
              Don't run as daemon in background.

       SEE ALSO

       dbus-send(1)

FILES
       /etc/dbus-1/system.d/ofono.conf

AUTHOR
       This man page was written by Andres Salomon <dilinger@collabora.co.uk>.

                                                                     Jul 2009                                                            ofonod(8)
