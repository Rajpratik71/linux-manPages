DOTTY(1)                                                      General Commands Manual                                                     DOTTY(1)

NAME
       dotty - A Customizable Graph Editor

SYNOPSIS
       dotty [ -V ] [ -lmmode ] [ -ellev ] [ file ]

DESCRIPTION
       dotty is a graph editor for the X Window System.  It may be run as a standalone editor, or as a front end for applications that use graphs.
       It can control multiple windows viewing different graphs.

       dotty is written on top of dot and lefty.  lefty is a general-purpose programmable editor for technical pictures.  It has  an  interpretive
       programming  language similar to AWK and C.  The user interface and graph editing operations of dotty are written as lefty functions.  Pro‐
       grammer-defined graph operations may be loaded as well.  Graph layouts are made by dot, which runs as a separate process that  communicates
       with lefty through pipes.

       If the input graph contains xdot attributes, dotty will use that to display the graph. Otherwise, it runs dot to obtain layout information.

USAGE
       The file name is optional. If present, the graph contained in that file is displayed in the dotty window.

OPTIONS
       -V     Prints the version.

       -lmmode
              Sets the layout mode. The mode can be sync or async. The default is async.

       -ellev Sets the mesage level. The lev can be 0 or 1. The default is 0.

BUGS
       The lefty parser does not accept anonymous graphs.

SEE ALSO
       dot(1), lefty(1), lneato(1), xdot(3)
       dotty user guide.

                                                                                                                                          DOTTY(1)
