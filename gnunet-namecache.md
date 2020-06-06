GNUNET-NAMECACHE(1)                    General Commands Manual                    GNUNET-NAMECACHE(1)

NAME
       gnunet-namecache - inspect namecache

SYNOPSIS
       gnunet-namecache [options]-zPKEY-nLABEL

DESCRIPTION
       gnunet-namecache can be used to inspect values in the namecache.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -n NAME, --name=NAME
              Name (label) of the record to display (mandatory option)

       -v, --version
              Print GNUnet version number.

       -z PKEY, --zone=PKEY
              Specifies the public key of the zone to inspect (mandatory option)

BUGS
       Report  bugs  by  using  Mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-gns(1)

GNUnet                                       Oct 16, 2013                         GNUNET-NAMECACHE(1)
