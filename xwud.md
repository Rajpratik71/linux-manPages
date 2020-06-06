XWUD(1)                                                                                  General Commands Manual                                                                                  XWUD(1)

NAME
       xwud - image displayer for X

SYNOPSIS
       xwud [-in file] [-noclick] [-geometry geom] [-display display] [-new] [-std <maptype>] [-raw] [-vis <vis-type-or-id>] [-scale] [-help] [-rv] [-plane number] [-fg color] [-bg color] [-dumpheader]

DESCRIPTION
       Xwud is an X Window System image undumping utility.  Xwud allows X users to display in a window an image saved in a specially formatted dump file, such as produced by xwd(1).

OPTIONS
       -bg color
               If a bitmap image (or a single plane of an image) is displayed, this option can be used to specify the color to display for the "0" bits in the image.

       -display display
               This option allows you to specify the server to connect to; see X(7).

       -dumpheader
               This option prints out the XWD header information only.  Nothing is displayed.

       -fg color
               If a bitmap image (or a single plane of an image) is displayed, this option can be used to specify the color to display for the "1" bits in the image.

       -geometry geom
               This option allows you to specify the size and position of the window.  Typically you will only want to specify the position, and let the size default to the actual size of the image.

       -help   Print out a short description of the allowable options.

       -in file
               This option allows the user to explicitly specify the input file on the command line.  If no input file is given, the standard input is assumed.

       -new    This  option  forces creation of a new colormap for displaying the image.  If the image characteristics happen to match those of the display, this can get the image on the screen faster,
               but at the cost of using a new colormap (which on most displays will cause other windows to go technicolor).

       -noclick
               Clicking any button in the window will terminate the application, unless this option is specified.  Termination can always be achieved by typing 'q', 'Q', or ctrl-c.

       -plane number
               You can select a single bit plane of the image to display with this option.  Planes are numbered with zero being the least significant bit.

       -raw    This option forces the image to be displayed with whatever color values happen to currently exist on the screen.  This option is mostly useful when undumping an image back onto the  same
               screen that the image originally came from, while the original windows are still on the screen, and results in getting the image on the screen faster.

       -rv     If  a bitmap image (or a single plane of an image) is displayed, this option forces the foreground and background colors to be swapped.  This may be needed when displaying a bitmap image
               which has the color sense of pixel values "0" and "1" reversed from what they are on your display.

       -scale  Allow the window to be resized, and scale the image to the size of the window.

       -std maptype
               This option causes the image to be displayed using the specified Standard Colormap.  The property name is obtained by converting the type to upper case, prepending "RGB_", and  appending
               "_MAP".  Typical types are "best", "default", and "gray".  See xstdcmap(1) for one way of creating Standard Colormaps.

       -vis vis-type-or-id
               This  option  allows you to specify a particular visual or visual class.  The default is to pick the "best" one.  A particular class can be specified: "StaticGray", "GrayScale", "Static‐
               Color", "PseudoColor", "DirectColor", or "TrueColor".  Or "Match" can be specified, meaning use the same class as the source image.  Alternatively, an exact visual id  (specific  to  the
               server)  can be specified, either as a hexadecimal number (prefixed with "0x") or as a decimal number.  Finally, "default" can be specified, meaning to use the same class as the colormap
               of the root window.  Case is not significant in any of these strings.

ENVIRONMENT
       DISPLAY To get default display.

FILES
       XWDFile.h
               X Window Dump File format definition file.

BUGS
       xwud doesn't handle big/deep images very well on servers that don't have the BIG-REQUESTS extension.

SEE ALSO
       xwd(1), xstdcmap(1), X(7)

AUTHOR
       Bob Scheifler, MIT X Consortium

X Version 11                                                                                    xwud 1.0.4                                                                                        XWUD(1)
