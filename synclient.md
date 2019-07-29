synclient(1)                                                  General Commands Manual                                                 synclient(1)

NAME
       synclient - commandline utility to query and modify Synaptics driver options.

SYNOPSIS
       synclient [-lV?] [var1=value1 [var2=value2] ...]

DESCRIPTION
       This program lets you change your Synaptics TouchPad driver for XOrg/XFree86 server parameters while X is running.

OPTIONS
       -l     List current user settings. This is the default if no option is given.

       -V     Print version number and exit.

       -?     Show the help message.

       var=value
              Set user parameter var to value.

FILES
       /etc/X11/xorg.conf

EXAMPLES
       To disable EdgeMotionMinSpeed:

       synclient EdgeMotionMinSpeed=0

AUTHORS
       Peter Osterlund <petero2@telia.com> and many others.

       This man page was written by Mattia Dongili <malattia@debian.org>

SEE ALSO
       Xorg(1), syndaemon(1), synaptics(4)

X Version 11                                                xf86-input-synaptics 1.8.2                                                synclient(1)
