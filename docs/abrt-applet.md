ABRT-APPLET(1)                                                                                   ABRT Manual                                                                                   ABRT-APPLET(1)



NAME
       abrt-applet - Applet which notifies user when new problems are detected by ABRT

SYNOPSIS
       abrt-applet [-v]

DESCRIPTION
       This tool listens on org.freedesktop.problems D-Bus bus and waits for Crash signal. When the tool detects the signal, it notifies user about new problem over a desktop specific notification pop-up.

       At start-up this tool checks for new problems which occurred while the tool was not running and if it finds any of such problem it notifies user over a desktop specific notification pop-up.

OPTIONS
       -v, --verbose
           Be more verbose. Can be given multiple times.

SEE ALSO
       abrt-dbus(8)

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                                   ABRT-APPLET(1)
