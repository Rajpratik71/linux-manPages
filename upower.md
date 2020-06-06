UPOWER(1)                                                                                         upower                                                                                        UPOWER(1)

NAME
       upower - UPower command line tool

SYNOPSIS
       upower [--dump] [--enumerate] [--monitor-detail] [--monitor] [--show-info] [--version] [--wakeups] [--help]

DESCRIPTION
       upower is a simple command line client for the UPower(7) daemon. TODO: not fully documented.

OPTIONS
       --monitor
           Connect to the UPower daemon and print a line every time a power source is added, removed or changed.

       --monitor-detail
           Like --monitor but prints the full details of the power source whenever an event happens.

       --help
           Show help options.

AUTHOR
       Written by David Zeuthen <davidz@redhat.com> with a lot of help from many others.

BUGS
       Please send bug reports to either the distribution or the DeviceKit mailing list, see http://lists.freedesktop.org/mailman/listinfo/devkit-devel on how to subscribe.

SEE ALSO
       upowerd(8), UPower(7),

upower                                                                                          April 2008                                                                                      UPOWER(1)
