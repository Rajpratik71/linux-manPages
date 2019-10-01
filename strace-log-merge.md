strace-log-merge(1)                                                                            strace-log-merge                                                                           strace-log-merge(1)



NAME
       strace-log-merge

SYNOPSIS
       strace-log-merge STRACE_LOG

DESCRIPTION
       strace-log-merge finds all STRACE_LOG.PID files, adds PID prefix to every line, the combines and sorts them, and prints the result to standard output.

       It is assumed that STRACE_LOGs were produced by strace with the -tt[t] option which prints timestamps (otherwise worting won't do any good).


OPTIONS
       --help  Show help


SEE ALSO
BUGS
.1                                                                                              15 April 2013                                                                             strace-log-merge(1)
