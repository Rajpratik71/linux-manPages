GNUNET-NAMESTORE(1)                    General Commands Manual                    GNUNET-NAMESTORE(1)

NAME
       gnunet-namestore - manipulate GNUnet zones

SYNOPSIS
       gnunet-namestore [options]-zZONEFILE

DESCRIPTION
       gnunet-namestore can be used to create and manipulate a GNS zone.

OPTIONS
       -a, --add
              Desired operation is adding a record

       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -d, --delete
              Desired operation is deleting all of the records under the given name

       -D, --display
              Desired operation is listing of matching records

       -e TIME, --expiration=TIME
              Specifies  expiration time of record to add; format is relative time, i.e "1 h" or "7 d
              30 m".  Supported units are "ms", "s", "min" or "minutes", "h" (hours), "d" (days)  and
              "a" (years).

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -m, --monitor
              Monitor  changes  to the zone on an ongoing basis (in contrast to -D, which merely dis‐
              plays the current records)

       -n NAME, --name=NAME
              Name of the record to add/delete/display

       -r PKEY, --reverse=PKEY
              Determine our GNS name for the given public key (reverse lookup of  the  PKEY)  in  the
              given zone.

       -t TYPE, --type=TYPE
              Type of the record to add/delete/display (i.e. "A", "AAAA", "NS", "PKEY", "MX" etc.)

       -u URI, --uri=URI
              Add  PKEY record from gnunet://gns/-URI to our zone; the record type is always PKEY, if
              no expiration is given FOREVER is used

       -v, --version
              Print GNUnet version number.

       -V VALUE, --value=VALUE
              Value to store or remove from the GNS zone.  Specific  format  depends  on  the  record
              type.   A  records  expect a dotted decimal IPv4 address, AAAA records an IPv6 address,
              PKEY a public key in GNUnet's printable format, and CNAME and NS records  should  be  a
              domain name.

       -z EGO, --zone=EGO
              Specifies  the  name  of  the  ego  controlling the private key for the zone (mandatory
              option)

BUGS
       Report bugs by using Mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-gns(1)

GNUnet                                       Mar 5, 2012                          GNUNET-NAMESTORE(1)
