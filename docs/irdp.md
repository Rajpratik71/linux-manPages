IRDP(1)                                                       General Commands Manual                                                      IRDP(1)

NAME
       irdp - irdp packet sender

DESCRIPTION
       This manual page documents briefly the irdp command.  This manual page was written for the Debian distribution because the original program
       does not have a manual page.

       This tool sends out IRDP responses. Nothing else ;)

       Usage:

       -i <interface> interface

       -p <preference> preference of this entry, default is 0

       -l <lifetime> lifetime of the entry, default: 1800

       -S <spoofed source IP> maybe you need this

       -D <destination IP> If you don't specify this, the broadcast address is used

AUTHOR
       This manual page was written by Vince Mulhollon <vlm@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                  January 1, 2003                                                          IRDP(1)
