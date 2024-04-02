PCHRT(1)                                                                                   General Commands Manual                                                                                   PCHRT(1)



NAME
       pchrt (python-schedutils) - manipulate the real-time attributes of a process

SYNOPSIS
       pchrt [options] [prio] [pid | cmd [args...]]

OPTIONS
       -b, --batch
              set policy to SCHED_BATCH

       -f, --fifo
              set policy to SCHED_FIFO

       -i, --idle
              set policy to SCHED_IDLE

       -p, --pid
              operate on existing given pid

       -m, --max
              show min and max valid priorities

       -o, --other
              set policy to SCHED_OTHER

       -r, --rr
              set policy to SCHED_RR (default)

       -R, --reset-on-fork
              set SCHED_RESET_ON_FORK for FIFO or RR

       -h, --help
              display help

       Note:  You must give a priority if changing policy.

SEE ALSO
       chrt(1)

AUTHOR
       pchrt was written by Arnaldo Carvalho de Melo <acme@redhat.com>
       as part of python-schedutils

       This manual page was written by John Kacur <jkacur@redhat.com>

       Report bugs and send patches to <tuna-devel@lists.fedorahosted.org>



                                                                                                 May 10 2016                                                                                         PCHRT(1)
