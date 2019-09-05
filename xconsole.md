XCONSOLE(1)                                                                             General Commands Manual                                                                            XCONSOLE(1)

NAME
       xconsole - monitor system console messages with X

SYNOPSIS
       xconsole [-toolkitoption ...] [-file file-name] [-notify] [-stripNonprint] [-daemon] [-verbose] [-exitOnFail]

DESCRIPTION
       The xconsole program displays messages which are usually sent to /dev/console.

OPTIONS
       Xconsole accepts all of the standard X Toolkit command line options along with the additional options listed below:

       -file file-name
               To monitor some other device, use this option to specify the device name.  This does not work on regular files as they are always ready to be read from.

       -notify -nonotify
               When new data are received from the console and the notify option is set, the icon name of the application has " *" appended, so that it is evident even when the application is iconi‐
               fied.  -notify is the default.

       -daemon This option causes xconsole to place itself in the background, using fork/exit.

       -verbose
               When set, this option directs xconsole to display an informative message in the first line of the text buffer.

       -exitOnFail
               When set, this option directs xconsole to exit when it is unable to redirect the console output.

       -saveLines count
               When set, xconsole only preserves count lines of message history instead of growing the text buffer without bound (a count of zero - the default - is treated as placing  no  limit  on
               the history).

X DEFAULTS
       This program uses the Athena Text widget, look in the Athena Widget Set documentation for controlling it.

       Xconsole  otherwise accepts resources of the same names as the command-line options (without the leading dash).  "file" is a string type, "saveLines" an integer, and the remaining options are
       booleans.

WIDGETS
       In order to specify resources, it is useful to know the hierarchy of the widgets which compose xconsole.  In the notation below, indentation  indicates  hierarchical  structure.   The  widget
       class name is given first, followed by the widget instance name.

       XConsole  xconsole
            XConsole  text

ENVIRONMENT
       DISPLAY to get the default host and display number.

       XENVIRONMENT
               to get the name of a resource file that overrides the global resources stored in the RESOURCE_MANAGER property.

FILES
       /etc/X11/app-defaults/XConsole
              specifies required resources

SEE ALSO
       X(7), xrdb(1), Athena Text widget

AUTHOR
       Keith Packard (MIT X Consortium)

X Version 11                                                                                xconsole 1.0.6                                                                                 XCONSOLE(1)
