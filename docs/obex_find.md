OBEX_FIND(1)                                                       User commands                                                      OBEX_FIND(1)

NAME
       obex_find - Find connectable OBEX devices (IrDA, USB).

SYNOPSIS
       obex_find [transport...]

DESCRIPTION
       obex_tcp is a small utility to find devices that support OBEX. If no transport is specified, all OpenOBEX transports that have search
       capability are tried. Currently, supported transports are "irda" and "usb".

       This program is designed to be an example application for the openobex library.

AUTHOR
       Hendrik Sattler <post@hendrik-sattler.de>
           initial version of manpage

openobex 1.7.1                                                      05/24/2016                                                        OBEX_FIND(1)
