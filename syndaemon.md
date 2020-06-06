syndaemon(1)                                                                             General Commands Manual                                                                             syndaemon(1)

NAME
       syndaemon - a program that monitors keyboard activity and disables the touchpad when the keyboard is being used.

SYNOPSIS
       syndaemon [-i idle-time] [-m poll-inverval] [-d] [-p pid-file] [-t] [-k] [-K] [-R]

DESCRIPTION
       Disabling the touchpad while typing avoids unwanted movements of the pointer that could lead to giving focus to the wrong window.

OPTIONS
       -i <idle-time>
              How many seconds to wait after the last key press before enabling the touchpad.  (default is 2.0s).

       -m <poll-interval>
              How  many  milliseconds to wait between two polling intervals. If this value is too low, it will cause unnecessary wake-ups. If this value is too high, some key presses (press and release
              happen between two intervals) may not be noticed. This switch has no effect when running with -R.  Default is 200ms.

       -d     Start as a daemon, ie in the background.

       -p <pid-file>
              Create a pid file with the specified filename.  A pid file will only be created if the program is started in daemon mode.

       -t     Only disable tapping and scrolling, not mouse movements, in response to keyboard activity.

       -k     Ignore modifier keys when monitoring keyboard activity.

       -K     Like -k but also ignore Modifier+Key combos.

       -R     Use the XRecord extension for detecting keyboard activity instead of polling the keyboard state.

       -?     Show the help message.

ENVIRONMENT VARIABLES
       DISPLAY
              Specifies the X server to contact.

EXIT CODES
       If syndaemon exists with a return code other than 0, the error encountered is as below.

       Exit code 1
              Invalid commandline argument.

       Exit code 2
              The connection to the X sever could not be established or no touchpad device could be found.

       Exit code 3
              The fork into daemon mode failed or the pid file could not be created.

       Exit code 4
              XRECORD requested but not available or usable on the server.

CAVEATS
       It doesn't make much sense to connect to a remote X server, because the daemon will then monitor the remote server for keyboard activity, but will disable the touchpad on the local machine.

AUTHORS
       Peter Osterlund <petero2@telia.com>.

       This man page was written by Mattia Dongili <malattia@debian.org>

SEE ALSO
       Xorg(1), synclient(1), synaptics(4)

X Version 11                                                                            xf86-input-synaptics 1.8.2                                                                           syndaemon(1)
