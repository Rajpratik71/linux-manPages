IROBEX_PALM3(1)                                                    User commands                                                   IROBEX_PALM3(1)

NAME
       irobex_palm3 - Send to or receive files from a Palm handheld device

SYNOPSIS
       irobex_palm3 [-h creator_id] [file...]

DESCRIPTION
       irobex_palm3 is a small utility to transfer files from or to a Palm handheld device by using an infrared (IrDA) port. If no parameter is
       specified, the program goes into receive mode.

       This program is designed to be an example application for the openobex library.

OPTIONS
       -h
           Choose a creator ID, e.g. "memo", "addr", "todo", "date" or "Inch". The id must be exactly 4 characters long and serves as hint for the
           remote device and thus may be case-sensitive. The default is "memo".

SEE ALSO
       ircp(1), irxfer(1)

AUTHOR
       Hendrik Sattler <post@hendrik-sattler.de>
           initial version of manpage

openobex 1.7.1                                                      05/24/2016                                                     IROBEX_PALM3(1)
