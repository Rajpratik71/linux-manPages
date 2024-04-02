IFENSLAVE(8)                                                                             BSD System Manager's Manual                                                                             IFENSLAVE(8)

NAME
     ifenslave — Attach and detach slave network devices to a bonding device.

SYNOPSIS
     ifenslave [-acdfhuvV] [--all-interfaces] [--change-active] [--detach] [--force] [--help] [--usage] [--verbose] [--version] master slave ...

DESCRIPTION
     ifenslave is a tool to attach and detach slave network devices to a bonding device.  A bonding device will act like a normal Ethernet network device to the kernel, but will send out the packets via
     the slave devices using a simple round-robin scheduler.  This allows for simple load-balancing, identical to "channel bonding" or "trunking" techniques used in switches.

     The kernel must have support for bonding devices for ifenslave to be useful.

OPTIONS
     -a, --all-interfaces
             Show information about all interfaces.

     -c, --change-active
             Change active slave.

     -d, --detach
             Removes slave interfaces from the bonding device.

     -f, --force
             Force actions to be taken if one of the specified interfaces appears not to belong to an Ethernet device.

     -h, --help
             Display a help message and exit.

     -u, --usage
             Show usage information and exit.

     -v, --verbose
             Print warning and debug messages.

     -V, --version
             Show version information and exit.
     If not options are given, the default action will be to enslave interfaces.

EXAMPLE
     The following example shows how to setup a bonding device and enslave two real Ethernet devices to it:

     # modprobe bonding
     # ifconfig bond0 192.168.0.1 netmask 255.255.0.0
     # ifenslave bond0 eth0 eth1

AUTHOR
     ifenslave was originally written by Donald Becker <becker@cesdis.gsfc.nasa.gov>, and has since been updated by various kernel developers.

     This manual page was written by Guus Sliepen <guus@debian.org> for the Debian GNU/Linux system.

                                                                                               October 1, 2019
