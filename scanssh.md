scanssh(1)                                                  BSD General Commands Manual                                                 scanssh(1)

NAME
     scanssh — scans the Internet for open proxies and SSH servers

SYNOPSIS
     scanssh [-VIERph] [-s scanners,...] [-n ports,...] [-u socks hosts,...] [-e excludefile] addresses...

DESCRIPTION
     ScanSSH scans the given addresses and networks for running services.  It mainly allows the detection of open proxies and Internet services.
     For known services, ScanSSH will query their version number and displays the results in a list.

     The adresses can be either specified as an IPv4 address or an CIDR like IP prefix, ipaddress/masklength.  Ports can be appended by adding a
     colon at the end of address specification.

     Additionally, the following two commands can be prefixed to the address:

     random(n[,seed])/  The random command selects random address from the address range specified.  The arguments are as follows: n is the number
                        of address to randomly create in the given network and seed is a seed for the pseudo random number generator.

     split(s,e)/        The split command is used to split the address range in several unique components.  This can be use to scan from serveral
                        hosts in parallel.  The arguments are as follows: e specifies the number of hosts scanning in parallel and s is the number
                        of the host this particular scan runs on.

     The options are as follows:

     -V              Causes scanssh to print its version number.

     -I              Does not send a SSH identification string.

     -E              Exit the program, if the file containing the addresses for exclusion can not be found.

     -R              If addresses are generated at random, this flag causes the program to ignore excluded addresses from the exclude file.  The
                     default behaviour is to always exclude addresses.

     -p              Specifies that ScanSSH should operate as a proxy detector.  This flag sets the default modes and default scanners to detect
                     open proxies.

     -h              Displays the usage of the program.

     -n ports,...    Specifies the port numbers to scan.  Ports are separated by commas.  Each specified scanner is run for each port in this
                     list.  The default is 22.

     -u socks hosts,...
                     A list of comma separated host:port pairs of SOCKS proxies that scanssh should use to scan through.

     -s scanners     Specifies a number of scanners should be executed for each open port.  Multiple scanners are separated by commas.  The fol‐
                     lowing scanners are currently supported:

                     ssh            Finds versions for SSH, Web and SMTP servers.

                     socks5         Detects if a SOCKS V5 proxy is running on the port.

                     socks4         Detects if a SOCKS V4 proxy is running on the port.

                     http-proxy     Detects a HTTP get proxy.

                     http-connect   Detects a HTTP connect proxy.

                     telnet-proxy   Detects telnet based proxy servers.

     -e excludefile  Specifies the file that contains the addresses to be excluded from the scan.  The syntax is the same as for the addresses on
                     the command line.

     The output from scanssh contains only IP addresses.  However, the IP addresses can be converted to names with the logresolve(8) tool included
     in the Apache webserver.

EXAMPLES
     The following command scans the class C network 10.0.0.0 - 10.0.0.255 for open proxies:

     scanssh -p 10.0.0.0/24

     The next command scans for ssh servers on port 22 only:

     scanssh -n 22 -s ssh 192.168.0.0/16

     The following command can be used in a parallel scan.  Two hosts scan the specified networks randomly, where this is the first host:

     scanssh 'random(0,rsd)/split(1,2)/(192.168.0.0/16 10.1.0.0/24):22,80'

BUGS
     At the moment, scanssh leaves a one line entry in the log file of the ssh server.  It is probably not possible to avoid that.

BSD                                                                July 17, 2000                                                               BSD
