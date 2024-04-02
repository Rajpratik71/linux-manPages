GNUNET-ARM(1)                          General Commands Manual                          GNUNET-ARM(1)

NAME
       gnunet-arm - control GNUnet services

SYNOPSIS
       gnunet-arm [options]

DESCRIPTION
       gnunet-arm  can  be  used  to start or stop GNUnet services, including the ARM service itself.
       The ARM service is a supervisor for GNUnet's service processes.  ARM starts services on-demand
       or as configured and re-starts them if they crash.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -e, --end
              Shutdown  all  GNUnet  services (including ARM itself).  Running "gnunet-arm -e" is the
              usual way to shutdown a GNUnet peer.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -i SERVICE,  --init=SERVICE
              Starts the specified SERVICE if it is not already  running.   More  specifically,  this
              makes the service behave as if it were in the default services list.

       -k SERVICE,  --kill=SERVICE
              Stop  the  specified  SERVICE if it is running.  While this will kill the service right
              now, the service may be restarted immediately if other services depend on  it  (service
              is  then  started  'on-demand').   If  the  service used to be a 'default' service, its
              default-service status will be revoked.  If the service was not a default  service,  it
              will just be (temporarily) stopped, but could be re-started on-demand at any time.

       -m, --monitor
              Monitor  service  activity  of ARM.  In this mode, the command will not terminate until
              the user presses CTRL-C.

       -s, --start
              Start all GNUnet default services on this system (and also ARM).  Naturally, if a  ser‐
              vice  is demanded by a default service, it will then also be started.  Running "gnunet-
              arm -s" is the usual way to start a GNUnet peer.

       -I, --info
              List all running services.

       -v, --version
              Print GNUnet version number.

BUGS
       Report bugs by using Mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-service-arm(1)

GNUnet                                       Jan 4, 2012                                GNUNET-ARM(1)
