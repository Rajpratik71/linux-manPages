ABRT-DBUS(8)                                                                                     ABRT Manual                                                                                     ABRT-DBUS(8)



NAME
       abrt-dbus - dbus server for querying problem data

SYNOPSIS
       abrt-dbus [-v[v]...] [-t NUM]

DESCRIPTION
       abrt-dbus allows other programs to operate on problem data directories over D-Bus.

       Normally abrt-dbus is started by D-Bus daemon on demand, and terminates after a timeout.

OPTIONS
       -v
           Log more detailed debugging information.

       -t NUM
           Exit after NUM seconds of inactivity.

AUTHORS
       ·   ABRT team

SEE ALSO
       abrt.conf(5)



abrt 2.1.11                                                                                       08/12/2019                                                                                     ABRT-DBUS(8)
