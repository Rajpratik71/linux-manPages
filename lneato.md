LNEATO(1)                                                                                General Commands Manual                                                                                LNEATO(1)

NAME
       lneato - A Customizable Graph Editor

SYNOPSIS
       lneato [ -V ] [ -lmmode ] [ -ellev ] [ file ]

DESCRIPTION
       lneato  is  a  graph editor for the X Window System.  It may be run as a standalone editor, or as a front end for applications that use graphs.  It can control multiple windows viewing different
       graphs.

       lneato is written on top of neato and lefty.  lefty is a general-purpose programmable editor for technical pictures.  It has an interpretive programming language similar to AWK and C.  The  user
       interface  and  graph  editing  operations of lneato are written as lefty functions.  Programmer-defined graph operations may be loaded as well.  Graph layouts are made by neato, which runs as a
       separate process that communicates with lefty through pipes.

       If the input graph contains xdot attributes, lneato will use that to display the graph. Otherwise, it runs neato to obtain layout information.

USAGE
       The file name is optional. If present, the graph contained in that file is displayed in the lneato window.

OPTIONS
       -V     Prints the version.

       -lmmode
              Sets the layout mode. The mode can be sync or async. The default is async.

       -ellev Sets the mesage level. The lev can be 0 or 1. The default is 0.

SEE ALSO
       neato(1), lefty(1), dotty(1), xdot(3),
       dotty user guide.

                                                                                                                                                                                                LNEATO(1)
