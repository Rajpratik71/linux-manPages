GNUNET-MESH(1)                         General Commands Manual                         GNUNET-MESH(1)

NAME
       gnunet-mesh - Print information about mesh tunnels and peers

SYNOPSIS
       gnunet-mesh [options]

DESCRIPTION
       gnunet-mesh prints information about mesh tunnels and peers.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -l LOGFILE, --logfile=LOGFILE
              Configure logging to write logs to LOGFILE.

       -m, --monitor
              Provide information about all tunnels (continuously) NOT IMPLEMENTED.

       -t OWNER_ID:TUNNEL_ID, --tunnel=OWNER_ID:TUNNEL_ID
              Provide information about a particular tunnel.

       -v, --version
              Print GNUnet version number.

BUGS
       Report  bugs  by  using  Mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

GNUnet                                       Jan 31, 2014                              GNUNET-MESH(1)
