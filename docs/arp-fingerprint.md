ARP-FINGERPRINT(1)                                            General Commands Manual                                           ARP-FINGERPRINT(1)

NAME
       arp-fingerprint - Fingerprint a system using ARP

SYNOPSIS
       arp-fingerprint [options] target

       The target should be specified as a single IP address or hostname.  You cannot specify multiple targets, IP networks or ranges.

       If  you  use  an  IP address for the target, you can use the -o option to pass the --numeric option to arp-scan, which will prevent it from
       attempting DNS lookups.  This can speed up the fingerprinting process, especially on systems with a slow or faulty DNS configuration.

DESCRIPTION
       arp-fingerprint fingerprints the specified target host using the ARP protocol.

       It sends various different types of ARP request to the target, and records which types it responds to. From this, it constructs  a  finger‐
       print  string  consisting  of  "1" where the target responded and "0" where it did not.  An example of a fingerprint string is 01000100000.
       This fingerprint string is then used to lookup the likely target operating system.

       Many of the fingerprint strings are shared by several operating systems, so there is not always a one-to-one  mapping  between  fingerprint
       strings  and operating systems. Also the fact that a system's fingerprint matches a certain operating system (or list of operating systems)
       does not necessarily mean that the system being fingerprinted is that operating system, although it is quite likely. This  is  because  the
       list  of  operating  systems is not exhaustive; it is just what I have discovered to date, and there are bound to be operating systems that
       are not listed.

       The ARP fingerprint of a system is generally a function of that system's kernel (although it is possible for the ARP function to be  imple‐
       mented in user space, it almost never is).

       Sometimes,  an operating system can give different fingerprints depending on the configuration.  An example is Linux, which will respond to
       a non-local source IP address if that IP is routed through the interface being tested.  This is both good and bad: on one hand it makes the
       fingerprinting task more complex; but on the other, it can allow some aspects of the system configuration to be determined.

       Sometimes  the  fact  that two different operating systems share a common ARP fingerprint string points to a re-use of networking code. One
       example of this is Windows NT and FreeBSD.

       arp-fingerprint uses arp-scan to send the ARP requests and receive the replies.

       There are other methods that can be used to fingerprint a system using arp-scan which can be used in addition  to  arp-fingerprint.   These
       additional  methods are not included in arp-fingerprint either because they are likely to cause disruption to the target system, or because
       they require knowledge of the target's configuration that may not always be available.

       arp-fingerprint is still being developed, and the results should not be relied on. As most of the ARP requests that it sends are  non-stan‐
       dard, it is possible that it may disrupt some systems, so caution is advised.

       If  you  find  a  system  that  arp-fingerprint reports as UNKNOWN, and you know what operating system it is running, could you please send
       details of the operating system and fingerprint to arp-scan@nta-monitor.com so I can include it in  future  versions.  Please  include  the
       exact version of the operating system if you know it, as fingerprints sometimes change between versions.

OPTIONS
       -h     Display a brief usage message and exit.

       -v     Display verbose progress messages.

       -o <option-string>
              Pass specified options to arp-scan. You need to enclose the options string in quotes if it contains spaces. e.g.  -o "-I eth1".  The
              commonly used options are --interface (-I) and --numeric (-N).

EXAMPLES
       $ arp-fingerprint 192.168.0.1
       192.168.0.1   01000100000     Linux 2.2, 2.4, 2.6

       $ arp-fingerprint -o "-N -I eth1" 192.168.0.202
       192.168.0.202 11110100000     FreeBSD 5.3, Win98, WinME, NT4, 2000, XP, 2003

NOTES
       arp-fingerprint is implemented in Perl, so you need to have the Perl interpreter installed on your system to use it.

AUTHOR
       Roy Hills <Roy.Hills@nta-monitor.com>

SEE ALSO
       arp-scan(1)

       http://www.nta-monitor.com/wiki/ The arp-scan wiki page.

                                                                   April 5, 2007                                                ARP-FINGERPRINT(1)
