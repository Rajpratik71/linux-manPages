NTPSWEEP(1)                                                   General Commands Manual                                                  NTPSWEEP(1)

NAME
       ntpsweep - Sweep NTP Servers and Report Relationships

SYNOPSIS
       ntpsweep [ --help|--peers|--strip <string>] <file>|[--host <hostname> ]

DESCRIPTION
       ntpsweep  prints  per host given in <file> the NTP stratum level, the clock offset in seconds, the daemon version, the operating system and
       the processor.

OPTIONS
       --help Print this short help text and exit.

       <file> Specify the hosts file. File format is one hostname or ip number per line. Lines beginning with # are considered as comment.

       --host <hostname>
              Speficy a single host, bypassing the need for a hosts file.

       --peers
              List all peers a host synchronizes to.

       --strip <string>
              Strip <string> from hostnames.

AUTHOR
       Hans Lambermont.  Manpage by Bdale Garbee <bdale@gag.com> for the Debian GNU/Linux distribution.

                                                                                                                                       NTPSWEEP(1)
