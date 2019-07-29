mpivars(1)                                                    General Commands Manual                                                   mpivars(1)

NAME
       parkill - Kill all processes running a specified command

SYNOPSIS
       parkill [ -debug ] [ -verbose ] [ -user=name ] program

DESCRIPTION
       parkill kills all processes running a specified command.

       Many systems also have the "killall" command; this should be used instead if it is available.

       This script relies on the ps command; where possible, it uses the /proc/<pid>/cmdline interface to more reliably access the commandline (to
       avoid matching command line parameters as if they were functions).

OPTIONS
       -debug Print debug information.

       -verbose
              Be verbose.

       --user=name
              Only kill processes belonging to a particular user. Root privileges are required for this option.

AUTHOR
       This manpage was written by Torquil Macdonald Sørensen <torquil@gmail.com>, by copying from src/env/parkill.in in the MPICH sources.

SEE ALSO
       mpiexec.hydra(1), mpicc.mpich(1), mpicxx.mpich(1), mpif77.mpich(1), mpif90.mpich(1), mpifort.mpich(1).

                                                                    2015-11-06                                                          mpivars(1)
