GNUNET-PEERINFO(1)                     General Commands Manual                     GNUNET-PEERINFO(1)

NAME
       gnunet-peerinfo - Display information about other peers.

SYNOPSIS
       gnunet-peerinfo [options]

DESCRIPTION
       gnunet-peerinfo display the known addresses and trust of known peers.

OPTIONS
       -c FILENAME, --config=FILENAME
              Load config file (default: ~/.config/gnunet.conf)

       -g, --get-hello
              Output HELLO uri(s)

       -h, --help
              Print help page

       -i, --info
              List all known peers (and their addresses)

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Set the loglevel

       -l LOGFILE, --logfile=LOGFILE
              Log messages to LOGFILE

       -n, --numeric
              Disable resolution of IPs to hostnames

       -p, --put-hello=HELLO
              Add given HELLO uri to the database

       -q, --quiet
              Do not print anything but the peer identities

       -s, --self
              Print  only  our  own  identity  (together with "-q", this is the exact line that other
              peers would have to put in to their friends file in order to consider this peer one  of
              their friends in F2F mode).

       -v, --version
              Print the version number

BUGS
       Report  bugs  by  using  mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet.conf(5)

GNUnet                                       Mar 4, 2013                           GNUNET-PEERINFO(1)
