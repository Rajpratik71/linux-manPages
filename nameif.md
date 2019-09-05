NAMEIF(8)                                                                               Linux's Administrator's Manual                                                                              NAMEIF(8)



NAME
       nameif - name network interfaces based on MAC addresses

SYNOPSIS
       nameif [-c configfile] [-s]
       nameif [-c configfile] [-s] [interface macaddress]
       nameif [-c configfile] [-r] [newifname oldifname]

DESCRIPTION
       nameif renames network interfaces based on mac addresses or interface names.  When no arguments are given /etc/mactab is read. Each line  of it contains an interface name and a Ethernet MAC address.
       Comments are allowed starting with #.  Otherwise the interfaces specified on the command line are processed.  nameif looks for the interface with the given MAC address  or  old  interface  name  and
       renames it to the name given.

OPTIONS
       [-s|--syslog]
              Log all error messages to syslog.

       [-r|--rename]
              Rename the interface given by oldifname to the new name newifname without consulting any macaddress.

       [-c|--config-file configfile]
              Read configfile instead of /etc/mactab.


NOTES
       nameif should be run before the interface is up, otherwise it'll fail.


FILES
       /etc/mactab

BUGS
       Only works for Ethernet currently.



net-tools                                                                                        18 Oct 2000                                                                                        NAMEIF(8)
