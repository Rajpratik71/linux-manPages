XWD(1)                                                                                  General Commands Manual                                                                                 XWD(1)

NAME
       xwd - dump an image of an X window

SYNOPSIS
       xwd [-debug] [-help] [-nobdrs] [-out file] [-xy] [-frame] [-add value] [-root | -id id | -name name ] [-icmap] [-screen] [-silent] [-display display]

DESCRIPTION
       Xwd  is  an X Window System window dumping utility.  Xwd allows X users to store window images in a specially formatted dump file.  This file can then be read by various other X utilities for
       redisplay, printing, editing, formatting, archiving, image processing, etc.  The target window is selected by clicking the pointer in the desired window.  The keyboard bell is  rung  once  at
       the beginning of the dump and twice when the dump is completed.

OPTIONS
       -display display
               This argument allows you to specify the server to connect to; see X(7).

       -help   Print out the `Usage:' command syntax summary.

       -nobdrs This  argument  specifies  that  the window dump should not include the pixels that compose the X window border.  This is useful in situations where you may wish to include the window
               contents in a document as an illustration.

       -out file
               This argument allows the user to explicitly specify the output file on the command line.  The default is to output to standard out.

       -xy     This option applies to color displays only. It selects `XY' format dumping instead of the default `Z' format.

       -add value
               This option specifies an signed value to be added to every pixel.

       -frame  This option indicates that the window manager frame should be included when manually selecting a window.

       -root   This option indicates that the root window should be selected for the window dump, without requiring the user to select a window with the pointer.

       -id id  This option indicates that the window with the specified resource id should be selected for the window dump, without requiring the user to select a window with the pointer.

       -name name
               This option indicates that the window with the specified WM_NAME property should be selected for the window dump, without requiring the user to select a window with the pointer.

       -icmap  Normally the colormap of the chosen window is used to obtain RGB values.  This option forces the first installed colormap of the screen to be used instead.

       -screen This option indicates that the GetImage request used to obtain the image should be done on the root window, rather than directly on the specified window.  In this way, you can  obtain
               pieces  of other windows that overlap the specified window, and more importantly, you can capture menus or other popups that are independent windows but appear over the specified win‐
               dow.

       -silent Operate silently, i.e. don't ring any bells before and after dumping the window.

ENVIRONMENT
       DISPLAY To get default host and display number.

FILES
       XWDFile.h
               X Window Dump File format definition file.

SEE ALSO
       xwud(1), X(7)

AUTHORS
       Tony Della Fera, Digital Equipment Corp., MIT Project Athena
       William F. Wyatt, Smithsonian Astrophysical Observatory

X Version 11                                                                                   xwd 1.0.6                                                                                        XWD(1)
