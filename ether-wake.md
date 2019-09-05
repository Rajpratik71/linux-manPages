ETHER-WAKE(8)                                                                              System Manager's Manual                                                                              ETHER-WAKE(8)



NAME
       ether-wake - A tool to send a Wake-On-LAN "Magic Packet"

SYNOPSIS
       ether-wake [options] Host-ID

DESCRIPTION
       This manual page documents the usage of the ether-wake command.

       ether-wake is a program that generates and transmits a Wake-On-LAN (WOL) "Magic Packet", used for restarting machines that have been soft-powered-down (ACPI D3-warm state). It generates the standard
       AMD Magic Packet format, optionally with a password included.  The single required parameter is a station (MAC) address or a host ID that can be translated to a MAC address by an ethers(5)  database
       specified in nsswitch.conf(5)

OPTIONS
       ether-wake needs a single dash (´-´) in front of options.  A summary of options is included below.

       -b     Send the wake-up packet to the broadcast address.

       -D     Increase the Debug Level.

       -i ifname
              Use interface ifname instead of the default "eth0".

       -p passwd
              Append a four or six byte password to the packet. Only a few adapters need or support this. A six byte password may be specified in Ethernet hex format (00:22:44:66:88:aa) or four byte dotted
              decimal (192.168.1.1) format.  A four byte password must use the dotted decimal format.


       -V     Show the program version information.


EXIT STATUS
       This program returns 0 on success.  A permission failures (e.g. run as a non-root user) results in an exit status of 2.  Unrecognized or invalid parameters result in an exit status of 3.  Failure to
       retrieve network interface information or send a packet will result in an exit status of 1.


SEE ALSO
       arp(8).

SECURITY
       On some non-Linux systems dropping root capability allows the process to be dumped, traced or debugged.  If someone traces this program, they get control of a raw socket.  Linux handles this safely,
       but beware when porting this program.

AUTHOR
       The ether-wake program was written by Donald Becker at Scyld Computing Corporation for use with the Scyld(™) Beowulf System.



Scyld                                                                                           March 31, 2003                                                                                  ETHER-WAKE(8)
