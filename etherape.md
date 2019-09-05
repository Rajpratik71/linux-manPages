etherape(1)                                                   General Commands Manual                                                  etherape(1)

NAME
       etherape - graphical network traffic browser

SYNOPSIS
       etherape  [ -d ] [ -f filter ] [ --final-export outfile ] [ --glade-file gladefile ] [ -i interface ] [ -l maxnodes ] [ -m operating mode ]
       [ --max-delay delay ] [ --min-delay delay ] [ -n ] [ -q ] [ -r inputfile ] [ -s ] [ --signal-export outfile ]

DESCRIPTION
       EtherApe is a network traffic browser. It displays network activity graphically. It uses GNOME libraries as its user interface,  and  libp‐
       cap, a packet capture and filtering library.

OPTIONS
       These options can be supplied to the command:

       -d, --diagram-only
              don't display any node text identification

       -f, --filter <capture filter>
              set capture filter

       --final-export <export file name>
              when replaying, export to named file at end of replay

       --glade-file <filename>
              uses the named libglade file to load interface instead of the default.

       -i, --interface <interface name>
              set interface to listen to

       -l, --node-limit <number>
              sets the maximum number of node visible

       -m, --mode <link|ip|tcp>
              set mode of operation (default is ip)

       --max-delay <delay in ms>
              caps timestamps to the provided delay when replaying a capture file.

       --min-delay <delay in ms>
              provides a minimum to inter-packet delay when replaying a capture file.

       -n, --numeric
              don't convert addresses to names, disables name resolution.

       -q     disables informational messages.

       -r, --replay-file <file name>
              sets input file to replay

       -s     Place nodes using an alternate algorithm.  Deprecated.

       --signal-export <export file name>
              if specified, enables signal USR1 handling. On receiving USR1, EtherApe will dump its state to the named XML file.

              Beware! the file will be overwritten without asking!

       -?, --help
              show a brief help message

SIGNALS
       USR1   on receipt of signal USR1, and if enabled with --signal-export, EtherApe will dump its state to the chosen xml file.

              Beware! the file will be overwritten without asking!

ENVIRONMENT VARIABLES
       APE_DEBUG=normal|info|debug
              controls debug output verbosity. Debug informations are printed on standard output.

FILES
       Etherape will use /etc/ethers if there is one to convert MAC addresses to names and /etc/services to associate TCP/UDP port numbers to pro‐
       tocol names.

SEE ALSO
       The EtherApe webpage at http://etherape.sourceforge.net/

AUTHORS
       Juan Toledo <toledo@users.sourceforge.net>

       Riccardo Ghetta <bchiara@users.sourceforge.net>

                                                               EtherApe Manual Page                                                    etherape(1)
