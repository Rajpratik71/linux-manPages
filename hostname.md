HOSTNAME(1)                                                                               Linux Programmer's Manual                                                                               HOSTNAME(1)



NAME
       hostname - show or set the system's host name
       domainname - show or set the system's NIS/YP domain name
       dnsdomainname - show the system's DNS domain name
       nodename - show or set the system's DECnet node name


SYNOPSIS
       hostname [-v] [-a] [--alias] [-d] [--domain] [-f] [--fqdn] [-i] [--ip-address] [--long] [-s] [--short] [-y] [-n] [--node]


       hostname [-v] [-F filename] [--file filename] [hostname]


       domainname [-v] [-F filename] [--file filename] [name]


       nodename [-v] [-F filename] [--file filename] [name]


       hostname [-v] [-h] [--help] [-V] [--version]


       dnsdomainname [-v]


DESCRIPTION
       Hostname  is  the program that is used to either set or display the current host, domain or node name of the system.  These names are used by many of the networking programs to identify the machine.
       The domain name is also used by NIS/YP.


   GET NAME
       When called without any arguments, the program displays the current names:


       hostname will print the name of the system as returned by the gethostname(2) function.


       nodename will print the DECnet node name of the system as returned by the getnodename(2) function.


       dnsdomainname will print the domain part of the FQDN (Fully Qualified Domain Name). The complete FQDN of the system is returned with hostname --fqdn.


       The function gethostname(2) is used to get the hostname.  Only when the hostname -s is called will gethostbyname(3) be called.  The difference in gethostname(2) and gethostbyname(3) is that gethost-
       byname(3)  is network aware, so it consults /etc/nsswitch.conf and /etc/host.conf to decide whether to read information in /etc/sysconfig/network or /etc/hosts the hostname is also set when the net-
       work interface is brought up.


   SET NAME
       When called with one argument or with the --file option, the commands set the host name, the NIS/YP domain name or the node name.


       Note, that only the super-user can change the names.


       It is not possible to set the FQDN or the DNS domain name with the dnsdomainname command (see THE FQDN below).


       The host name is usually set once at system startup in /etc/rc.d/rc.inet1 or /etc/init.d/boot (normally by reading the contents of a file which contains the host name, e.g.  /etc/hostname).


   THE FQDN
       You can't change the FQDN (as returned by hostname --fqdn) or the DNS domain name (as returned by dnsdomainname) with this command. The FQDN of the system is the name that  the  resolver(3)  returns
       for the host name.


       Technically: The FQDN is the name gethostbyname(2) returns for the host name returned by gethostname(2).  The DNS domain name is the part after the first dot.

       Therefore it depends on the configuration (usually in /etc/host.conf) how you can change it. Usually (if the hosts file is parsed before DNS or NIS) you can change it in /etc/hosts.



OPTIONS
       -a, --alias
              Display the alias name of the host (if used).

       -d, --domain
              Display  the  name  of  the  DNS  domain.  Don't  use the command domainname to get the DNS domain name because it will show the NIS domain name and not the DNS domain name. Use dnsdomainname
              instead.

       -F, --file filename
              Read the host name from the specified file. Comments (lines starting with a `#') are ignored.

       -f, --fqdn, --long
              Display the FQDN (Fully Qualified Domain Name). A FQDN consists of a short host name and the DNS domain name. Unless you are using bind or NIS for host lookups you can change the FQDN and the
              DNS domain name (which is part of the FQDN) in the /etc/hosts file.

       -h, --help
              Print a usage message and exit.

       -i, --ip-address
              Display the IP address(es) of the host.

       -n, --node
              Display the DECnet node name. If a parameter is given (or --file name ) the root can also set a new node name.

       -s, --short
              Display the short host name. This is the host name cut at the first dot.

       -V, --version
              Print version information on standard output and exit successfully.

       -v, --verbose
              Be verbose and tell what's going on.

FILES
       /etc/hosts

AUTHOR
       Peter Tobias, <tobias@et-inf.fho-emden.de>
       Bernd Eckenfels, <net-tools@lina.inka.de> (NIS and manpage).
       Steve Whitehouse, <SteveW@ACM.org> (DECnet support and manpage).




net-tools                                                                                        28 Jan 1996                                                                                      HOSTNAME(1)
