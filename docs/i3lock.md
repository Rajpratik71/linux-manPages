
i3lock(1)                                                          User Manuals                                                          i3lock(1)

NAME
       i3lock - improved screen locker

SYNOPSIS
       i3lock [-v] [-n] [-b] [-d] [-i image.png] [-c color] [-t] [-p pointer] [-u] [-e] [-I] [-f]

DESCRIPTION
       i3lock is a simple screen locker like slock. After starting it, you will see a white screen (you can configure the color/an image). You can
       return to your screen by entering your password.

IMPROVEMENTS
       · i3lock forks, so you can combine it with an alias to suspend to RAM (run "i3lock && echo mem > /sys/power/state" to get a  locked  screen
         after waking up your computer from suspend to RAM)

       · You can specify either a background color or a PNG image which will be displayed while your screen is locked.

       · You can specify whether i3lock should bell upon a wrong password.

       · i3lock uses PAM and therefore is compatible with LDAP, etc.

OPTIONS
       -v, --version
              Display the version of your i3lock

       -n, --nofork
              Don't fork after starting.

       -b, --beep
              Enable beeping. Be sure to not do this when you are about to annoy other people, like when opening your laptop in a boring lecture.

       -d, --dpms
              Enable  turning  off your screen using DPMS. Note that, when you do not specify this option, DPMS will turn off your screen after 15
              minutes of inactivity anyways (if you did not disable this in your X server).

       -I, --inactivity-timeout
              Specifies the number of seconds i3lock will wait for another password before turning off the monitors, in case you entered  a  wrong
              password or canceled by pressing Escape. Only makes sense together with -d. If omitted, the default is 30 seconds.

       -u, --no-unlock-indicator
              Disable the unlock indicator. i3lock will by default show an unlock indicator after pressing keys. This will give feedback for every
              keypress and it will show you the current PAM state (whether your password is currently being verified or whether it is wrong).

       -i path, --image=path
              Display the given PNG image instead of a blank screen.

       -c rrggbb, --color=rrggbb
              Turn the screen into the given color instead of white. Color must be given in 3-byte format: rrggbb (i.e. ff0000 is red).

       -t, --tiling
              If an image is specified (via -i) it will display the image tiled all over the screen (if it is a multi-monitor setup, the image  is
              visible on all screens).

       -p win|default, --pointer=win|default
              If you specify "default", i3lock does not hide your mouse pointer. If you specify "win", i3lock displays a hardcoded Windows-Pointer
              (thus enabling you to mess with your friends by using a screenshot of a Windows desktop as a locking-screen).

       -e, --ignore-empty-password
              When an empty password is provided by the user, do not validate it. Without this option, the empty password will be provided to  PAM
              and,  if invalid, the user will have to wait a few seconds before another try. This can be useful if the XF86ScreenSaver key is used
              to put a laptop to sleep and bounce on resume or if you happen to wake up your computer with the enter key.

       -f, --show-failed-attempts
              Show the number of failed attempts, if any.

       --debug
              Enables debug logging.  Note, that this will log the password used for authentication to stdout.

SEE ALSO
       xautolock(1) - use i3lock as your screen saver

AUTHOR
       Michael Stapelberg <michael+i3lock at stapelberg dot de>

       Jan-Erik Rediger <badboy at archlinux.us>

Linux                                                              JANUARY 2012                                                          i3lock(1)
