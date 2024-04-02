PMERGE(1)                                                   BSD General Commands Manual                                                  PMERGE(1)

NAME
     pmerge — merge multiple PCAP files in timeline order

SYNOPSIS
     pmerge {-h | -v}
     pmerge [-o OUTPUT] [-] [INPUT ...]

DESCRIPTION
     The basic concept for this utility is to merge multiple PCAP files while maintaining timeline order.

     The available options are as follows:

     -h                usage information
     -v                the program's version
     -o OUTPUT         sets the output filename to OUTPUT.  [default: stdout]
     INPUT ...         PCAP files to read for input.  ‘-’ may be specified to signify stdin.  [default: stdin]

EXAMPLES
     As a filter:
           $ pmerge one.pcap two.pcap > merged.pcap

     In simple command form:
           $ pmerge -o merged.pcap one.pcap two.pcap

SEE ALSO
     p4split(1), pcat(1), puniq(1)

AUTHORS
     Zephyr <zephyr@dirtbags.net>,
     pi-rho <pi-rho@tyr.cx>

BUGS
     Bugs may be submitted at ⟨https://bugs.launchpad.net/netre-tools⟩

Network RE Toolkit 1.1337                                        February 1, 2013                                        Network RE Toolkit 1.1337
