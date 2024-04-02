chkrootkit(1)                                                 General Commands Manual                                                chkrootkit(1)

NAME
       chkrootkit - Determine whether the system is infected with a rootkit

SYNOPSIS
       chkrootkit [OPTION]... [TESTNAME]...

DESCRIPTION
       chkrootkit  examines certain elements of the target system and determines whether they have been tampered with. Some tools which chkrootkit
       applies while analyzing binaries and log files can be found at /usr/lib/chkrootkit.

OPTIONS
       -h     Print a short help message and exit.

       -V     Print version information and exit.

       -l     Print available tests.

       -d     Enter debug mode.

       -x     Enter expert mode.

       -e     Exclude known false positive files/dirs, quoted, space separated.

       -q     Enter quiet mode.

       -r dir Use dir as the root directory.

       -p dir1:dir2:dirN
              Specify the path for the external commands used by chkrootkit.

       -n     skip NFS mounted dirs

AUTHOR
       Manual page written by Yotam Rubin <yotam@makif.omer.k12.il> and lantz moore <lmoore@debian.org> for the Debian project. It may be used  by
       others.

SEE ALSO
       strings(1)

                                                                  10 January 2003                                                    chkrootkit(1)
