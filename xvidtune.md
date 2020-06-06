xvidtune(1)                                                                              General Commands Manual                                                                              xvidtune(1)

NAME
       xvidtune - video mode tuner for Xorg

SYNOPSIS
       xvidtune [ -show | -prev | -next | -unlock ] [ -toolkitoption ... ]

DESCRIPTION
       Xvidtune is a client interface to the X server video mode extension (XFree86-VidModeExtension).

       When given one of the non-toolkit options, xvidtune provides a command line interface to either print or switch the video mode.

       Without  any  options  (or with only toolkit options) it presents the user with various buttons and sliders that can be used to interactively adjust existing video modes.  It will also print the
       settings in a format suitable for inclusion in an xorg.conf file.

       Normally the Xorg X servers only allow changes to be made with the XFree86-VidModeExtension from clients connected via a local connection type.

       Note:  The original mode settings can be restored by pressing the `R' key, and this can be used to restore a stable screen in situations where the screen becomes unreadable.

       The available buttons are:

       Left
       Right
       Up
       Down
                 Adjust the video mode so that the display will be moved in the appropriate direction.

       Wider
       Narrower
       Shorter
       Taller
                 Adjust the video mode so that the display size is altered appropriately.

       Quit      Exit the program.

       Apply     Adjust the current video mode to match the selected settings.

       Auto      Cause the Up/Down/Right/Left, Wider/Narrower/Shorter/Taller, Restore, and the special S3 buttons to be applied immediately.  This button can be toggled.

       Test      Temporarily switch to the selected settings.

       Restore   Return the settings to their original values.

       Fetch     Query the server for its current settings.

       Show      Print the currently selected settings to stdout in xorg.conf "Modeline" format.  The primary selection is similarly set.

       Next      Switch the Xserver to the next video mode.

       Prev      Switch the Xserver to the previous video mode.

       For some S3-based cards (964 and 968) the following are also available:

       InvertVCLK
                 Change the VCLK invert/non-invert state.

       EarlySC   Change the Early SC state.  This affects screen wrapping.

       BlankDelay1
       BlankDelay2
                 Set the blank delay values.  This affects screen wrapping.  Acceptable values are in the range 0-7.  The values may be incremented or decremented with the `+' and `-'  buttons,  or  by
                 pressing the `+' or `-' keys in the text field.

       For  S3-864/868  based  cards InvertVCLK and BlankDelay1 may be useful.  For S3 Trio32/Trio64 cards only InvertVCLK is available.  At the moment there are no default settings available for these
       chips in the video mode extension and thus this feature is disabled in xvidtune.  It can be enabled by setting any of the optional S3 commands in the screen section of xorg.conf, e.g. using
                 blank_delay "∗" 0

OPTIONS
       xvidtune accepts the standard X Toolkit command line options as well as the following:

       -show     Print the current settings to stdout in xorg.conf "Modeline" format and exit.

       -prev     Switch the Xserver to the previous video mode.

       -next     Switch the Xserver to the next video mode.

       -unlock   Normally, xvidtune will disable the switching of video modes via hot-keys while it is running.  If for some reason the program did not exit cleanly and they  are  still  disabled,  the
                 program can be re-run with this option to re-enable the mode switching key combinations.

SEE ALSO
       xrandr(1), Xorg(1), xorg.conf(5).

AUTHORS
       Kaleb S. Keithley, X Consortium.
       Additions and modifications by Jon Tombs, David Dawes, and Joe Moss.

BUGS
       X Error handling, i.e. when the server does not allow xvidtune clients to write new modes, could be better.

X Version 11                                                                                  xvidtune 1.0.3                                                                                  xvidtune(1)
