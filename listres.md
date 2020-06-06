LISTRES(1)                                                                               General Commands Manual                                                                               LISTRES(1)

NAME
       listres - list resources in widgets

SYNOPSIS
       listres [-option ...]

DESCRIPTION
       The  listres  program  generates a list of a widget's resource database.  The class in which each resource is first defined, the instance and class name, and the type of each resource is listed.
       If no specific widgets or the -all switch are given, a two-column list of widget names and their class hierarchies is printed.

OPTIONS
       Listres accepts all of the standard toolkit command line options along with those listed below:

       -all    This option indicates that listres should print information for all known widgets and objects.

       -nosuper
               This option indicates that resources that are inherited from a superclass should not be listed.  This is useful for determining which resources are new to a subclass.

       -variable
               This option indicates that widgets should be identified by the names of the class record variables rather than the class name given in the variable.  This is  useful  for  distinguishing
               subclasses that have the same class name as their superclasses.

       -top name
               This option specifies the name of the widget to be treated as the top of the hierarchy.  Case is not significant, and the name may match either the class variable name or the class name.
               The default is ``core''.

       -format printf-string
               This option specifies the printf-style format string to be used to print out the name, instance, class, and type of each resource.

X DEFAULTS
       To be written.

SEE ALSO
       X(7), xrdb(1), appropriate widget documents

BUGS
       On operating systems that do not support dynamic linking of run-time routines, this program must have all of its known widgets compiled in.  The sources provide several tools for automating this
       process for various widget sets.

COPYRIGHT
       Copyright 1994 X Consortium
       See X(7) for a full statement of rights and permissions.

AUTHOR
       Jim Fulton, MIT X Consortium

X Version 11                                                                                  listres 1.0.3                                                                                    LISTRES(1)
