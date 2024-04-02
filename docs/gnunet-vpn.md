GNUNET-VPN(1)                          General Commands Manual                          GNUNET-VPN(1)

NAME
       gnunet-vpn - manually setup a GNUnet VPN tunnel

SYNOPSIS
       gnunet-vpn [options]

DESCRIPTION
       gnunet-vpn  can  be used to manually setup a VPN tunnel via the GNUnet network.  There are two
       main types of tunnels.  Tunnels to an exit node which routes the traffic to the global  Inter‐
       net,  and  tunnels to a node that runs a service only within GNUnet.  Depending on the type of
       tunnel, gnunet-vpn takes different options.  The "-i" option is required  for  tunnels  to  an
       exit  node,  whereas  the  "-p"  and  "-s" options in conjunction with either "-u" or "-t" are
       required for tunnels to services.  For exit tunnels, both UDP and TCP traffic  will  be  redi‐
       rected.  For service tunnels, either UDP ("-u") or TCP ("-t") traffic will be redirected.

       The tool will display the IP address for this end of the tunnel.  The address can be displayed
       as soon as it has been allocated, or only after ("-a") the tunnel has been created.

OPTIONS
       -4, --ipv4
              Desired IP address on this end of the tunnel should be an IPv4 address.

       -6, --ipv6
              Desired IP address on this end of the tunnel should be an IPv6 address.

       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -d TIME, --duration TIME
              The mapping should be established for TIME.  The value given must be a number  followed
              by a space and a time unit, for example "500 ms".  Note that the quotes are required on
              the shell. Default is 5 minutes.

       -h, --help
              Print short help on options.

       -i IP, --ip IP
              Tunnel should be to an exit node and connect to the given  IPv4  or  IPv6  IP  address.
              Note  that you can specify an IPv6 address as the target here, even in combination with
              "-4" (4to6) and similarly you can specify an IPv4  address  in  combination  with  "-6"
              (6to4).

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -p PEERID,  --peer=PEERID
              Name  of  the  peer  offering the service to connect to.  Cannot be used in conjunction
              with "-i", requires "-s".

       -s NAME,  --service=NAME
              Name of the service running on the target peer.  Cannot be  used  in  conjunction  with
              "-i", requires "-p".

       -t, --tcp
              Service runs TCP.  Either "-t" or "-u" must be specified when using "-s".

       -u, --udp
              Service runs UDP.  Either "-t" or "-u" must be specified when using "-s".

       -V, --verbose
              Be verbose.

       -v, --version
              Print GNUnet version number.

BUGS
       Report  bugs  by  using  Mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-setup(1)

GNUnet                                       25 Feb 2012                                GNUNET-VPN(1)
