gnunet-transport(1)                    General Commands Manual                    gnunet-transport(1)

NAME
       gnunet-transport - measure and control the transport subsystem

SYNOPSIS
       gnunet-transport [OPTIONS]

DESCRIPTION
       gnunet-transport  is  a  tool to access various functions of GNUnet's transport subsystem from
       the command-line.  Most of these are not expected to be useful for  end-users.   gnunet-trans‐
       port  can  be  used  to evaluate the performance of the transports, force a peer to connect to
       another peer (if possible).  Other functions should be added in the near future.

       -b, --benchmark
              measure how fast we are receiving data (from all connections).  On exit, the data  rate
              will be reported.  Runs until aborted with CTRL-C.

       -C PEER, --connect=PEER
              peer to connect to (used in conjunction with -p)

       -c FILENAME, --config=FILENAME
              configuration file to use

       -e --events
              provide information about all connect and disconnect events (continuously)

       -h, --help
              print help page

       -i, --information
              print information about our current connections (once)

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Change the loglevel.  Possible values for LOGLEVEL are ERROR, WARNING, INFO and DEBUG.

       -l LOGFILE, --logfile=LOGFILE
              configure logging to write logs to LOGFILE

       -m, --monitor
              print information about our current connections (continuously)

       -p PEER, --peer=PEER
              the peer identity

       -s, --send
              transmit  (dummy)  traffic  as  quickly  as  possible to the peer specified with the -p
              option.  The rate will still be limited by the quota(s) determined by  the  peers  (ATS
              subsystem).  Will run until CTRL-C is pressed or until the connection to the other peer
              is disrupted.

       -t, --test
              test transport configuration.  With this flag, the tool will check if each of the  con‐
              figured  transport  plugins  has  a working address.  Plugins that do not have a listen
              port configured will be ignored.  The test is performed with the help  of  an  external
              server  (by  default  running  on gnunet.org) which tries to contact the local machine.
              The test can only work if the local GNUnet peer is not yet running.

       -v, --version
              print the version number

       -V, --verbose
              be verbose

NOTES
REPORTING BUGS
       Report bugs by using mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-arm(1)

GNUnet                                       26 Oct 2011                          gnunet-transport(1)
