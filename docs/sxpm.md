SXPM(1)                                                                                    General Commands Manual                                                                                    SXPM(1)



NAME
       sxpm - Show an XPM (X PixMap) file and/or convert XPM 1 or 2 files to XPM 3.

SYNOPSIS
       sxpm  [-d displayname] [-g geometry] [-hints] [-icon filename] [-plaid | filename | -] [-o filename | -o -] [-pcmap] [-closecolors] [-nod] [-nom] [-mono | -grey4 | -grey | -color] [-sc symbol color]
       [-sp symbol pixel] [-cp color pixel] [-rgb filename] [-v]

DESCRIPTION
       The sxpm program can be used to view any XPM (version 1, 2, or 3) file and/or to convert a file from XPM1 or XPM2 to XPM version 3. If sxpm is run with any dummy option specified, the usage is  dis‐
       played. If no geometry is specified, the show window will have the size of the read pixmap. Pressing the key Q in the window will quit the program.

OPTIONS
       -d display
               Specifies the display to connect to.

       -g geom Window geometry (default is pixmap's size).

       -hints  Set ResizeInc for window.

       -icon filename
               Set icon to pixmap created from the file filename.

       -plaid  Show the plaid pixmap which is stored as data.

       filename
               Read from the file filename and from standard input if filename is '-'.  If no input is specified sxpm reads from standard input.

       -o filename
               Write to the file filename (overwrite if it already exists) and to standard output if filename is '-'.

       -mono   Use the colors specified for a monochrome visual.

       -grey4  Use the colors specified for a 4 color greyscale visual.

       -grey   Use the colors specified for a greyscale visual.

       -color  Use the colors specified for a color visual.

       -pcmap  Use a private colormap.

       -closecolors
               Try to use "close colors" before reverting to other visuals.

       -nod    Do not display the pixmap in a window.  (Useful when using as converter)

       -nom    Do not use the clipmask if there is any.

       -sc symbol colorname
               Override default color to symbol to colorname.

       -sp symbol pixelvalue
               Override default color to symbol to pixelvalue.

       -cp colorname pixelvalue
               Override default color to colorname to pixelvalue.

       -rgb filename
               Search color names in the file filename and write them out instead of the rgb values.

       -v      Verbose - to print out extensions (stderr).



KNOWN BUGS
       Some window managers may not accept a pixmap which is not a bitmap as icon because this does not respect ICCCM, many of the well known ones will accept it though.


AUTHOR
       Arnaud Le Hors    (lehors@sophia.inria.fr)
       Bull Research France
       Copyright (C) 1989-95 by Groupe Bull.



X Version 11                                                                                    libXpm 3.5.12                                                                                         SXPM(1)
