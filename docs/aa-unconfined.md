AA-UNCONFINED(8)                                                                                   AppArmor                                                                                  AA-UNCONFINED(8)



NAME
       aa-unconfined - output a list of processes with tcp or udp ports that do not have AppArmor profiles loaded

SYNOPSIS
       aa-unconfined

DESCRIPTION
       aa-unconfined will use netstat(8) to determine which processes have open network sockets and do not have AppArmor profiles loaded into the kernel.

BUGS
       aa-unconfined must be run as root to retrieve the process executable link from the /proc filesystem. This program is susceptible to race conditions of several flavours: an unlinked executable will
       be mishandled; an executable started before a AppArmor profile is loaded will not appear in the output, despite running without confinement; a process that dies between the netstat(8) and further
       checks will be mishandled. This program only lists processes using TCP and UDP. In short, this program is unsuitable for forensics use and is provided only as an aid to profiling all network-
       accessible processes in the lab.

       If you find any bugs, please report them at <https://bugs.launchpad.net/apparmor/+filebug>.

SEE ALSO
       netstat(8), apparmor(7), apparmor.d(5), aa_change_hat(2), and <http://wiki.apparmor.net>.



AppArmor 2.8.2                                                                                    2017-07-04                                                                                 AA-UNCONFINED(8)
