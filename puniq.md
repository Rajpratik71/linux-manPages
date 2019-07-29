PUNIQ(1)                                                    BSD General Commands Manual                                                   PUNIQ(1)

NAME
     puniq — filter one to many PCAP files for unique frames

SYNOPSIS
     puniq {-h | -v}
     puniq [-o OUTPUT] [-] [INPUT ...]

DESCRIPTION
     The basic concept for this utility is to filter one to many PCAP files for unique frames

     The available options are as follows:

     -h                usage information
     -v                the program's version
     -o OUTPUT         sets the output filename to OUTPUT.  stdout.
     INPUT ...         PCAP files to read for input.  ‘-’ may be specified to signify stdin.  [default: stdin]

EXAMPLES
     As a filter:
           $ puniq one.pcap two.pcap > unique.pcap

     In simple command form:
           $ puniq -o unique.pcap one.pcap two.pcap

SEE ALSO
     p4split(1), pcat(1), pmerge(1)

AUTHORS
     Zephyr <zephyr@dirtbags.net>,
     pi-rho <pi-rho@tyr.cx>

BUGS
     Bugs may be submitted at ⟨https://bugs.launchpad.net/netre-tools⟩

Network RE Toolkit 1.1337                                        February 1, 2013                                        Network RE Toolkit 1.1337
