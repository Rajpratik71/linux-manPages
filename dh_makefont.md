dh_makefont(1)                                                General Commands Manual                                               dh_makefont(1)

NAME
       dh_makefont - Debian Font packaging helper

SYNOPSIS
       dh_makefont [-h, --help] [-c,--copyright <type>] [-p,--package <name[_version]>] [--maint MAINT] [-u,--upstream UPSTREAMURL] font_folder

DESCRIPTION
       dh_makefont  is  a wrapper for the dh_make command to convert regular font source packages into one formatted according to the requirements
       of the Debian Policy.

OPTIONS
       -h, --help
              Display the name, version, available options and authors, and exit successfully.

       -c, --copyright license
              Use license in copyright file for the package. license can be one of apache|artistic|bsd|gpl|gpl2|gpl3|lgpl|lgpl2|lgpl3|x11.

       -p, --package name[_version]
              Force package name to be name. If name_version is given this will set version number of package bypassing the directory checking.

       --maint maintainer
              Ovrride the default name of the mainter from "Debian Fonts Task Force" to maintainer.  to  *Debian  Fonts  Task  Force*.  maintainer
              should be in the form Maintainer Name <maint.email>

       -u, --upstream url
              Set the url from where the fonts were downloaded from to url.  This url will be used in the following fields: Homepage: field of the
              control file and Source: field of the copyright file

       -v, --version
              Show the version number of program and exit.

       font_folder
              This is the name of the folder in which you have extracted the fonts.  Rules for folder name are same as dh_make. If you didn't give
              proper name dh_make will fail.

ENVIRONMENT
       The following environment settings are used by dh_makefont:

       DEBEMAIL
              Email address to use in control and changelog entries.

       DEBFULLNAME
              You full name, eg "John Doe" which will appear in the control and changelog entries.

BUGS
       If the package name has a hypen '-' in it then dh_makefont will mess up the package naming.

SEE ALSO
       dh_make(1),dh(1)

Debian Project                                                      2016-01-04                                                      dh_makefont(1)
