PRTSTAT(1)                      User Commands                      PRTSTAT(1)

NAME
       prtstat - print statistics of a process

SYNOPSIS
       prtstat [-r|--raw] pid
       prtstat -V|--version

DESCRIPTION
       prtstat prints the statistics of the specified process.  This informa‐
       tion comes from the /proc/PID/stat file.

OPTIONS
       -r, --raw
              Print the information in raw format.

       -V, --version
              Show the version information for prtstat.

FILES
       /proc/<PID>/stat
              source of the information prtstat uses

psmisc                            2016-06-18                       PRTSTAT(1)
