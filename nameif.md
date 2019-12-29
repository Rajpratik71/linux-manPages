NAMEIF(8)                         Linux System Administrator's Manual                        NAMEIF(8)

NAME
       nameif - name network interfaces based on MAC addresses

SYNOPSIS
       nameif [-c configfile] [-s]
       nameif [-c configfile] [-s] {interface macaddress}

DESCRIPTION
       nameif  renames  network  interfaces  based  on  mac  addresses.  When  no  arguments are given
       /etc/mactab is read. Each line  of it contains an interface name and a  Ethernet  MAC  address.
       Comments  are  allowed starting with #.  Otherwise the interfaces specified on the command line
       are processed.  nameif looks for the interface with the given MAC address and renames it to the
       name given.

       When the -s argument is given all error messages go to the syslog.

       When the -c argument is given with a file name that file is read instead of /etc/mactab.

NOTES
       nameif should be run before the interface is up, otherwise it'll fail.

FILES
       /etc/mactab

BUGS
       Only works for Ethernet currently.

net-tools                                     2008-10-03                                     NAMEIF(8)
