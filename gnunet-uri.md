GNUNET-URI(1)                          General Commands Manual                          GNUNET-URI(1)

NAME
       gnunet-uri - invoke default handler for GNUnet URIs

SYNOPSIS
       gnunet-uri URI

DESCRIPTION
       gnunet-uri  can  be  used to invoke the correct tool to handle a GNUnet URI.  GNUnet URIs have
       the format "gnunet://SUBSYSTEM/DETAILS" and thus the specific tool to handle the  URI  depends
       on the subsystem.  gnunet-uri will determine the correct tool (by looking for SUBSYSTEM in the
       configuration section "uri") and invoke it.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -v, --version
              Print GNUnet version number.

BUGS
       Report bugs by using Mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

GNUnet                                       Jun 26, 2012                               GNUNET-URI(1)
