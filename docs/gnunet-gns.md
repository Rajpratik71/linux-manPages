GNUNET-GNS(1)                          General Commands Manual                          GNUNET-GNS(1)

NAME
       gnunet-gns - Access to GNUnet Name Service

SYNOPSIS
       gnunet-gns [options]

DESCRIPTION
       gnunet-gns can be used to lookup and process GNUnet Name Service names.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -r, --raw
              No  unneeded  output.   This  is  a quiet mode where only important information is dis‐
              played.  For example a lookup for an IP address will only  yield  the  IP  address,  no
              descriptive text.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -u NAME, --lookup=NAME
              Name to lookup.  Resolve the specified name using the GNUnet Name System.

       -p PKEY, --public-key=PKEY
              Public  key  of  the  zone to perform the lookup in.  This option should be used if the
              lookup is to be performed against a zone not controlled by  this  peer  (alternatively,
              you could pass a ".zkey" for the name).

       -T DELAY, --timeout=DELAY
              Set  the  timeout to DELAY.  By default, gnunet-gns will continue to try to resolve the
              name until there is a definitive answer or until the user aborts with CTRL-C.

       -t TYPE, --type=TYPE
              Resource Record Type (TYPE) to look for.  Supported TYPE's are:  A,  AAAA,  CNAME,  NS,
              PKEY, PSEU, TLSA, SRV, SOA, MX, LEHO, VPN, REV, PTR, TXT

              Defaults to "A".

       -z NAME, --zone=NAME
              Name  of  the  ego of the zone to lookup the record in.  The public key associated with
              the ego will be used for the zone.

       -v, --version
              Print GNUnet version number.

BUGS
       Report bugs by using Mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-namestore(1), gnunet-identity(1)

GNUnet                                       Aug 23, 2013                               GNUNET-GNS(1)
