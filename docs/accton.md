ACCTON(8)                                                                                  System Manager's Manual                                                                                  ACCTON(8)



NAME
       accton -  turns process accounting on or off

SYNOPSIS
       accton [OPTION] on|off|filename

       accton [ -V | --version ] [ -h | --help ]

DESCRIPTION
       accton filename turns on process accounting.

OPTIONS
       -V, --version
              Print the version number of ac to standard output and quit.
       -h, --help
              Prints the usage string and default locations of system files to standard output and exits.
       on     Turns on process accounting using the default accounting file name.
       off    Turns off process accounting.
FILES
       acct   The system wide process accounting file. See acct(5) (or pacct(5)) for further details.
AUTHOR
       The GNU accounting utilities were written by Noel Cragg <noel@gnu.ai.mit.edu>. The man page was adapted from the accounting texinfo page by Susan Kleinmann <sgk@sgk.tiac.net>.
SEE ALSO
       acct(5), ac(1)



                                                                                               2008 November 24                                                                                     ACCTON(8)
