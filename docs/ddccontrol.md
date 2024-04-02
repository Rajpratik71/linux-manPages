DDCCONTROL(1)                                                 General Commands Manual                                                DDCCONTROL(1)

NAME
       ddccontrol - A utility to control monitor parameters via software

SYNOPSIS
       ddccontrol [-b datadir] [-v] [-c] [-d] [-f] [-s] [-r ctrl [-w value]] [-p|dev]

DESCRIPTION
       This manual page documents briefly the ddccontrol command.

       ddccontrol is an open source utility which allows controlling monitor parameters via software.

OPTIONS
       A summary of options is included below.

       dev    device, e.g. dev:/dev/i2c-0

       -p     probe I2C devices to find monitor buses

       -c     query capability

       -d     query ctrls 0 - 255

       -r     query ctrl

       -w     value to write to ctrl

       -f     force (avoid validity checks)

       -s     save settings

       -v     verbosity (specify more to increase)

       -b     ddccontrol-db directory (if other than /usr/share/ddccontrol-db)

SEE ALSO
       The program is documented fully in
       /usr/share/doc/ddccontrol/html/index.html

       The project homepage: http://ddccontrol.sourceforge.net

AUTHOR
       ddccontrol was written by Oleg I. Vdovikin and Nicolas Boichat.
       Copyright 2004-2005 Oleg I. Vdovikin (oleg@cs.msu.su)
       Copyright 2004-2006 Nicolas Boichat (nicolas@boichat.ch)

       This manual page was written by Roberto C. Sanchez <roberto@familiasanchez.net>.

                                                                   July 26, 2006                                                     DDCCONTROL(1)
