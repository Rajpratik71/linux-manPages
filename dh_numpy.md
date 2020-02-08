DH_NUMPY(1)                             General Commands Manual                            DH_NUMPY(1)

NAME
       dh_numpy - adds Numpy depends to python:Depends substvar

SYNOPSIS
       dh_numpy [debhelper options]

DESCRIPTION
       dh_numpy adds information about the correct versioned depends on python-numpy to python:Depends
       substvar.

       This is needed because some Python extensions require strict versioned depends on python-numpy,
       and using this helper script is the easiest and most consistent way to get them.

       The  helper  script uses the information stored in /usr/share/numpy/versions, and the architec‐
       ture type of the package, to generate the Depends information; for a  detailed  description  of
       how  the  dependencies are generate, please refer to /usr/share/doc/python-numpy/README.Debian‐
       Maints .

SEE ALSO
       debhelper(7)

       This program is not a part of debhelper (and it's provided by python-numpy).

Numpy                                         2012-01-29                                   DH_NUMPY(1)
