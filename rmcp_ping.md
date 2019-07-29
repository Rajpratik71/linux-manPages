rmcp_ping(1)                                                                                IPMI RMCP Ping program                                                                               rmcp_ping(1)



NAME
       rmcp_ping - IPMI RMCP Ping program


SYNOPSIS
       rmcp_ping [-p port] [-t waittime] [-s starttag] [-d] destination


DESCRIPTION
       The rmcp_ping program sends an RMCP ping packet onces a second to the destination, printing unique responses it receives.


OPTIONS
       -p port
              Set the destination port.  This is the standard RMCP port by default, 623.

       -t waittime
              Sets the number of seconds to wait for a response.  Ten by default.

       -s starttag
              There is an 8-bit tag value in every ping packet (0-254, 255 is reserved), this program will cycle through the values starting at starttag.  This is zero by default

       -d     Turns on debugging to standard output.

       destination
              The target address, default is the boradcast address (default 255.255.255.255)


AUTHOR
       Corey Minyard <cminyard@mvista.com>



OpenIPMI                                                                                           02/24/06                                                                                      rmcp_ping(1)
