LUNCH-SLAVE(1)                                                     User Commands                                                    LUNCH-SLAVE(1)

NAME
       lunch-slave - Process launcher

SYNOPSIS
       lunch-slave [options]

DESCRIPTION
       The  lunch  slave utility is an interactive process launcher. It is intended to be run by the lunch master process through an encrypted SSH
       connection. It launches a single process at a time and allows to specify its environment and to log its standard  output  and  error  to  a
       file. Launch it, type "help" and press enter to know more about how it works.

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       -i ID, --id=ID
              Identifier of this lunch slave.

INTERACTIVE USAGE
       Start lunch-slave. Type "help" and press enter to learn what other commands one can type.

HISTORY
       2010 - Ported from multiprocessing to Twisted

       2009 - Written by Alexandre Quessy <alexandre@quessy.net> with contributions from Simon Piette <simonp@sat.qc.ca>

REPORTING BUGS
       See http://svn.sat.qc.ca/trac/lunch for help and documentation.

SEE ALSO
       lunch (1)

lunch-slave 0.4.0                                                 September 2015                                                    LUNCH-SLAVE(1)
