APPRES(1)                                                     General Commands Manual                                                    APPRES(1)

NAME
       appres - list X application resource database

SYNOPSIS
       appres [class [instance]] [-1] [-V] [toolkitoptions]

DESCRIPTION
       The  appres  program  prints the resources seen by an application (or subhierarchy of an application) with the specified class and instance
       names.  It can be used to determine which resources a particular program will load.  For example,

            % appres  XTerm

       will list the resources that any xterm program will load.  If no application class is specified, the class -AppResTest- is used.

       To match a particular instance name, specify an instance name explicitly after the class name, or use the normal Xt  toolkit  option.   For
       example,

            % appres  XTerm  myxterm
       or
            % appres  XTerm  -name  myxterm

       To  list  resources  that  match  a subhierarchy of an application, specify hierarchical class and instance names.  The number of class and
       instance components must be equal, and the instance name should not be specified with a toolkit option.  For example,

            % appres  Xman.TopLevelShell.Form  xman.topBox.form

       will list the resources of widgets of xman topBox hierarchy.  To list just the resources matching a specific level in  the  hierarchy,  use
       the -1 option.  For example,

            % appres  XTerm.VT100  xterm.vt100  -1

       will list the resources matching the xterm vt100 widget.

       The -V option prints the appres command version and exits.

SEE ALSO
       X(7), xrdb(1), listres(1)

AUTHOR
       Jim Fulton, MIT X Consortium

X Version 11                                                       appres 1.0.4                                                          APPRES(1)
