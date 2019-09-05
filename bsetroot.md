bsetroot(1)                                                   General Commands Manual                                                  bsetroot(1)

NAME
       bsetroot - blackbox utility to change root window appearance

SYNOPSIS
       bsetroot -help
       bsetroot [ -display display ] -solid color
       bsetroot [ -display display ] -mod x y -fg color -bg color
       bsetroot [ -display display ] -gradient texture -from color -to color

DESCRIPTION
       Bsetroot  is a utility that can control the appearance of the root window in three ways: Either give it a solid color, or write a two color
       modula pattern to it, or render a gradient texture, based on two different colors.

       Bsetroot resembles xsetroot(1) in this functionality but it supports multiple screen displays, and gradient textures the same way as Black‐
       box does.  It doesn't handle cursors etc.  Bsetroot is part of the Blackbox package.

OPTIONS
       Bsetroot operates in three ways, you must choose one of the first 3 options:

       -solid color
              Sets the root window to specified color.

       -mod x y
              Creates a modula pattern. You must specify -bg and -fg colors.

       -gradient texturestring
              Renders  the specified texture string to the root window.  For possible texture strings, please refer to blackbox(1).  You must also
              specify both a -from and a -to color.

       -display display
              Tells Bsetroot to connect to the specified display.

       -bg, -background color
              Background color.  Needed for -mod patterns.

       -fg, -foreground color
              Foreground color.  Needed for -mod patterns.

       -from color
              Start color for rendering textures.  Needed for -gradient operation mode.

       -to color
              Ending color for rendering textures.  Needed for -gradient operation mode.

       -help  Prints version info and short help text.

AUTHOR
       Bsetroot was written and maintained by Brad Hughes (blackbox@alug.org) and Jeff Raven (jraven@psu.edu).

SEE ALSO
       blackbox(1)

0.60.3                                                            June 16th, 2000                                                      bsetroot(1)
