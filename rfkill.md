RFKILL(8)                                                                                System Manager's Manual                                                                                RFKILL(8)

NAME
       rfkill - tool for enabling and disabling wireless devices

SYNOPSIS
       rfkill [options] command

OPTIONS
       --version
              Show the version of rfkill.

COMMANDS
       help   Show rfkill's built-in help text.

       event  Listen for rfkill events and display them on stdout.

       list [type]
              List the current state of all available rfkill-using devices, or just all of the given type.

       block index|type
              Disable the device corresponding to the given index.  type is one of "all", "wifi", "wlan", "bluetooth", "uwb", "ultrawideband", "wimax", "wwan", "gps", "fm" or "nfc".

       unblock index|type
              Enable the device corresponding to the given index. If the device is hard-blocked, e.g. via a hardware switch, it will remain unavailable though it is now soft-unblocked.

AUTHORS
       rfkill was originally written by Johannes Berg <johannes@sipsolutions.net> and Marcel Holtmann <marcel@holtmann.org>.

       This manual page was written by Darren Salt <linux@youmustbejoking.demon.co.uk>, for the Debian project (and may be used by others).

                                                                                              July 10, 2009                                                                                     RFKILL(8)
