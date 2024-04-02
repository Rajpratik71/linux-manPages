IRCP(1)                                                            User commands                                                           IRCP(1)

NAME
       ircp - send or receive files via infrared connection

SYNOPSIS
       ircp [-r [destination]]

       ircp [file...]

DESCRIPTION
       ircp is a small utility to transfer files from or to a remote Linux machine, Windows computer, or various PDAs by using an infrared (IrDA)
       port. It is designed for working e.g. with Quickbeam.

       This program is designed to be an example application for the openobex library.

OPTIONS
       -r
           Use ircp to receive files. If destination is given, the received files are stored in that directory; if not, the files are copied to
           your current directory. If this options is not given, the specified files are sent

SEE ALSO
       irobex_palm3(1), irxfer(1)

AUTHOR
       Hendrik Sattler <post@hendrik-sattler.de>
           initial version of manpage

openobex 1.7.1                                                      05/24/2016                                                             IRCP(1)
