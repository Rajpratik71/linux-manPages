IRDPRESPONDER(1)                                              General Commands Manual                                             IRDPRESPONDER(1)

NAME
       irdpresponder - irdpresponder packet sender

DESCRIPTION
       This  manual page documents briefly the irdpresponder command.  This manual page was written for the Debian distribution because the origi‐
       nal program does not have a manual page.

       -v verbose

       -P enable promiscuous mode

       -i <interface> interface

       -p <preference> preference of this entry, default is 0

       -l <lifetime> lifetime of the entry, default: 1800

       -S <spoofed source IP> maybe you need this

       -D <destination IP> If you don't specify this, the broadcast address is used

AUTHOR
       This manual page was written by Vince Mulhollon <vlm@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                  January 1, 2003                                                 IRDPRESPONDER(1)
