VIMPLATE(1)                                             User Contributed Perl Documentation                                            VIMPLATE(1)

NAME
       vimplate - the vim template system.

DEPENDS on PACKAGES
       Template-Toolkit http://search.cpan.org/~abw/Template-Toolkit-2.14

       please install Template-Toolkit on your system.

DEPENDS on SETTINGS
       variable HOME

       on unix/bsd/linux the variable home is set.  On Windows please set the variable home to the value where _vimplaterc should be locatet.

SYNOPSIS
       vimplate <-template=<template>> [-out=<file>] [-user=<user>] [-dir=<dir>] [-config=<file>]
       vimplate <-createconfig>
       vimplate <-listtemplates>
       vimplate <-listusers>
       vimplate <-version>
       vimplate <-help|-h|-?>
       vimplate <-man>

OPTIONS
       -help|-h|-?
           Print a brief help message and exit.

       -man
           Print the manual page and exit.

       -version
           Print the version and exit.

       -createconfig
           Write a vimplate config to $HOME/.vimplaterc or %HOME%\_vimplaterc (on Windows) and exit.

       -listtemplate
           Print the avaible templates and exit.

       -listusers
           Print the avaible users and exit.

       -user|u=<username>
           Use the information form user <username> while parsing templates.

       -dir|d=<templatedir>
           Search templatefiles in <templatedir>.

       -template=<templatefile>
           Use the <templatefile>.

DESCRIPTION
       vimplate Print a spezified template to standard output.

AUTHOR
       Urs Stotz <stotz@gmx.ch>

COPYRIGHT
       Copyright (c) 2004-2005, Urs Stotz <stotz@gmx.ch>

       All rights reserved. This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

SEE ALSO
       perl(1) Template(3)

perl v5.14.2                                                        2013-08-19                                                         VIMPLATE(1)
