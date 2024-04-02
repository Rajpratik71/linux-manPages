IODINE-CLIENT-START(8)                                    System Administration Utilities                                   IODINE-CLIENT-START(8)

NAME
       iodine-client-start - start an iodine IPv4-over-DNS tunnel

SYNOPSIS
       iodine-client-start [option]

DESCRIPTION
       'iodine-client-start' starts an iodine IP-over-DNS tunnel.

       -h, --help
              Print help and exit

       -v, --version
              Print version info and exit

       Invoking  the  program  without  options  attempts to set up and configure an iodine IP-over-DNS tunnel using the configuration in the file
       /etc/default/iodine-client or by querying the user. It tries to figure out the right way to set things up by observing the network, and  if
       all else fails by guessing.

       QUICK CONFIGURATION

       Put two lines in the file /etc/default/iodine-client

              subdomain=your.tunnel.sub.domain

              passwd=password_for_that_tunnel

       or invoke the script with those environment variables set:

              env subdomain=xxx passwd=xxx iodine-client-start

       If these are not set, the script will query the user for them.

       DETAILS

       The configuration file consists of lines which are either comments starting with '#', or settings of the form VAR="val". Valid VARs are:

       subdomain

              Sample value: your.tunnel.sub.domain (no default, must be set)

       passwd

              Sample value: password_for_that_tunnel (no default, must be set)

       testhost

              Hostname to ping when testing if network is working (default: slashdot.org)

       bounce_localnet

              Take the local network down and then up again before starting tunnel (default: false)

       test_ping_localnet

              Test if the local network is working by pinging the gateway (default: true)

       test_ping_tunnel

              Test if the iodine tunnel is working after it has been set up by pinging the host at the other end (default: true)

       test_ping_final

              Test if the tunnel is working after everything is ostensibly set up by trying to ping an external host (default: true)

       default_router

              IP address of router on the local network---should be found automatically, set this if that fails and the program guesses wrong.

       interface

              Interface  to  use  (e.g., eth1, eth0, etc) for connection to DNS server used for the iodine tunnel---should be found automatically,
              set this if that fails and the program guesses wrong.

       mtu

              Set if tunnel MTU needs to be manually changed (lowered). Should not be necessary anymore, as recent versions of iodine negotiate an
              appropriate  MTU  during  tunnel setup. But if that negotiation does not happen, or if you are using an older version of iodine, the
              default tunnel MTU is 1024, and if the local DNS server restricts to 512 byte packets you might need to use an MTU of 220.

       skip_raw_udp_mode

              Set "-r" option in iodine command line. With this option, iodine does not try to establish a direct UDP socket to the iodine  server
              on port 53. (default: true).

       continue_on_error

              Set  if  the script should continue even if a command fails.  Use to test script when running as non-root. Defaults to false if run‐
              ning as root, true otherwise.

iodine-client-start 1.0.5                                           August 2016                                             IODINE-CLIENT-START(8)
