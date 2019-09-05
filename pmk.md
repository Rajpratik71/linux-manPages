PMK(1)                                                      BSD General Commands Manual                                                     PMK(1)

NAME
     pmk — configuring tool

SYNOPSIS
     pmk [-hlv] [-b path] [-d switch_disable_list] [-e switch_enable_list] [-f file] [-o file] [options]

DESCRIPTION
     pmk is a configuring tool which aims to help building project on different operating systems.

     The options are as follows:

     -b path
             Use given path as basedir.

     -d switch_disable_list
             Provide a list of switches to disable.

     -e switch_enable_list
             Provide a list of switches to enable.

     -f file
             Use an alternate file instead of pmkfile(5).

     -h      Display usage.

     -l      Enable check build log.

     -o file
             Override pmk.conf data with the content of the given file.

     -v      Display the version number.

FILES
     pmkfile            pmk(1) specification file.
     /etc/pmk/pmk.conf  default pmk(1) configuration file

EXAMPLES
     To display pmk version number:

           $ pmk -v

     To use src as the basedir and disable two switches:

           $ pmk -b src -d use_gtk,use_qt

     To specify an alternate pmkfile(5), enabling one switch and overriding /etc/pmk/pmk.conf with the content of a given file ( pmk/pmkovr in
     this case):

           $ pmk -f pmk/pmkfile -e use_curses -o pmk/pmkovr

SEE ALSO
     make(1), pmkscan(1), pmkfile(5), pmk.conf(5), pmksetup(8)

HISTORY
     The idea to replace configure script was existing since a long time.  But the projet was initiated in the begining of March 2003.

AUTHOR
     Damien Couderc.

BUGS
     You have to find them.

BSD                                                               March 28, 2003                                                               BSD
