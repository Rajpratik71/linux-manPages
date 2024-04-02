tuned(8)                                                                                Adaptive system tuning daemon                                                                                tuned(8)



NAME
       tuned - dynamic adaptive system tuning daemon

SYNOPSIS
       tuned [options]

DESCRIPTION
       tuned is a dynamic adaptive system tuning daemon that tunes system settings dynamically depending on usage.


OPTIONS
       -d, --daemon
                   This options starts tuned as a daemon as opposed to in the foreground without forking at startup.

       -D, --debug Sets the highest logging level. This could be very useful when having trouble with tuned.

       -h, --help  Show this help.

       -l [LOG], --log[=LOG]
                   Log to the file LOG. If no LOG file is specified /var/log/tuned/tuned.log is used.

       --no-dbus   Do not attach to DBus.

       -P [PID], --pid[=PID]
                   Write process ID to the PID file. If no PID file is specified /run/tuned/tuned.pid is used.

       -p PROFILE, --profile PROFILE
                   Tunning profile to be activated. It will override other settings (e.g. from tuned-adm).  This is intended for debugging purposes.

       -v, --version
                   Show version information.

FILES
       /etc/tuned
       /usr/share/doc/tuned/README

SEE ALSO
       tuned.conf(5) tuned-adm(8)

AUTHOR
       Jan Kaluža <jkaluza@redhat.com>
       Jan Včelák <jvcelak@redhat.com>
       Jaroslav Škarvada <jskarvad@redhat.com>
       Phil Knirsch <pknirsch@redhat.com>

REPORTING BUGS
       Report bugs to https://bugzilla.redhat.com/.



Fedora Power Management SIG                                                                      28 Mar 2012                                                                                         tuned(8)
