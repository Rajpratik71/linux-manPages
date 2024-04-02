P4SPLIT(1)                                                  BSD General Commands Manual                                                 P4SPLIT(1)

NAME
     p4split — split a PCAP based on CIDR filter

SYNOPSIS
     p4split {-h | -v}
     p4split [-i INPUT] ⟨CIDR filter⟩

DESCRIPTION
     The basic concept for this utility is to filter and split a PCAP packet capture file into smaller files. This utility will create up to 256
     smaller files.

     The available options are as follows:

     -h      usage information
     -v      the program's version
     -i INPUT
             INPUT is used as input [default: stdin]
     ⟨CIDR filter⟩
             A filter in CIDR notation (a.dd.re.ss/subnet-bits)

EXAMPLES
     As a filter:
           $ ... | p4split 192.168.1.0/24

     With an input file specified:
           $ p4split -i big.pcap 192.168.1.0/24

SEE ALSO
     pcat(1), pmerge(1), puniq(1)

AUTHORS
     Zephyr <zephyr@dirtbags.net>,
     pi-rho <pi-rho@tyr.cx>

BUGS
     Bugs may be submitted at ⟨https://bugs.launchpad.net/netre-tools⟩

Network RE Toolkit 1.1337                                        February 1, 2013                                        Network RE Toolkit 1.1337
