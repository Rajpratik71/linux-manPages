YERSINIA(8)                                                                                                                            YERSINIA(8)

NAME
       Yersinia - A Framework for layer 2 attacks

SYNOPSIS
       yersinia [-hVGIDd] [-l logfile] [-c conffile] protocol [-M] [protocol_options]

DESCRIPTION
       yersinia is a framework for performing layer 2 attacks. The following protocols have been implemented in Yersinia current version: Spanning
       Tree Protocol (STP), VLAN Trunking Protocol (VTP), Hot Standby Router Protocol (HSRP), Dynamic Trunking Protocol (DTP), IEEE  802.1Q,  IEEE
       802.1X,  Cisco  Discovery  Protocol  (CDP),  Dynamic Host Configuration Protocol (DHCP), Inter-Switch Link Protocol (ISL) and MultiProtocol
       Label Switching (MPLS).

       Some of the attacks implemented will cause a DoS in a network, other will help to perform any other more advanced attack, or both. In addi‐
       tion, some of them will be first released to the public since there isn't any public implementation.

       Yersinia will definitely help both pen-testers and network administrators in their daily tasks.

       Some  of  the mentioned attacks are DoS attacks, so TAKE CARE about what you're doing because you can convert your network into an UNSTABLE
       one.

       A lot of examples are given at this page EXAMPLES section, showing a real and useful program execution.

OPTIONS
       -h, --help
              Help screen.

       -V, --Version
              Program version.

       -G     Start a graphical GTK session.

       -I, --interactive
              Start an interactive ncurses session.

       -D, --daemon
              Start the network listener for remote admin (Cisco CLI emulation).

       -d     Enable debug messages.

       -l logfile
              Save the current session to the file logfile. If logfile exists, the data will be appended at the end.

       -c conffile
              Read/write configuration variables from/to conffile.

       -M     Disable MAC spoofing.

PROTOCOLS
       The following protocols are implemented in yersinia current version:

       Spanning Tree Protocol (STP and RSTP)

       Cisco Discovery Protocol (CDP)

       Hot Standby Router Protocol (HSRP)

       Dynamic Host Configuration Protocol (DHCP)

       Dynamic Trunking Protocol (DTP)

       IEEE 802.1Q

       VLAN Trunking Protocol (VTP)

       Inter-Switch Link Protocol (ISL)

       IEEE 802.1X

       MultiProtocol Label Switching (MPLS)

PROTOCOLS OPTIONS
       Spanning Tree Protocol (STP): is a link management protocol that provides path redundancy while preventing undesirable loops  in  the  net‐
       work. The supported options are:

       -version version
              BPDU version (0 STP, 2 RSTP, 3 MSTP)

       -type type
              BPDU type (Configuration, TCN)

       -flags flags
              BPDU Flags

       -id id BPDU ID

       -cost pathcost
              BPDU root path cost

       -rootid id
              BPDU Root ID

       -bridgeid id
              BPDU Bridge ID

       -portid id
              BPDU Port ID

       -message secs
              BPDU Message Age

       -max-age secs
              BPDU Max Age (default is 20)

       -hello secs
              BPDU Hello Time (default is 2)

       -forward secs
              BPDU Forward Delay

       -source hw_addr
              Source MAC address

       -dest hw_addr
              Destination MAC address

       -interface iface
              Set network interface to use

       -attack attack
              Attack to launch

       Cisco  Discovery  Protocol  (CDP): is a Cisco propietary Protocol which main aim is to let Cisco devices to communicate to each other about
       their device settings and protocol configurations. The supported options are:

       -source hw_addr
              MAC Source Address

       -dest hw_addr
              MAC Destination Address

       -v version
              CDP Version

       -ttl ttl
              Time To Live

       -devid id
              Device ID

       -address address
              Device Address

       -port id
              Device Port

       -capability cap
              Device Capabilities

       -version version
              Device IOS Version

       -duplex 0|1
              Device Duplex Configuration

       -platform platform
              Device Platform

       -ipprefix ip
              Device IP Prefix

       -phello hello
              Device Protocol Hello

       -mtu mtu
              Device MTU

       -vtp_mgm_dom domain
              Device VTP Management Domain

       -native_vlan vlan
              Device Native VLAN

       -voip_vlan_r req
              Device VoIP VLAN Reply

       -voip_vlan_q query
              Device VoIP VLAN Query

       -t_bitmap bitmap
              Device Trust Bitmap

       -untrust_cos cos
              Device Untrusted CoS

       -system_name name
              Device System Name

       -system_oid oid
              Device System ObjectID

       -mgm_address address
              Device Management Address

       -location location
              Device Location

       -attack attack
              Attack to launch

       Hot Standby Router Protocol (HSRP):

       -source hw_addr
              Source MAC address

       -dest hw_addr
              Destination MAC address

       -interface iface
              Set network interface to use

       -attack attack
              Attack to launch

       Inter-Switch Link Protocol (ISL):

       -source hw_addr
              Source MAC address

       -dest hw_addr
              Destination MAC address

       -interface iface
              Set network interface to use

       -attack attack
              Attack to launch

       VLAN Trunking Protocol (VTP):

       -source hw_addr
              Source MAC address

       -dest hw_addr
              Destination MAC address

       -interface iface
              Set network interface to use

       -attack attack
              Attack to launch

       Dynamic Host Configuration Protocol (DHCP):

       -source hw_addr
              Source MAC address

       -dest hw_addr
              Destination MAC address

       -interface iface
              Set network interface to use

       -attack attack
              Attack to launch

       IEEE 802.1Q:

       -source hw_addr
              Source MAC address

       -dest hw_addr
              Destination MAC address

       -interface iface
              Set network interface to use

       -attack attack
              Attack to launch

       Dynamic Trunking Protocol (DTP):

       -source hw_addr
              Source MAC address

       -dest hw_addr
              Destination MAC address

       -interface iface
              Set network interface to use

       -attack attack
              Attack to launch

       IEEE 802.1X:

       -version arg
              Version

       -type arg
              xxxx

       -eapcode arg
              xxxx

       -eapid arg
              xxxx

       -eaptype arg
              xxxx

       -eapinfo arg
              xxx

       -interface arg
              xxxx

       -source hw_addr
              Source MAC address

       -dest hw_addr
              Destination MAC address

       -interface iface
              Set network interface to use

       -attack attack
              Attack to launch

       MultiProtocol Label Switching (MPLS):

       -source hw_addr
              Source MAC address

       -dest hw_addr
              Destination MAC address

       -interface iface
              Set network interface to use

       -attack attack
              Attack to launch

       -label1 arg
              Set MPLS Label

       -exp1 arg
              Set MPLS Experimental bits

       -bottom1 arg
              Set MPLS Bottom Of Stack flag

       -ttl1 arg
              Set MPLS Time To Live

       -label2 arg
              Set MPLS Label (second header)

       -exp2 arg
              Set MPLS Experimental bits (second header)

       -bottom2 arg
              Set MPLS Bottom Of Stack flag (second header)

       -ttl2 arg
              Set MPLS Time To Live (second header)

       -ipsource ipv4
              Source IP

       -portsource port
              Source TCP/UDP port

       -ipdest ipv4
              Destination IP

       -portdest port
              Destination TCP/UDP port

       -payload ASCII
              ASCII IP payload

