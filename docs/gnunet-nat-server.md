GNUNET-NAT-SERVER(1)                   General Commands Manual                   GNUNET-NAT-SERVER(1)

NAME
       gnunet-nat-server - help GNUnet setup test network setup with NAT

SYNOPSIS
       gnunet-nat-server [options] PORT

DESCRIPTION
       Normal  GNUnet  end-users should not concern themselves with gnunet-nat-server.  In fact, dis‐
       tributions are encouraged to consider not shipping it at all.  Running gnunet-nat-server's  is
       similar  to  running  hostlist  servers: it is a special service to the community with special
       requirements and no benefit to those running the service.

       This program will listen on the specified PORT for incoming requests to test a peer's  network
       connectivity.   Incoming  requests  can  ask  it to connect to a given IPv4 address (and port)
       using TCP or UDP and to send a 2-byte test message using the specified address.   The  program
       can  also be asked to send a "fake" ICMP response message to a given IPv4 address (for autono‐
       mous NAT traversal --- see the description in the respective research paper).

       The idea is that gnunet-nat-server will be run on some trusted hosts with unrestricted connec‐
       tivity to allow GNUnet users to test their network configuration.  As written, the code allows
       any user on the Internet to cause the gnunet-nat-server to send 2-bytes of arbitrary  data  to
       any TCP or UDP port at any address.  We believe that this is generally harmless.

       When  running  gnunet-nat-server,  make  sure  to  use  a configuration that disables most NAT
       options but enables 'enable_nat_client' and sets 'internal_address' to the global  IP  address
       of  your  local  host.  Also, the gnunet-helper-nat-client should be installed locally and run
       with root privileges (SUID), otherwise the gnunet-nat-server will not work properly.

       Note that gnunet-nat-server could be run via gnunet-arm but typically is not.  Also, the  name
       of  the  host  and  port that gnunet-nat-server is run on should be specified in the NATSERVER
       option in the [setup] section of the configuration file of hosts that are supposed to autocon‐
       figure with this server.

OPTIONS
       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

BUGS
       Report  bugs  by  using  Mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-transport(1)

GNUnet                                       25 Feb 2012                         GNUNET-NAT-SERVER(1)
