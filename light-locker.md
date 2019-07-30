LIGHT-LOCKER(1)                                                                  General Commands Manual                                                                  LIGHT-LOCKER(1)

NAME
       light-locker - screen locker

SYNOPSIS
       light-locker [OPTIONS...]

DESCRIPTION
       light-locker  is  a simple locker (forked from gnome-screensaver) that aims to have a simple, sane, secure defaults and be well integrated with the desktop while not carrying any
       desktop-specific dependencies.

OPTIONS
       --debug
              Enable debugging code

       --lock-after-screensaver=S
              Lock the screen S seconds after the screensaver started.  Use 0 to disable this

       --late-locking
              Lock the screen on screensaver deactivation

       --no-late-locking
              Lock the screen on screensaver activation

       --lock-on-suspend
              Lock the screen on suspend/resume

       --no-lock-on-suspend
              Do not lock the screen on suspend/resume

       --lock-on-lid
              Lock the screen on lid close

       --no-lock-on-lid
              Do not lock the screen on lid close

       --idle-hint
              Set the session idle hint while the screenaver is active

       --no-idle-hint
              Don't set the idle hint. Let something else handle that

       This program also accepts the standard GTK options.

SEE ALSO
       gtk-options(7)

The Cavalry                                                                             2014-03-23                                                                        LIGHT-LOCKER(1)
