XBACKLIGHT(1)                                                                              General Commands Manual                                                                              XBACKLIGHT(1)



NAME
       xbacklight - adjust backlight brightness using RandR extension

SYNOPSIS
       xbacklight [-help]  [-display display] [-get] [-set percent] [-inc percent] [-dec percent]

DESCRIPTION
       Xbacklight is used to adjust the backlight brightness where supported. It finds all outputs on the X server supporting backlight brightness control and changes them all in the same way.

       -get   Print out the current backlight brightness of each output with such a control. The brightness is represented as a percentage of the maximum brightness supported.

       -set percent
              Sets each backlight brightness to the specified level.

       -inc percent
              Increases brightness by the specified amount.

       -dec percent
              Decreases brightness by the specified amount.

       -help  Print out a summary of the usage and exit.

       -time milliseconds
              Length of time to spend fading the backlight between old and new value.  Default is 200.

       -steps number
              Number of steps to take while fading. Default is 20.

SEE ALSO
       Xrandr(3)

AUTHORS
       Keith Packard, Open Source Technology Center, Intel Corporation.



X Version 11                                                                                   xbacklight 1.2.1                                                                                 XBACKLIGHT(1)
