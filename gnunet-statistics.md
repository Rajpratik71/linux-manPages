GNUNET-STATISTICS(1)                   General Commands Manual                   GNUNET-STATISTICS(1)

NAME
       gnunet-statistics - Display statistics about your GNUnet system

SYNOPSIS
       gnunet-statistics [options] [VALUE]

DESCRIPTION
       gnunet-statistics  is  used  to  display detailed information about various aspect of GNUnet's
       operation.  This tool only works if the "statistics" service is available.   gnunet-statistics
       can be used to set a value by giving the options -n, -s and also a VALUE.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -n NAME,  --name=NAME
              Each  statistic has a name that is unique with in its subsystem.  With this option, the
              output can be restricted to statistics that have a particular name.

       -p,  --persistent
              When setting a value, make the value persistent.  If the value used  to  be  persistent
              and this flag is not given, it will be marked as non-persistent.

       -s SUBSYSTEM,  --subsystem=SUBSYSTEM
              Statistics  are  kept  for  various  subsystems.   With  this option, the output can be
              restricted to a particular subsystem only.

       -v, --version
              Print GNUnet version number.

BUGS
       Report bugs by using Mantis <https://gnunet.org/mantis/> or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-service-statistics(1)

GNUnet                                       Jan 4, 2012                         GNUNET-STATISTICS(1)
