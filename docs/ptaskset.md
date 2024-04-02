PTASKSET(1)                                                                                General Commands Manual                                                                                PTASKSET(1)



NAME
       ptaskset (python-schedutils) - set or get the affinity of a process

SYNOPSIS
       ptaskset [options] [mask | cpu-list] [pid | cmd [args...]]

OPTIONS
       -p, --pid
              operate on existing given pid

       -c, --cpu-list
              display and specify cpus in list format

       -h, --help
              display help

SEE ALSO
       taskset(1)

AUTHOR
       ptaskset was written by Arnaldo Carvalho de Melo <acme@redhat.com>
       as part of python-schedutils

       This manual page was written by John Kacur <jkacur@redhat.com>

       Report bugs and send patches to <tuna-devel@lists.fedorahosted.org>



                                                                                                 May 10 2016                                                                                      PTASKSET(1)
