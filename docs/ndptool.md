ndptool(8)                                                                                 System Manager's Manual                                                                                 ndptool(8)



NAME
       ndptool — Neighbor Discovery Protocol tool

SYNOPSIS
       ndptool -h

       ndptool [OPTIONS] COMMAND


       DESCRIPTION

       ndptool is a tool which provides wrapper over Neighbor Discovery Protocol messages.


OPTIONS
       -h, --help
              Print help text to console and exit.


       -v, --verbose
              Increase output verbosity.


       -t type, --msg-type type
              Specified message type. Following are supported:

              rs - Router Solicitation.

              ra - Router Advertisement.

              ns - Neighbor Solicitation.

              na - Neighbor Advertisement.


       -i ifname, --ifname ifname
              Specified interface name.


       -T target, --target target
              Specified target address for NS/NA message.


       -U, --unsolicited
              Send Unsolicited NA.


COMMAND
       monitor
              Monitor incoming NDP messages and print them out.


       send   Send NDP message of specified type.


AUTHOR
       Jiri Pirko is the original author and current maintainer of libndp.



libndp                                                                                          16 April 2013                                                                                      ndptool(8)
