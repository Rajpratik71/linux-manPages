NASL(1)                                                  Nessus Attack Scripting Language                                                  NASL(1)

NAME
       openvas-nasl - Nessus Attack Scripting Language

SYNOPSIS
       openvas-nasl <[-vh] [-T tracefile] [-s] [-t target] [-c config_file] [-d] [-sX] > files...

DESCRIPTION
       openvas-nasl  executes  a set of NASL scripts against a given target host. It can also be used to determine if a NASL script has any syntax
       errors by running it in parse (-p) or lint (-L) mode.

OPTIONS
       -T tracefile
              Makes nasl write verbosely what the script does in the file tracefile , ala 'set -x' under sh

       -t target
              Apply the NASL script to target which may be a  single  host  (127.0.0.1),  a  whole  subnet  (192.168.1.0/24)  or  several  subnets
              (192.168.1.0/24, 192.168.243.0/24)

       -e iface
              Specifies the network interface to be used as the source for established connections.

       -s     Sets the return value of safe_checks() to 1. (See the OpenVAS documentation to know what the safe checks are) Implies -B.

       -D     Only run the description part of the script.

       -B     Runs in description mode before running the script.

       -L     Lint the script  (run extended checks).

       -X     Run the script in authenticated mode. For more information see the nasl reference manual

       -h     Show help

       -v     Show the version of NASL.

       -d     Output debug information to stderr.

       -k key=value
              Set KB key to vaue. Can be used multiple times.

SEE ALSO
       The NASL2 reference manual openvassd(8).

HISTORY
       NASL  comes from a private project called 'pkt_forge', which was written in late 1998 by Renaud Deraison and which was an interactive shell
       to forge and send raw IP packets (this pre-dates Perl's Net::RawIP by a couple of weeks). It was then extended to do a wide range  of  net‐
       work-related operations and integrated into Nessus as 'NASL'.

       The  parser was completely hand-written and a pain to work with. In Mid-2002, Michel Arboi wrote a bison parser for NASL, and he and Renaud
       Deraison re-wrote NASL from scratch. Although the "new" NASL was nearly working as early as August 2002, Michel's laziness made us wait for
       early 2003 to have it working completely.

AUTHOR
       Most of the engine is (C) 2003 Michel Arboi, most of the built-in functions are (C) 2003 Renaud Deraison

OpenVAS Project                                                      May 2006                                                              NASL(1)
