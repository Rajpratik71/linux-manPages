XCURSORGEN(1)                                                 General Commands Manual                                                XCURSORGEN(1)

NAME
       xcursorgen - create an X cursor file from a collection of PNG images

SYNOPSIS
       xcursorgen [ -V ] [ --version ] [ -? ] [ --help ] [ -p dir ] [ --prefix dir ] [ config-file [ output-file ] ]

DESCRIPTION
       Xcursorgen  reads the config-file to find the list of cursor images along with their hotspot and nominal size information.  Xcursorgen con‐
       verts all of the images to Xcursor format and writes them to the output-file.

       Each line in the config file is of the form:
       <size> <xhot> <yhot> <filename> <ms-delay>

       Multiple images with the same <size> are used to create animated cursors, the <ms-delay> value on each line indicates how long  each  image
       should be displayed before switching to the next.  <ms-delay> can be elided for static cursors.

       If  config-file  is not specified, or is specified as "-", standard input is used for the configuration file.  If output-file is not speci‐
       fied, or is specified as "-", standard output is used for the output file.

OPTIONS
       -V, --version
               Display the version number and exit.

       -?, --help
               Display the usage message and exit.

       -p dir, --prefix dir
               Find cursor images in the directory specified by dir.   If not specified, the current directory is used.

SEE ALSO
       Xcursor(3)

X Version 11                                                     xcursorgen 1.0.6                                                    XCURSORGEN(1)
