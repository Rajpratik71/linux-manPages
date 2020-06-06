GNUNET-TESTBED-PROFILER(1)             General Commands Manual             GNUNET-TESTBED-PROFILER(1)

NAME
       gnunet-testbed-profiler - Profiling driver for the testbed.

SYNOPSIS
       gnunet-testbed-profiler [options]

DESCRIPTION
       gnunet-testbed-profiler is a command line profiling driver for the testbed.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -e COUNT,  --num-errors=COUNT
              Tolerate COUNT number of continious timeout failures.

       -H FILENAME,  --hosts=FILENAME
              Name of the file with the login information for the testbed.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -l LOGFILE, --logfile=LOGFILE
              Configure logging to write logs to LOGFILE.

       -n, --non-interactive
              Run  profiler  in  non-interactive  mode where upon testbed setup the profiler does not
              wait for a keystroke but continues to run until a termination signal is received.

       -p COUNT, --num-peers=COUNT
              Create COUNT number of peers.

       -v, --version
              Print GNUnet version number.

BUGS
       Report bugs by using Mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

GNUnet                                       Sep 13, 2014                  GNUNET-TESTBED-PROFILER(1)
