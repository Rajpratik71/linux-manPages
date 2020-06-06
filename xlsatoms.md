XLSATOMS(1)                                                                              General Commands Manual                                                                              XLSATOMS(1)

NAME
       xlsatoms - list interned atoms defined on server

SYNOPSIS
       xlsatoms [-options ...]

DESCRIPTION
       Xlsatoms  lists the interned atoms.  By default, all atoms starting from 1 (the lowest atom value defined by the protocol) are listed until unknown atom is found.  If an explicit range is given,
       xlsatoms will try all atoms in the range, regardless of whether or not any are undefined.

OPTIONS
       -display dpy
               This option specifies the X server to which to connect.

       -format string
               This option specifies a printf-style string used to list each atom <value,name> pair, printed in that order (value is an unsigned long and name is a char *).  Xlsatoms will supply a new‐
               line at the end of each line.  The default is %ld\t%s.

       -range [low]-[high]
               This  option  specifies  the  range of atom values to check.  If low is not given, a value of 1 assumed.  If high is not given, xlsatoms will stop at the first undefined atom at or above
               low.

       -name string
               This option specifies the name of an atom to list.  If the atom does not exist, a message will be printed on the standard error.

       -version
               Print out the program version and exit.

SEE ALSO
       X(7), Xserver(1), xprop(1)

ENVIRONMENT
       DISPLAY to get the default host and display to use.

AUTHOR
       Jim Fulton, MIT X Consortium

X Version 11                                                                                  xlsatoms 1.1.2                                                                                  XLSATOMS(1)
