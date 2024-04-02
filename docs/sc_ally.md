SC_ALLY(1)                                                  BSD General Commands Manual                                                 SC_ALLY(1)

NAME
     sc_ally — scamper driver to run Ally on a list of candidate aliases.

SYNOPSIS
     sc_ally [-?D] [-i infile] [-o outfile] [-p port] [-U unix-socket] [-f fudge] [-i probe-wait] [-q attempts] [-t logfile] [-w waittime]

DESCRIPTION
     The sc_ally utility provides the ability to connect to a running scamper(1) instance and have a set of IPv4 address-pairs tested for aliases
     using the Ally technique.  For each address pair in the file, sc_ally establishes which probe methods (UDP, TCP-ack, ICMP-echo) solicit an
     incrementing IP-ID value, and then uses the Ally technique on pairs where a probe method is able to obtain an incrementing IP-ID for both
     addresses.  The output is written to a warts file.  The options are as follows:

     -?      prints a list of command line options and a synopsis of each.

     -D      causes sc_ally to detach and become a daemon.

     -i infile
             specifies the name of the input file which consists of a sequence of IPv4 address-pairs, one pair per line.

     -o outfile
             specifies the name of the output file to be written.  The output file will use the warts format.

     -p port
             specifies the port on the local host where scamper(1) is accepting control socket connections.

     -U unix-socket
             specifies the name of a unix domain socket where scamper(1) is accepting control socket connections.

     -f fudge
             specifies the fudge factor to use when (1) inferring if IPIDs are assigned from a counter, and (2) inferring if two addresses share
             the same counter.

     -i probe-wait
             specifies the inter-probe gap for both ping and Ally measurements, in milliseconds.  The default is 1000ms (1 second); the minimum is
             200ms, and the maximum is 2000ms.

     -q attempts
             specifies the number of times to try Ally when one of the addresses is unresponsive.

     -t logfile
             specifies the name of a file to log output from sc_ally generated at run time.

     -w waittime
             specifies the minimum length of time, in seconds, to wait between completing a measurement to a particular IP address and issuing the
             next.

EXAMPLE
     Given a set of IPv4-address pairs in a file named infile.txt:

        192.0.2.1 192.0.32.10
        192.0.2.2 192.0.31.8
        192.0.2.3 192.0.30.64

     and a scamper(1) daemon listening on port 31337, then these address-pairs can be tested for aliases using

     sc_ally -i infile.txt -o outfile.warts -p 31337

SEE ALSO
     N. Spring, R. Mahajan, and D. Wetherall, Measuring ISP topologies with Rocketfuel, Proc. ACM SIGCOMM 2002.  scamper(1), sc_wartsdump(1),
     sc_warts2text(1)

AUTHORS
     sc_ally is written by Matthew Luckie <mjl@luckie.org.nz>.

BSD                                                                March 1, 2011                                                               BSD
