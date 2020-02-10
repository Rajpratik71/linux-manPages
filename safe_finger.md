SAFE_FINGER(8)                                                                          Linux Programmer's Manual                                                                          SAFE_FINGER(8)

NAME
       safe_finger - finger client wrapper that protects against nasty stuff from finger servers

SYNOPSIS
       safe_finger [finger_options]

DESCRIPTION
       The  safe_finger  command  protects  against  nasty  stuff from finger servers. Use this program for automatic reverse finger probes from the tcp_wrapper (tcpd) , not the raw finger command. The
       safe_finger command makes sure that the finger client is not run with root privileges. It also runs the finger client with a defined PATH environment.  safe_finger will  also  protect  you  from
       problems  caused  by the output of some finger servers. The problem: some programs may react to stuff in the first column. Other programs may get upset by thrash anywhere on a line. File systems
       may fill up as the finger server keeps sending data. Text editors may bomb out on extremely long lines.  The finger server may take forever because it is somehow wedged.  safe_finger takes  care
       of all this badness.

SEE ALSO
       hosts_access(5), hosts_options(5), tcpd(8)

AUTHOR
       Wietse Venema, Eindhoven University of Technology, The Netherlands.

Linux                                                                                         21th June 1997                                                                               SAFE_FINGER(8)
