LIGHT-LOCKER-COMMAND(1)                                                          General Commands Manual                                                          LIGHT-LOCKER-COMMAND(1)

NAME
       light-locker-command - controls light-locker

SYNOPSIS
       light-locker-command [OPTION...]

DESCRIPTION
       light-locker-command is a tool for controlling an already running instance of light-locker.  This is done through LightDM which doesn't ensure light-locker is running.

OPTIONS
       -q, --query
              Query the state of the locker

       -t, --time
              Query the length of time the locker has been active

       -l, --lock
              Tells the running locker process to lock the screen immediately

       -a, --activate
              Turn the screensaver on (blank the screen)

       -d, --deactivate
              If the screensaver is active then deactivate it (un-blank the screen)

       -p, --poke
              Poke the running locker to simulate user activity

       -i, --inhibit
              Inhibit the screensaver from activating. Terminate the light-locker-command process to end inhibition.

       -n, --application-name
              The calling application that is inhibiting the screensaver

       -r, --reason
              The reason for inhibiting the screensaver

       -V, --version
              Version of this application

SEE ALSO
       light-locker(1)

The Cavalry                                                                             2014-03-23                                                                LIGHT-LOCKER-COMMAND(1)
