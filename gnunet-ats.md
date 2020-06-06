GNUNET-ATS(1)                          General Commands Manual                          GNUNET-ATS(1)

NAME
       gnunet-ats - display information about transport resource allocation

SYNOPSIS
       gnunet-ats [options]

DESCRIPTION
       gnunet-ats  can  be  used to display information about the GNUnet's transport selection mecha‐
       nism. It shows information about the addresses and the assigned input and output bandwidth.

OPTIONS
       -a,  --aa
              List all addresses currently known to ats.

       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -h, --help
              Print short help on options.

       -i, --id=PEERID
              Print information for a specific peer identity only

       -k, --value=VALUE
              Value to set for when changing preference values

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -m, --monitor
              Monitor changes to the bandwidth assignments continuously

       -n, --numeric
              Do not resolve IP addresses to hostnames

       -k, --preference=E
              Set preference values, -i, -k and -t required

       -q, --quotas
              Print quotas for all network types

       -t, --type=VALUE
              Preference type to change: latency | bandwidth

       -u, --used
              Print addresses actively used only

       -V, --verbose
              Print verbose output (include ATS address properties)

       -v, --version
              Print GNUnet version number.

BUGS
       Report bugs by using Mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <bug-gnunet@gnu.org>

SEE ALSO
       gnunet-transport(1)

GNUnet                                       Oct 31, 2012                               GNUNET-ATS(1)
