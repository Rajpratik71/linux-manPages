XLOAD(1)                                                                                 General Commands Manual                                                                                 XLOAD(1)

NAME
       xload - system load average display for X

SYNOPSIS
       xload     [-toolkitoption ...] [-scale integer] [-update seconds] [-hl color] [-highlight color]  [-remote host]
               [-jumpscroll pixels] [-label string] [-nolabel] [-lights]

DESCRIPTION
       The xload program displays a periodically updating histogram of the system load average.

OPTIONS
       Xload accepts all of the standard X Toolkit command line options (see X(7)).  The order of the options is unimportant.  xload also accepts the following additional options:

       -hl color or -highlight color
               This option specifies the color of the scale lines.

       -jumpscroll number of pixels
               The  number of pixels to shift the graph to the left when the graph reaches the right edge of the window.  The default value is 1/2 the width of the current window.  Smooth scrolling can
               be achieved by setting it to 1.

       -label string
               The string to put into the label above the load average.

       -nolabel
               If this command line option is specified then no label will be displayed above the load graph.

       -lights When specified, this option causes xload to display the current load average by using the keyboard leds; for a load average of n, xload lights the first n  keyboard  leds.   This  option
               turns off the usual screen display.

       -scale integer
               This option specifies the minimum number of tick marks in the histogram, where one division represents one load average point.  If the load goes above this number, xload will create more
               divisions, but it will never use fewer than this number.  The default is 1.

       -update seconds
               This option specifies the interval in seconds at which xload updates its display.  The minimum amount of time allowed between updates is 1 second.  The default is 10.

       -remote host
               This option tells xload to display the load of host instead of localhost. Xload gets the information from the rwhod database and consequently requires  rwhod  to  be  executing  both  on
               localhost and host.

RESOURCES
       In addition to the resources available to each of the widgets used by xload there is one resource defined by the application itself.

       showLabel (class Boolean)
               If False then no label will be displayed.

WIDGETS
       In order to specify resources, it is useful to know the hierarchy of the widgets which compose xload.  In the notation below, indentation indicates hierarchical structure.  The widget class name
       is given first, followed by the widget instance name.

       XLoad  xload
               Paned  paned
                       Label  label
                       StripChart  load

ENVIRONMENT
       DISPLAY to get the default host and display number.

       XENVIRONMENT
               to get the name of a resource file that overrides the global resources stored in the RESOURCE_MANAGER property.

FILES
       /etc/X11/app-defaults/XLoad
              specifies required resources

SEE ALSO
       X(7), xrdb(1), mem(4), Athena StripChart Widget.

BUGS
       On older platforms, this program may require the ability to open and read the special system file /dev/kmem.  Sites that do not allow general access to this file may need to make xload belong to
       the same group as /dev/kmem and turn on the set group id permission flag.

       Reading the load average is inherently non-portable.  Therefore, the routine used to read it (get_load.c) must be ported to each new operating system.

COPYRIGHT
       Copyright © X Consortium
       See X(7) for a full statement of rights and permissions.

AUTHORS
       K. Shane Hartman (MIT-LCS) and Stuart A. Malone (MIT-LCS);
       with features added by Jim Gettys (MIT-Athena), Bob Scheifler (MIT-LCS), Tony Della Fera (MIT-Athena), and Chris Peterson (MIT-LCS).

X Version 11                                                                                   xload 1.1.2                                                                                       XLOAD(1)
