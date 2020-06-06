LATENCYTOP(8)                                                                              System Manager's Manual                                                                              LATENCYTOP(8)



NAME
       latencytop - a tool for developers to visualize system latencies

SYNOPSIS
       latencytop [--unknown] [processes...]

DESCRIPTION
       This manual page documents briefly the latencytop command.

       latencytop  is  a  Linux*  tool  for  software developers (both kernel and userspace), aimed at identifying where in the system latency is happening, and what kind of operation/action is causing the
       latency to happen so that the code can be changed to avoid the worst latency hiccups.

       LatencyTOP focuses on the cases where the applications want to run and execute useful code, but there's some resource that's not currently available (and the kernel then blocks the process). This is
       done both on a system level and on a per process level, so that you can see what's happening to the system, and which process is suffering and/or causing the delays.

       You can walk the processes by using the cursor keys. If you press s followed by a letter, then only active processes starting with that lettter are displayed and walked. If you press s followed by 0
       then that filter is reset.


SEE ALSO
       powertop(1)
       The program is more fully described at http://www.latencytop.org

AUTHOR
       latencytop was written by Arjan van de Ven <arjan@linux.intel.com>.

       This manual page was written by Giacomo Catenazzi <cate@debian.org>, for the Debian project (but may be used by others).




                                                                                               November 9, 2008                                                                                 LATENCYTOP(8)
