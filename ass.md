ASS(1)                                                        General Commands Manual                                                       ASS(1)

NAME
       ass - autonomous system scanner

SYNOPSIS
       ass  [-v[v[v]]]  -i <interface> [-p] [-c] [-A] [-M] [-P IER12] -a <autonomous system start> -b <autonomous system stop> [-S <spoofed source
       IP>] [-D <destination ip>] [-T <packets per delay>]

DESCRIPTION
       This manual page documents briefly the ass command.  This manual page was written for the Debian distribution because the original  program
       does not have a manual page.

       ASS,  the  autonomous  system  scanner,  is designed to find the AS of the router.  It supports the following protocols: IRDP, IGRP, EIGRP,
       RIPv1, RIPv2, CDP, HSRP and OSPF.

       In passive mode (./ass -i eth0), it just listens to routing protocol packets (like broadcast and multicast hellos).

       In active mode (./ass -i eth0 -A), it tries to discover routers by asking for information. This is done to the appropriate address for each
       protocol  (either broadcast or multicast addresses). If you specify a destination address, this will be used but may be not as effective as
       the defaults.

       EIGRP scanning is done differently: While scanning, ASS listens for HELLO packets and then scans the AS directly on the router  who  adver‐
       tised  himself. You can force EIGRP scanning into the same AS-Scan behavior as IGRP uses by giving a destination or into multicast scanning
       by the option -M.

       For Active mode, you can select the protocols you want to scan for. If you don't select them, all are scanned. You select protcols by  giv‐
       ing the option -P and any combination of the following chars: IER12, where:

       I = IGRP

       E = EIGRP

       R = IRDP

       1 = RIPv1

       2 = RIPv2

       ASS output might look a little strange, but has it's meanings:

       Routers  are  identified  by the sender's IP address of the packet. This may lead to several routers showing up as more then one since they
       used different sender interfaces. In the brackets, the protocols this router runs are shown.

       Routing protocols are shown as one or more indented lines. First, there is the routing protocol name (like EIGRP), followed by the  autono‐
       mous system number in brackets. Aligned to the right is the target network if applicable.

       IGRP routing info shows the target network and in brackets the following values: Delay, Bandwidth, MTU, Reliability, Load and Hopcount.

       The IRDP info is limmited to the announced gateway (router) and it's preference

       RIPv1 info just gives you the classified target network (remember RIPv1 network boundaries) and it's metric

       RIPv2  info contains after the target network the following infos: Netmask, next hop, arbitrary tag, and the metric. An additional line may
       appear on the routers section that gives you the authentication if enabled in the protocol. For text auth, the password is there.

       The basic EIGRP just gives you the autonomous system number, the IOS and EIGRP version as found in the HELLO packet

       The EIGRP routes section depends on the type of route. All of them include the fields destination network, destination mask and in the last
       line  (in  brackets)  the  values  for  Delay, Bandwidth, MTU, Reliability, Load and Hopcount. External routes also include the originating
       router, the originating autonomous system, the external metric and the source of this route.

       HSRP info is not routing, therefore the third field is the virtual IP address of the standby group, followed by the state, the auth string,
       Hello, Hold and priority values.

       OSPF  info includes the destination network as well as the Area in IP format, the authentication used (and, if applicable the auth string),
       netmask, designated and backup router and the values for Dead, Priority and Hello.

OPTIONS
       A summary of options is included below.

       -h     Show summary of options.

       -i <interface>
              interface

       -v     verbose mode

       -A     Active mode scanning

       -P <protocols>
              Select protocols to scan

       -M     EIGRP systems are scanned using the multicast address and not by HELLO enumeration and direct query

       -a <autonomous system>
              autonomous system to start from

       -b <autonomous system>
              autonomous system to stop with

       -S <spoofed source IP>
              maybe you need this

       -D <destination IP>
              If you don't specify this, the appropriate address per protocol is used

       -p     don't run in promiscuous mode (bad idea)

       -c     terminate after scanning. This is not recommened since answers may arrive later and you could see some traffic that did not show  up
              during your scans

       -T <packets per delay>
              how many packets should we wait some milliseconds (-T 1 is the slowest scan -T 100 begins to become unreliable)

AUTHOR
       This manual page was written by Vince Mulhollon <vlm@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                 December 16, 2002                                                          ASS(1)
