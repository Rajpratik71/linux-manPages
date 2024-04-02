openapp(1)                                                     GNUstep System Manual                                                    openapp(1)

NAME
       openapp - launch applications from the command line

SYNOPSIS
       openapp [--find] [--debug [--gdb= debuger]] [ --library-combo=library-combo ] application [arguments...]

DESCRIPTION
       The openapp command allows you to launch graphical GNUstep applications from the command line.

       application is the complete or relative name of the application program with or without the .app extension, like Ink.app.

       arguments are the arguments passed to the application.

       openapp  first  checks whether the application is in the current working directory.  If not then searches the GNUstep domains' Applications
       folders in the following order: User (i.e. ~/GNUstep/Applications), Local, Network, System. First match wins.

OPTIONS
       --find application
              will print out the full path of the application executable which would be executed, without actually executing it. It will also list
              all paths that are attempted.

       --debug application
              starts  the  application  in the debugger. By default gdb, but this can be changed with the --gdb= argument or through the GDB shell
              variable.

       --library-combo=library-combo
              Starts the application with the specified library combo. This is a rarely used option in a non-flattened  setup.  See  the  library-
              combo(7) man-page for more information about the different library combinations.

       --help print above usage description.

EXAMPLES
       Start Ink.app without additional parameters:

       openapp Ink.app

       Launch Ink.app and pass it the --debug argument:

       openapp --debug Ink.app

       To determine which executable is launched by openapp, type:

       openapp --find Ink.app

       The output of the above command might be something like: /usr/GNUstep/Local/Applications/Ink.app/Ink

ENVIRONMENT
       GNUSTEP_CONFIG_FILE
              is  used  to  determine where the GNUstep.sh configuration file is located. If the variable is not set openapp tries to locate it in
              the folder where openapp was started, then in the user domain, and as a last resort in the system domain (or actually the place  you
              configured (--with-config-file=) during building).

       GDB    Sets the debugger to use when --debug is used.

SEE ALSO
       debugapp(1), GNUstep(7), gopen(1), library-combo(7), opentool(1)

HISTORY
       Work on openapp started October 1997.

       openapp was originally written by Ovidiu Predescu <ovidiu@net-community.com> and is now maintained by Nicola Pero <nicola.pero@meta-innova‐
       tion.com>

AUTHORS
       This manual page was first written July 2003 by Martin Brecher <martin@mb-itconsulting.com>.

       Updated with notes from Hubert Chathi <uhoreg@debian.org> and Dennis Leeuw <dleeuw@made-it.com>, December 2007 by Dennis Leeuw.

gnustep-make                                                        12/12/2007                                                          openapp(1)