ATTACKS
       Attacks Implemented in STP:

           0: NONDOS attack sending conf BPDU

           1: NONDOS attack sending tcn BPDU

           2: DOS attack sending conf BPDUs

           3: DOS attack sending tcn BPDUs

           4: NONDOS attack Claiming Root Role

           5: NONDOS attack Claiming Other Role

           6: DOS attack Claiming Root Role with MiTM

       Attacks Implemented in CDP:

           0: NONDOS attack sending CDP packet

           1: DOS attack flooding CDP table

           2: NONDOS attack Setting up a virtual device

       Attacks Implemented in HSRP:

           0: NONDOS attack sending raw HSRP packet

           1: NONDOS attack becoming ACTIVE router

           2: NONDOS attack becoming ACTIVE router (MITM)

       Attacks Implemented in DHCP:

           0: NONDOS attack sending RAW packet

           1: DOS attack sending DISCOVER packet

           2: NONDOS attack creating DHCP rogue server

           3: DOS attack sending RELEASE packet

       Attacks Implemented in DTP:

           0: NONDOS attack sending DTP packet

           1: NONDOS attack enabling trunking

       Attacks Implemented in 802.1Q:

           0: NONDOS attack sending 802.1Q packet

           1: NONDOS attack sending 802.1Q double enc. packet

           2: DOS attack sending 802.1Q arp poisoning

       Attacks Implemented in VTP:

           0: NONDOS attack sending VTP packet

           1: DOS attack deleting all VTP vlans

           2: DOS attack deleting one vlan

           3: NONDOS attack adding one vlan

           4: DOS attack crashing Catalyst

       Attacks Implemented in 802.1X:

           0: NONDOS attack sending 802.1X packet

           1: NONDOS attack Mitm 802.1X with 2 interfaces

       Attacks Implemented in MPLS:

           0: NONDOS attack sending TCP MPLS packet

           1: NONDOS attack sending TCP MPLS with double header

           2: NONDOS attack sending UDP MPLS packet

           3: NONDOS attack sending UDP MPLS with double header

           4: NONDOS attack sending ICMP MPLS packet

           5: NONDOS attack sending ICMP MPLS with double header

       Attacks Implemented in ISL:

           None at the moment

GTK GUI
       The GTK GUI (-G) is a GTK graphical interface with all of the yersinia powerful features and a professional 'look and feel'.

NCURSES GUI
       The ncurses GUI (-I) is a ncurses (or curses) based console where the user can take advantage of yersinia powerful features.

       Press 'h' to display the Help Screen and enjoy your session :)

NETWORK DAEMON
       The Network Daemon (-D) is a telnet based server (ala Cisco mode) that listens by default in port 12000/tcp  waiting  for  incoming  telnet
       connections.

       It supports a CLI similar to a Cisco device where the user (once authenticated) can display different settings and can launch attacks with‐
       out having yersinia running in her own machine (specially useful for Windows users).

EXAMPLES
       - Send a Rapid Spanning-Tree BPDU with port role designated, port state agreement, learning and port id 0x3000 to eth1:

       yersinia stp -attack 0 -version 2 -flags 5c -portid 3000 -interface eth1

       - Start a Spanning-Tree nonDoS root claiming attack in the first nonloopback interface (keep in mind that this kind of attack will use  the
       first BPDU on the network interface to fill in the BPDU fields properly):

       yersinia stp -attack 4

       - Start a Spanning-Tree DoS attack sending TCN BPDUs in the eth0 interface with MAC address 66:66:66:66:66:66:

       yersinia stp -attack 3 -source 66:66:66:66:66:66

SEE ALSO
       The README file contains more in-depth documentation about the attacks.

COPYRIGHT
       Yersinia is Copyright (c)

BUGS
       Lots

AUTHORS
       Alfredo Andres Omella <alfredo@yersinia.net>
       David Barroso Berrueta <tomac@yersinia.net>

Yersinia v0.7                                              $Date: 2007/04/28 22:48:40 $                                                YERSINIA(8)
