SYSTEMD-HWDB(8)                                                                                  systemd-hwdb                                                                                 SYSTEMD-HWDB(8)



NAME
       systemd-hwdb - hardware database management tool

SYNOPSIS
       systemd-hwdb [options] update

       systemd-hwdb [options] query modalias

DESCRIPTION
       systemd-hwdb expects a command and command specific arguments. It manages the binary hardware database.

OPTIONS
       -h, --help
           Print help text.

       --usr
           Generate in /usr/lib/udev instead of /etc/udev.

       -r, --root=PATH
           Alternate root path in the filesystem.

   systemd-hwdb [options] update
       Update the binary database.

   systemd-hwdb [options] query [MODALIAS]
       Query database and print result.

SEE ALSO
       hwdb(7)



systemd 228                                                                                                                                                                                   SYSTEMD-HWDB(8)
