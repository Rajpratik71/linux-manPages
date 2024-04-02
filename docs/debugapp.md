debugapp(1)                                                    GNUstep System Manual                                                   debugapp(1)

NAME
       debugapp - A wrapper for openapp.

SYNOPSIS
       debugapp [--find] [--gdb=...]  application [arguments...]

DESCRIPTION
       debugapp  is  a  tool  that helps you start or find applications by name in debugging mode. It acts as a wrapper around openapp , and calls
       openapp with the --debug option; we recommend using openapp directly.

       By default gdb is used as the debugger, but this can be changed with the --gdb= option or through the GDB environment variable.

       The arguments are the arguments passed to the application.

       See the openapp (1) man-page for a complete description.

SEE ALSO
       openapp(1)

HISTORY
       Work on debugapp started in October 1997 by Ovidiu Predescu <ovidiu@net-community.com>.  In October  2006  Nicola  Pero  <nicola.pero@meta-
       innovation.com> merged it with openapp.

AUTHORS
       This man page was written by Dennis Leeuw <dleeuw@made-it.com>.

GNUstep                                                             16/12/2007                                                         debugapp(1)
