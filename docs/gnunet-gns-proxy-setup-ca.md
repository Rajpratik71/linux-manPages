GNUNET-GNS-PROXY(1)                    General Commands Manual                    GNUNET-GNS-PROXY(1)

NAME
       gnunet-gns-proxy - run a client side GNS SOCKS proxy

SYNOPSIS
       gnunet-gns-proxy [options]

DESCRIPTION
       Most users will want to run this SOCKS proxy. It can be used in combination with browsers that
       support the SOCKS 4a protocol.

       The proxy will perform SSL authentication of GNS names and rewrite GNS enabled  HTML  content.
       To  assert  the  validity of GNS names a local root CA certificate has to be generated that is
       used by the proxy. Thus "gnunet-gns-proxy-setup-ca" should be executed before the first launch
       of  this proxy or the --authority switch is used to specify an appropriate CA certificate that
       is already trusted by the browser.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -a AUTHORITY,  --authority=AUTHORITY
              Path to a PEM CA file that contains the certificate and private key of the CA to use to
              assert  the  validity  of GNS names. The default port is specified in the configuration
              file for the gns service under "[gns-proxy]" PROXY_CACERT.

       -p PORT,  --port=PORT
              The port this proxy should listen on. Default is 7777.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -v, --version
              Print GNUnet version number.

BUGS
       Report bugs by using Mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <bug-gnunet@gnu.org>

SEE ALSO
       gnunet-gns(1)

GNUnet                                       Oct 25, 2012                         GNUNET-GNS-PROXY(1)
