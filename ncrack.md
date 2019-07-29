NCRACK(1)                                                     Ncrack Reference Guide                                                     NCRACK(1)

NAME
       ncrack - Network authentication cracking tool

SYNOPSIS
       ncrack [Options] {target specification}

DESCRIPTION
       Ncrack is an open source tool for network authentication cracking. It was designed for high-speed parallel cracking using a dynamic engine
       that can adapt to different network situations. Ncrack can also be extensively fine-tuned for special cases, though the default parameters
       are generic enough to cover almost every situation. It is built on a modular architecture that allows for easy extension to support
       additional protocols. Ncrack is designed for companies and security professionals to audit large networks for default or weak passwords in
       a rapid and reliable way. It can also be used to conduct fairly sophisticated and intensive brute force attacks against individual
       services.

           Warning
           Ncrack is a project started in the Summer of 2009. While it is already useful for some purposes, it is still unfinished, beta quality
           software. You can help out by testing it and reporting any problems as described in the section called “BUGS”.

       The output from Ncrack is a list of found credentials, if any, for each of the targets specified. Ncrack can also print an interactive
       status report of progress so far and possibly additional debugging information that can help track problems, if the user selected that
       option.

       A typical Ncrack scan is shown in Example 1. The only Ncrack arguments used in this example are the two target IP addresses along with the
       the corresponding ports for each of them. The two example ports 21 and 22 are automatically resolved to the default services listening on
       them: ftp and ssh.

       Example 1. A representative Ncrack scan

           $ ncrack 10.0.0.130:21 192.168.1.2:22

           Starting Ncrack 0.5 ( http://ncrack.org ) at 2016-01-03 22:10 EEST

           Discovered credentials for ftp on 10.0.0.130 21/tcp:
           10.0.0.130 21/tcp ftp: admin hello1
           Discovered credentials for ssh on 192.168.1.2 22/tcp:
           192.168.1.2 22/tcp ssh: guest 12345
           192.168.1.2 22/tcp ssh: admin money$

           Ncrack done: 2 services scanned in 156.03 seconds.

           Ncrack finished.

       The latest version of Ncrack can be obtained from http://nmap.org/ncrack. The latest version of this man page is available at
       http://nmap.org/ncrack/man.html .

OPTIONS SUMMARY
       This options summary is printed when Ncrack is run with no arguments. It helps people remember the most common options, but is no
       substitute for the in-depth documentation in the rest of this manual.

           Ncrack 0.5 ( http://ncrack.org )
           Usage: ncrack [Options] {target and service specification}
           TARGET SPECIFICATION:
             Can pass hostnames, IP addresses, networks, etc.
             Ex: scanme.nmap.org, microsoft.com/24, 192.168.0.1; 10.0.0-255.1-254
             -iX <inputfilename>: Input from Nmap´s -oX XML output format
             -iN <inputfilename>: Input from Nmap´s -oN Normal output format
             -iL <inputfilename>: Input from list of hosts/networks
             --exclude <host1[,host2][,host3],...>: Exclude hosts/networks
             --excludefile <exclude_file>: Exclude list from file
           SERVICE SPECIFICATION:
             Can pass target specific services in <service>://target (standard) notation or
             using -p which will be applied to all hosts in non-standard notation.
             Service arguments can be specified to be host-specific, type of service-specific
             (-m) or global (-g). Ex: ssh://10.0.0.10,at=10,cl=30 -m ssh:at=50 -g cd=3000
             Ex2: ncrack -p ssh,ftp:3500,25 10.0.0.10 scanme.nmap.org google.com:80,ssl
             -p <service-list>: services will be applied to all non-standard notation hosts
             -m <service>:<options>: options will be applied to all services of this type
             -g <options>: options will be applied to every service globally
             Misc options:
               ssl: enable SSL over this service
               path <name>: used in modules like HTTP (´=´ needs escaping if used)
           TIMING AND PERFORMANCE:
             Options which take <time> are in seconds, unless you append ´ms´
             (milliseconds), ´m´ (minutes), or ´h´ (hours) to the value (e.g. 30m).
             Service-specific options:
               cl (min connection limit): minimum number of concurrent parallel connections
               CL (max connection limit): maximum number of concurrent parallel connections
               at (authentication tries): authentication attempts per connection
               cd (connection delay): delay <time> between each connection initiation
               cr (connection retries): caps number of service connection attempts
               to (time-out): maximum cracking <time> for service, regardless of success so far
             -T<0-5>: Set timing template (higher is faster)
             --connection-limit <number>: threshold for total concurrent connections
           AUTHENTICATION:
             -U <filename>: username file
             -P <filename>: password file
             --user <username_list>: comma-separated username list
             --pass <password_list>: comma-separated password list
             --passwords-first: Iterate password list for each username. Default is opposite.
             --pairwise: Choose usernames and passwords in pairs.
           OUTPUT:
             -oN/-oX <file>: Output scan in normal and XML format, respectively, to the given filename.
             -oA <basename>: Output in the two major formats at once
             -v: Increase verbosity level (use twice or more for greater effect)
             -d[level]: Set or increase debugging level (Up to 10 is meaningful)
             --nsock-trace <level>: Set nsock trace level (Valid range: 0 - 10)
             --log-errors: Log errors/warnings to the normal-format output file
             --append-output: Append to rather than clobber specified output files
           MISC:
             --resume <file>: Continue previously saved session
             --save <file>: Save restoration file with specific filename
             -f: quit cracking service after one found credential
             -6: Enable IPv6 cracking
             -sL or --list: only list hosts and services
             --datadir <dirname>: Specify custom Ncrack data file location
             --proxy <type://proxy:port>: Make connections via socks4, 4a, http.
             -V: Print version number
             -h: Print this help summary page.
           MODULES:
             FTP, SSH, Telnet, HTTP(S), POP3(S), SMB, RDP, VNC, SIP, Redis, PostgreSQL, MySQL
           EXAMPLES:
             ncrack -v --user root localhost:22
             ncrack -v -T5 https://192.168.0.1
             ncrack -v -iX ~/nmap.xml -g CL=5,to=1h
           SEE THE MAN PAGE (http://nmap.org/ncrack/man.html) FOR MORE OPTIONS AND EXAMPLES

TARGET SPECIFICATION
       Everything on the Ncrack command-line that isn´t an option (or an option argument) is treated as a target host specification. The simplest
       case is to specify a target IP address or a hostname. Note, that you also need to specify a service to crack for the selected targets.
       Ncrack is very flexible in host/service specification. While hostnames and IP addresses can be defined with the flexibility that you are
       probably used to from Nmap, services along with service-specific options have a unique specification style that enables a combination of
       features to be taken advantage of.

       Sometimes you wish to crack a whole network of adjacent hosts. For this, Ncrack supports CIDR-style addressing. You can append /numbits to
       an IPv4 address or hostname and Ncrack will try to crack every IP address for which the first numbits are the same as for the reference IP
       or hostname given. For example, 192.168.10.0/24 would send probes to the 256 hosts between 192.168.10.0 11000000 10101000 00001010
       00000000) and 192.168.10.255 (binary: 11000000 10101000 00001010 11111111), inclusive. 192.168.10.40/24 would crack exactly the same
       targets. Given that the host scanme.nmap.org is at the IP address 64.13.134.52, the specification scanme.nmap.org/16 would send probes to
       the 65,536 IP addresses between 64.13.0.0 and 64.13.255.255. The smallest allowed value is /0, which targets the whole Internet. The
       largest value is /32, which targets just the named host or IP address because all address bits are fixed.

       CIDR notation is short but not always flexible enough. For example, you might want to send probes to 192.168.0.0/16 but skip any IPs ending
       with .0 or .255 because they may be used as subnet network and broadcast addresses. Ncrack supports this through octet range addressing.
       Rather than specify a normal IP address, you can specify a comma-separated list of numbers or ranges for each octet. For example,
       192.168.0-255.1-254 will skip all addresses in the range that end in .0 or .255, and 192.168.3-5,7.1 will target the four addresses
       192.168.3.1, 192.168.4.1, 192.168.5.1, and 192.168.7.1. Either side of a range may be omitted; the default values are 0 on the left and 255
       on the right. Using - by itself is the same as 0-255, but remember to use 0- in the first octet so the target specification doesn´t look
       like a command-line option. Ranges need not be limited to the final octets: the specifier will send probes to all IP addresses on the
       Internet ending in 13.37 This sort of broad sampling can be useful for Internet surveys and research.

       Ncrack accepts multiple host specifications on the command line, and they don´t need to be the same type. The command ncrack
       scanme.nmap.org 192.168.0.0/8 10.0.0,1,3-7.- -p22 does what you would expect.

       While targets are usually specified on the command lines, the following options are also available to control target selection:

       -iX inputfilename (Input from Nmap´s -oX XML output format) .
           Reads target/service specifications from an Nmap XML output file. The Nmap XML file is created by scanning any hosts and specifying the
           Nmap -oX option. Ncrack will automatically parse the IP addresses and the corresponding ports and services that are open and will use
           these targets for authentication auditing. This is a really useful option, since it lets you essentially combine these two tools -Nmap
           and Ncrack- for cracking only those services that are surely open. In addition, if version detection has been enabled in Nmap (-sV
           option), Ncrack will use those findings to recognize and crack those services that are supported but are listening on non-default
           ports. For example, if a host is having a server listening on port 41414 and Nmap has identified that it is a SSH service, Ncrack will
           use that information to crack it using the SSH module. Of course, Ncrack is going to ignore open ports/services that are not supported
           for authentication cracking by its modules.

       -iN inputfilename (Input from Nmap´s -oN Normal output format) .
           Reads target/service specifications from an Nmap Normal output file. The Nmap Normal file is created by scanning any hosts and
           specifying the Nmap -oN option. This works exactly like Ncrack´s -iX option, the only difference being the format of the input file.

       -iL inputfilename (Input from list) .
           Reads target specifications from inputfilename. Passing a huge list of hosts is often awkward on the command line, yet it is a common
           desire. For example, you might want to crack a list of very specific servers that have been specified for penetration testing. Simply
           generate the list of hosts to crack and pass that filename to Ncrack as an argument to the -iL option. Entries can be in any of the
           formats accepted by Ncrack on the command line (IP address, hostname, CIDR, octet ranges or Ncrack´s special host-service syntax. Each
           entry must be separated by one or more spaces, tabs, or newlines. You can specify a hyphen (-) as the filename if you want Ncrack to
           read hosts from standard input rather than an actual file. Note, however, that if hosts are specified without any service, you will
           have to also provide services/ports for the targets using the -p option.

       --exclude host1[, host2[, ...]] (Exclude hosts/networks) .
           Specifies a comma-separated list of targets to be excluded from the scan even if they are part of the overall network range you
           specify. The list you pass in uses normal Ncrack syntax, so it can include hostnames, CIDR netblocks, octet ranges, etc. This can be
           useful when the network you wish to scan includes untouchable mission-critical servers, systems that are known to react adversely to
           heavy load, or subnets administered by other people.

       --excludefile exclude_file  (Exclude list from file) .
           This offers the same functionality as the --exclude option, except that the excluded targets are provided in a newline, space, or tab
           delimited exclude_file rather than on the command line.

SERVICE SPECIFICATION
       No cracking session can be carried out without targeting a certain service to attack. Service specification is one of the most flexible
       subsystems of Ncrack and collaborates with target-specification in a way that allows different option combinations to be applied. For
       Ncrack to start running, you will have to specify at least one target host and one associated service to attack. Ncrack provides ways to
       specify a service by its default port number, by its name (as extracted from the ncrack-services file) or both. Normally, you need to
       define both name and port number only in the special case where you know that a particular service is listening on a non-default port.

       Ncrack offers two distinct ways with which services will be applied to your targets: per-host service specification and global
       specification.

       Per-host service specification

           Services specified in this mode are written next to the host and apply to it only. Keep in mind, however, that target-specification
           allows wildcards/netmasks, which essentially means that applying a per-host service specification format to that particular target will
           affect all of the expanded ones as a result. The general format is:

            [service-name]://target:[port-number]

           where target is a hostname or IP address in any of the formats described in the target-specification section, [service-name] is one of
           the common service names as defined in the ncrack-services file (e.g ssh, http) and [port-number] is what it obviously means. Ncrack
           can determine the default port numbers for each of the services it supports, as well as being able to deduce the service name when a
           default port number has been specified. Specifying both has meaning only when the user has a priori knowledge of a service listening on
           a non-default port number. This can easily be determined by using version detection like the one offered by Nmap´s -sV option.

           Example 2. Per-host service specification example

               $ ncrack scanme.nmap.org:22 ftp://10.0.0.10 ssh://192.168.1.*:5910

           The above command will try to crack hosts: scanme.nmap.org on SSH service (default port 22), 10.0.0.10 on FTP service (default port 21)
           and 192.168.1.0 - 192.168.1.255 (all of this C subnet) on SSH service on non-default port 5910 which has been explicitly specified. In
           the last case, Ncrack wouldn´t be able to determine that the subnet hosts are to be scanned against the SSH service on that particular
           port without the user explicitly asking for it, because there isn´t any mapping of port-number 5910 to service SSH.

       Global service specification

           Services specified in this mode are applied to all hosts that haven´t been associated with the per-host service specification format.
           This is done using the -p option. While this facility may be similar to that of Nmap´s, you should try not to confuse it, since the
           functionality is of a slightly different nature. Services can be specified using comma separated directives of the general format:

            -p [service1]:[port-number1],[service2]:[port-number2],...

           As usual, you need not specify both service name and port number since Ncrack knows the mappings of default-services to default-port
           numbers. Be careful though not to include any space between each service-name and/or port number, because Ncrack will think that the
           argument after the space is a host as per the rule "everything that isn´t an option is a target specification".

           Example 3. Global service specification example

               $ ncrack scanme.nmap.org 10.0.0.120-122 192.168.2.0/24 -p 22,ftp:3210,telnet

           The above command will try to crack all of the specified hosts scanme.nmap.org, 10.0.0.120, 10.0.0.121, 10.0.0.122 and the C class
           subnet of 192.168.2.0 against the following services: SSH service (mapped from default port 22), FTP service on non-default port 3210,
           and TELNET service on default port 23.

       Of course, Ncrack allows you to combine both modes of service specification if you deem that as necessary. Normally, you will only need to
       specify a couple of services but cracking a lot of hosts against many different services might be a longterm project for large networks
       that need to be consistently audited for weak passwords. If you are in doubt, about which hosts and services are going to be cracked with
       the current command, you can use the -sL option (see below for explanation).

SERVICE OPTIONS
       Apart from general service specification, Ncrack allows you to provide a multitude of options that apply to each or a subset of your
       targets. Options include timing and performance optimizations (which are thoroughly analyzed in a separate section), SSL enabling/disabling
       and other module-specific parameters like the relative URL path for the HTTP module. Options can be defined in a variety of ways which
       include: per-host options, per-module options and global options. Since a combination of these options may be used, there is a strict
       hierarchy of precedence which will be discussed later.

       Per-host Options

           Options in this mode apply only to the host(s) they are referring to and are written next to it according to the following format:

            [service-name]://target:[port-number],opt1=optval1,opt2=optval,...

           The format concerning the service specification which comes before the options, has been explained in the previous section.  optN is
           referring to any of the option names that are available (a list will follow below), while optvalN determines the value of that option
           and depends on the nature of it. For example, most timing-related options expect to receive numbers as values, while the path option
           obviously needs a string argument.

       Per-module Options

           Options in this mode apply to all hosts that are associated with the particular service/module. This is accomplished using the -m which
           is defined with the format:

            -m service-name:opt1=optval1,opt2=optval2,...

           This option can be invoked multiple times, for as many different services as you might need to define service-wide applicable options.
           Each iteration of this option must refer to only one service. However, to avoid confusion, this option had better not be called more
           than one time for the same service, although this is allowed and the last iteration will take precedence over the previous ones for all
           redefined option values.

       Global Options

           Options in this mode apply to all hosts regardless of which service they are associated with. This is accomplished using the -g as
           follows:

            -g opt1=optval1,opt2=optval2,...

           This acts as a convenience option, where you can apply options to all services globally. Everything else regarding the available
           options and option values is the same as the previous modes.

       List of available Service Options

       Below follows a list of all the currently available service options. You can apply them with any of the three modes described above. The
       last six of the options are timing related and will be analyzed in Section "Timing and Performance" of this manual.

               ssl: enable SSL over this service
               path: path-name used in modules like HTTP (´=´ needs escaping if used)
               cl (min connection limit): minimum number of concurrent parallel connections
               CL (max connection limit): maximum number of concurrent parallel connections
               at (authentication tries): authentication attempts per connection
               cd (connection delay): delay time between each connection initiation
               cr (connection retries): caps number of service connection attempts
               to (time-out): maximum cracking time for service, regardless of success so far

       ssl (Enable/Disable SSL over service)
           By enabling SSL, Ncrack will try to open a TCP connection and then negotiate a SSL session with the target. Everything will then be
           transparently encrypted and decrypted. However, since Ncrack´s job is to provide speed rather than strong crypto, the algorithms and
           ciphers for SSL are chosen on an efficiency basis. Possible values for this option are ´yes´ but just specifying ssl would be enough.
           Thus, this is the only option that doesn´t need to be written in the opt=optval format. By default, SSL is disabled for all services
           except those that are stricly dependent on it like HTTPS.

       path <name> (Path name for relative URLs)
           Some services like HTTP or SVN usually require a specific path in the URL. This option takes that pathname string as its value. The
           path is always relative to the hostname or IP address, so if you want to target something like http://foobar.com/login.php the path
           must take the value path=login.php . The initial ´/´ is added if you omit it. However, it is usually better if you explicitly specify
           it at the end of pathnames that are directories. For example, to crack the directory for http://foobar.com/protected-dir/ , it would be
           better if you wrote it as path=protected-dir/ . This is to avoid the (very) slight probability of a false positive, because there are
           cases where Web servers might reply with a "301 Moved Permanently" for a non-successful attempt. They normally send that reply, when a
           successful attempt is made for a requested password-protected path which has omitted the ending ´/´ but the requested source is
           actually a directory. Consequently, Ncrack regards that reply as having succeeded in the authentication attempt.

           Also be careful with the symbol ´=´, since it is used by Ncrack for argument parsing and you will have to espace it if it is included
           in the URL.

           By default, the path-name is initialized to ´/´, but will be ignored by services that do not require it.

       Service Option Hierarchy

       As already noted, Ncrack allows a combination of the three different modes of service option specification. In that case, there is a strict
       hierarchy that resolves the order in which conflicting values for these options take precedence over each other. The order is as follows,
       leftmost being the highest priority and rightmost the lowest one:

       Per-host options > Per-module options > Global options > Timing-Template (for timing options only)

       The concept of the "Timing-Template" will be explained in the Section "Timing and Performance", but for now, just have in mind that its
       values have the least prevalence over everything else and essentially act as defaults for everything timing-related. Global options
       specified with -g have the directly higher precedence, while -m per-module options are immediately higher. In the top of the hierarcy
       reside the per-host options which are essentially the most specific ones. Consequently, you can see that the pattern is: the more specific
       the higher the precedence.

       Example 4. Service Option Hierarchy example

           $ ncrack scanme.nmap.org:22,cl=10,at=1 10.0.0.120 10.0.0.20 -p 21 -m ftp:CL=1 -g CL=3

       The example demonstrates the hierarchy precedence. The services that are going to be cracked are SSH for scanme.nmap.org and FTP for hosts
       10.0.0.120, 10.0.0.20. No particular timing-template has been specified and thus the default will be used (Normal - 3). The per-host
       options for scanme.nmap.org define that the minimum connection limit (cl) is 10 and that Ncrack should attempt only 1 authentication try
       (at) per connection. These values would override any other for service SSH of host scanme.nmap.org if there were conflicts with other
       modes. Since a global option of -g CL=3 was defined and there is no other higher-precedence for service SSH and scanme.nmap.org in
       particular, this value will also be applied. As for the FTP targets, the per-module -m ftp:CL=1 defined for all FTP services will override
       the equivalent global one. All these can get quite complex if overused, but they are not expected to be leveraged by the average Ncrack
       user anyway. Complicated network scanning scenarios might require them, though. To make certain the results are the ones you expect them to
       be, don´t forget to use the -sL option that prints out details about what Ncrack would crack if invoked normally. You can add the debugging
       -d option if you want even more verbose output. For the above example, Ncrack would print the following:

       Example 5. Service Option Hierarchy Output example

           $ ncrack scanme.nmap.org:22,cl=10,at=1 10.0.0.120 10.0.0.20 -p 21 -m ftp:CL=1 -g CL=3 -sL -d

           Starting Ncrack 0.01ALPHA ( http://ncrack.org ) at 2009-08-05 18:32 EEST

           ----- [ Timing Template ] -----
           cl=7, CL=80, at=0, cd=0, cr=10, to=0

           ----- [ ServicesTable ] -----
           SERVICE   cl  CL  at  cd  cr  to  ssl path
           ftp:21    N/A 1   N/A N/A N/A N/A no  null
           ssh:22    N/A N/A N/A N/A N/A N/A no  null
           telnet:23 N/A N/A N/A N/A N/A N/A no  null
           smtp:25   N/A N/A N/A N/A N/A N/A no  null
           http:80   N/A N/A N/A N/A N/A N/A no  null
           https:443 N/A N/A N/A N/A N/A N/A yes null

           ----- [ Targets ] -----
           Host: 64.13.134.52 ( scanme.nmap.org )
             ssh:22 cl=10, CL=10, at=1, cd=0, cr=10, to=0, ssl=no, path=/
           Host: 10.0.0.120
             ftp:21 cl=3, CL=1, at=0, cd=0, cr=10, to=0, ssl=no, path=/
           Host: 10.0.0.20
             ftp:21 cl=3, CL=1, at=0, cd=0, cr=10, to=0, ssl=no, path=/

           Ncrack done: 3 services would be scanned.
           Probes sent: 0 | timed-out: 0 | prematurely-closed: 0

           Ncrack finished.

       The ServicesTable just lists the per-module options for all available services. As you can see, the only defined option is in the FTP
       service for the CL . The Targets table is the most important part of this output and lists all targets and associated options according to
       the command-line invocation. No network operation takes place in this mode, apart from forward DNS resolution for hostnames (like
       scanme.nmap.org in this example).

TIMING AND PERFORMANCE
       The timing engine is perhaps the most important part of any serious network authentication cracking tool. Ncrack´s timing engine offers a
       great many options for optimization and can be bended to serve virtually any user need. As Ncrack is progressing, this subsystem is going
       to evolve into a dynamic autonomous engine that will be able to automatically adjust its behaviour according to the network feedback it
       gets, in order to achieve maximum performance and precision without any user intervention.

       Some options accept a time parameter. This is specified in seconds by default, though you can append ‘ms’, ‘m’, or ‘h’ to the value to
       specify milliseconds, minutes, or hours (‘s’ for seconds is redundant). So the cd (connection delay) arguments 900000ms, 900s, and 15m all
       do the same thing.

       cl num-minconnections; CL num-maxconnections (Adjust number of concurrent parallel connections)

           Connection Limit

           These options control the total number of connections that may be outstanding for any service at the same time. Normally, Ncrack tries
           to dynamically adjust the number of connections for each individual target by counting how many drops or connection failures happen. If
           a strange network condition occurs, that signifies that something may be going wrong, like the host dropping any new connection
           attempts, then Ncrack will immediately lower the total number of connections hitting the service. However, the caps number of the
           minimum or maximum connections that will take place can be overridden using these two options. By properly adjusting them, you can
           essentially optimize performance, if you can handle the tricky part of knowing or discovering your target´s own limits. The convention
           here is that cl with lowercase letters is referring to the minimum connection limit, while CL with uppercase letters is referring to
           the maximum number of connections.

           The most common usage is to set cl (minimum connection limit) for targets that you are almost certain are going to withstand these many
           connections at any given time. This is a risky option to play with, as setting it too high might actually do more harm than good by
           effectively DoS-attacking the target and triggering firewall rules that will ban your IP address.

           On the other hand, for more stealthy missions, setting the CL (maximum connection limit) to a low value might be what you want.
           However, setting it too low will surely have a great impact in overall cracking speed. For maximum stealth, this can be combined with
           the cd (connection delay) described below.

       at num-attempts (Adjust authentication attempts per connection)

           Authentication Tries

           Using this option, you can order Ncrack to limit the authentication attempts it carries out per connection. Ncrack initially sends a
           reconnaisance probe that lets it calculate the maximum number of such authentication tries and from thereon it always tries to use that
           number. Most servicse pose an upper limit on the number of authentication per connection and in most cases finding that maximum leads
           to better performance.

           Setting this option to lower values can give you some stealth bonus, since services such as SSH tend to log failed attempts after more
           than a certain number of authentication tries per connection. They use that as a metric rather than counting the total number of
           authentication attempts or connections per IP address (which is usually done by a firewall). Consequently, a number of 1 or 2
           authentication tries might circumvent logging in some cases.

           Note that setting that option to a high value will not have any effect if Ncrack realizes that the server doesn´t allow that many
           attempts per connection. In this case, it will just use that maximum number and ignore your setting.

       cd time (Adjust delay time between each new connection)

           Connection Delay

           This option essentially defines the imposed time delay between each new connection. Ncrack will wait the amount of time you specify in
           this option value, before starting a new connection against the given service. The higher you set it, the slower Ncrack will perform,
           but the stealthier your attack will become.

           Ncrack by default tries to initiate new connections as fast as possible given that new probes are actually allowed to be sent and are
           not restricted by parameters such as Connection Limit which can dynamically increase or decrease. Although this approach achieves
           blazing speed as long as the host remains responsive, it can lead to a number of disasters such as a firewall being triggered, the
           targets´ or your bandwidth to be diminished and even the tested service to suffer a Denial of Service attack. By carefully adjusting
           this option, you can potentially avoid these annoying situations.

       cr max-conattempts (Adjust the max number of connection attempts)

           Connection Retries

           NOT IMPLEMENTED YET.

       to time (Adjust the maximum overall cracking time)

           Timeout

           Define how much time Ncrack is going to spend cracking the service, before giving up regardless of whether it has found any credentials
           so far. However, any authentication token discovered until that time, will be stored and printed normally. Ncrack marks a service as
           finished when the username/password lists iteration ends or when it can no longer crack it for some serious reason. If Ncrack finishes
           cracking a service before the time specified in this option, then it will not be taken into account at all.

           Sometimes, you have a limited time window to scan/crack your hosts. This might occur for various reasons. A common one would be that
           normal user activity mustn´t be interrupted and since Ncrack can become very aggressive, it might be allowed to scan the hosts only at
           during certain time period like the night hours. Scanning during certain such hours is also likely to make an attack less detectable.

           Don´t forget that Ncrack allows you to specify the time unit of measure by appending ‘ms’, ‘m’, or ‘h’ for milliseconds, minutes or
           hours (seconds is the default time unit). Using them in this particular option, is really convenient as you can specify something like
           to=8h to give Ncrack a total of 8 hours to crack that service. Setting up cronjobs for scheduled scans in combination with this option,
           might also be a good idea.

       -T paranoid|sneaky|polite|normal|aggressive|insane (Set a timing template) .
           While the fine-grained timing controls discussed in the previous section are powerful and effective, some people find them confusing.
           Moreover, choosing the appropriate values can sometimes take more time than the scan you are trying to optimize. So Ncrack offers a
           simpler approach, with six timing templates. You can specify them with the -T option and their number (0–5) or their name. The template
           names are paranoid (0), sneaky (1), polite (2), normal (3), aggressive (4), and insane (5). The first two are for IDS evasion. Polite
           mode slows down the scan to use less bandwidth and target machine resources. Normal mode is the default and so -T3 does nothing.
           Aggressive mode speeds scans up by making the assumption that you are on a reasonably fast and reliable network. Finally insane mode
           assumes that you are on an extraordinarily fast network or are willing to sacrifice some accuracy for speed.

           These templates allow the user to specify how aggressive they wish to be, while leaving Ncrack to pick the exact timing values. If you
           know that the network service is going to withstand a huge number of connections you might try using the aggressive template of -T4 .
           Even then, this is mostly advised for services residing in the local network. Going over to insane mode -T5 is not recommended, unless
           you absolutely know what you are doing.

           While -T0.  and -T1.  may be useful for avoiding IDS alerts, they will take an extraordinarily long time to crack even a few services.
           For such a long scan, you may prefer to set the exact timing values you need rather than rely on the canned -T0 and -T1 values.

       --connection-limit numprobes (Adjust the threshold of total concurrent connections)
           NOT IMPLEMENTED YET.

AUTHENTICATION
       This section describes ways of specifying your own username and password lists as well as the available modes of iterating over them.
       Ncrack ships in with a variety of username and password lists which reside under the directory ´lists´ of the source tarball and later
       installed under Ncrack´s data directory which usually is /usr/local/share/ncrack or /usr/share/ncrack . You can omit specifying any lists
       and Ncrack is going to use the default ones which contain some of the most common usernames and passwords. The password list is
       frequency-sorted with the top most common passwords at the beginning of the list so they will be tried out first. The lists have been
       derived from a combination of sorting publicly leaked password files and other techniques.

       -U filename (Specify username list)
           Specify your own username list by giving the path to the filename as argument to this option.

           Usernames for specific environments can be gathered in numerous ways including harvesting for email-addresses in the company´s website,
           looking up information in whois databases, using the SMTP VRFY technique at vulnerable mail servers or through social engineering.

       -P filename (Specify password list)
           Specify your own password list by giving the path to the filename as argument to this option.

           Common passwords are usually derived from leaked lists as a result of successful intrusions in public sites such as forums or other
           social networking places. A great deal of them have already been publicly disclosed and some of these have been used to assemble
           Ncrack´s own lists.

       --user username_list (Specify command-line comma-separated username list)
           Specify your own usernames directly in the command-line as a comma-separated list.

       --pass password_list (Specify command-line comma-separated password list)
           Specify your own passwords directly in the command-line as a comma-separated list.

       --passwords-first (Reverse the way passwords are iterated)
           Ncrack by default iterates the username list for each password. With this option, you can reverse that. For example, given the username
           list of -> "root, guest, admin" and the password list of "test, 12345, q1w2e3r4" Ncrack will normally go over them like this ->
           root:test, guest:test, admin:test, root:12345 etc. By enabling this option it will go over them like this -> root:test, root:12345,
           root:q1w2e3r4, guest:test etc.

           Most network authentication cracking tools prefer by default to iterate the password list for each username. This is, however,
           ineffective compared to the opposite iteration in most cases. This holds true for the simple reason that password lists are usually
           sorted on a frequency basis, meaning that the more common a password is, the closer to the beginning of the password list it is. Thus,
           iterating over all usernames for the most common passwords first has usually more chances to get a positive result. With the
           --passwords-first iteration, very common passwords might not even be tried out for certain usernames if the user chooses to abort the
           session early. However, this option might prove valuable for cases where the attacker knows and has already verified that the username
           list contains real usernames, instead of blindly bruteforcing through them.

       --pairwise (Choose usernames and passwords in pairs)
           Enabling this option will make Ncrack iterate the username and password list by choosing them in pairs. For example, given the username
           list of "root, guest, admin" and the password list of "test, 12345, q1w2e3r4" Ncrack will go over them like this: "root:test",
           "guest:12345", "admin:q1w2e3r4". This is particulary useful when inside knowledge of the infrastructure tested is available and special
           username and password lists have been made.

OUTPUT
       Any security tool is only as useful as the output it generates. Complex tests and algorithms are of little value if they aren´t presented
       in an organized and comprehensible fashion. Of course, no single format can please everyone. So Ncrack offers several formats, including
       the interactive mode for humans to read directly and XML for easy parsing by software.

       In addition to offering different output formats, Ncrack provides options for controlling the verbosity of output as well as debugging
       messages. Output types may be sent to standard output or to named files, which Ncrack can append to or clobber.

       Ncrack makes output available in three different formats. The default is called interactive output, and it is sent to standard output
       (stdout). There is also normal output, which is similar to interactive except that it displays less runtime information and warnings since
       it is expected to be analyzed after the scan completes rather than interactively.

       XML output is one of the most important output types, as it can be converted to HTML, easily parsed by programs such as Ncrack graphical
       user interfaces, or imported into databases. Currently, XML output hasn´t been implemented.

       While interactive output is the default and has no associated command-line options, the other two format options use the same syntax. They
       take one argument, which is the filename that results should be stored in. Multiple formats may be specified, but each format may only be
       specified once. For example, you may wish to save normal output for your own review while saving XML of the same scan for programmatic
       analysis. You might do this with the options -oX myscan.xml -oN myscan.ncrack. While this chapter uses the simple names like myscan.xml for
       brevity, more descriptive names are generally recommended. The names chosen are a matter of personal preference. A scheme could be using
       long filenames that incorporate the scan date and a word or two describing the scan, placed in a directory named after the company that is
       being scanned.

       While these options save results to files, Ncrack still prints interactive output to stdout as usual. For example, the command nmap -oX
       myscan.xml [target] prints XML to myscan.xml and fills standard output with the same interactive results it would have printed if -oX
       wasn´t specified at all. You can change this by passing a hyphen character as the argument to one of the format types. This causes Ncrack
       to deactivate interactive output, and instead print results in the format you specified to the standard output stream. So the command nmap
       -oX - target will send only XML output to stdout. Serious errors may still be printed to the normal error stream, stderr.

       Unlike some Ncrack arguments, the space between the logfile option flag (such as -oX) and the filename or hyphen is mandatory.

       All of these arguments support strftime-like conversions in the filename.  %H, %M, %S, %m, %d, %y, and %Y are all exactly the same as in
       strftime.  %T is the same as %H%M%S, %R is the same as %H%M, and %D is the same as %m%d%y. A % followed by any other character just yields
       that character (%% gives you a percent symbol). So -oX ´scan-%T-%D.xml´ will use an XML file in the form of scan-144840-121307.xml.

       Ncrack also offers options to control scan verbosity and to append to output files rather than clobbering them. All of these options are
       described below.

       Ncrack Output Formats

       -oN filespec (normal output) .
           Requests that normal output be directed to the given filename. As discussed above, this differs slightly from interactive output.

       -oX filespec (XML output) .
           Requests that XML output be directed to the given filename. Currently this is not implemented.

       -oA basename (Output to all formats) .
           As a convenience, you may specify -oA basename to store scan results in normal and XML formats at once. They are stored in
           basename.ncrack, and basename.xml respectively. As with most programs, you can prefix the filenames with a directory path, such as
           ~/ncracklogs/foocorp/ on Unix or c:\hacking\sco on Windows.

       Verbosity and debugging options

       -v (Increase verbosity level) .
           Increases the verbosity level, causing Ncrack to print more information about the scan in progress. Credentials are shown as they are
           found and more statistical information is printed in the end. Use it twice or more for even greater verbosity.

       -d [level] (Increase or set debugging level) .
           When even verbose mode doesn´t provide sufficient data for you, debugging is available to flood you with much more! As with the
           verbosity option (-v), debugging is enabled with a command-line flag (-d) and the debug level can be increased by specifying it
           multiple times. Alternatively, you can set a debug level by giving an argument to -d. For example, -d10 sets level ten. That is the
           highest effective level and will produce thousands of lines, unless your cracking session is going really slow.

           Debugging output is useful when a bug is suspected in Ncrack, or if you are simply confused as to what Ncrack is doing and why. As this
           feature is mostly intended for developers, debug lines aren´t always self-explanatory. If you don´t understand a line, your only
           recourses are to ignore it, look it up in the source code, or request help from the development list (nmap-dev). Some lines are self
           explanatory, but the messages become more obscure as the debug level is increased.

       --nsock-trace level (Set nsock trace level) .
           This option is meant mostly for developers as enabling it will activate the Nsock´s library debugging output. Nsock is the underlying
           library for parallel socket handling. You will have to specify a certain level for this option. Valid range is 0 up to 10. Usually, a
           level of 1 or 2 is enough to get a good overview of network operations happening behind the scenes. Nsock prints that information to
           stdout by default.

       --log-errors (Log errors/warnings to normal mode output file) .
           Warnings and errors printed by Ncrack usually go only to the screen (interactive output), leaving any normal-format output files
           (usually specified with -oN) uncluttered. When you do want to see those messages in the normal output file you specified, add this
           option. It is useful when you aren´t watching the interactive output or when you want to record errors while debugging a problem. The
           error and warning messages will still appear in interactive mode too. This won´t work for most errors related to bad command-line
           arguments because Ncrack may not have initialized its output files yet.

           An alternative to --log-errors is redirecting interactive output (including the standard error stream) to a file. Most Unix shells make
           this approach easy, though it can be difficult on Windows.

       Miscellaneous output options

       --append-output (Append to rather than clobber output files) .
           When you specify a filename to an output format flag such as -oX or -oN, that file is overwritten by default. If you prefer to keep the
           existing content of the file and append the new results, specify the --append-output option. All output filenames specified in that
           Ncrack execution will then be appended to rather than clobbered. This doesn´t work well for XML (-oX) scan data as the resultant file
           generally won´t parse properly until you fix it up by hand.

MISCELLANEOUS OPTIONS
       This section describes some important (and not-so-important) options that don´t really fit anywhere else.

       --resume file (Continue previously saved session) .
           Whenever the user cancels a running session (usually by pressing Ctrl+C), Ncrack saves the current state into a file which it can later
           use to continue from where it had stopped. This file is saved in subdirectory .ncrack/ of the user´s home path with a filename format
           of "restore.YY-MM-DD_hh-mm". An example would be: "/home/ithilgore/.ncrack/restore.2010-05-18_04-42". You can then continue your
           session, by specifying this file as argument to the --resume option.

       -f  (Quit cracking service after one found credential) .
           This option will force Ncrack to quit cracking a service as soon as it finds a valid username/password combination for it. Assuming
           many parallel services are being cracked at the same time, this option is applied on each of them separately. This means that Ncrack
           will stop cracking each individual service after finding a pair of credentials for it, but will not quit entirely. Supplying the option
           two times, like -f -f will, however, make Ncrack exit immediately as soon as it finds a valid credential for any service.

           Frequently, attackers will try cracking several services in parallel to maximize the chances of finding a pair of valid credentials.
           Given that a network is no stronger than its weakest link, this option and especially the -f -f counterpart will often be used to
           lessen chances of detection and prevent network resources from being wasted aimlessly.

       -6 (Enable IPv6 scanning) .
           Warning: This option was just added and it is currently experimental, so please notify us for any problems and bugs related to it.

           The command syntax is the same as usual except that you also add the -6 option. Of course, you must use IPv6 syntax if you specify an
           address rather than a hostname. An address might look like 3ffe:7501:4819:2000:210:f3ff:fe03:14d0, so hostnames are recommended. The
           output looks the same as usual, with the IPv6 address on the “Discovered credentials” line being the only IPv6 give away.

           While IPv6 hasn´t exactly taken the world by storm, it gets significant use in some (usually Asian) countries and most modern operating
           systems support it. To use Ncrack with IPv6, both the source and target of your scan must be configured for IPv6. If your ISP (like
           most of them) does not allocate IPv6 addresses to you, free tunnel brokers are widely available and will probably work fine with
           Ncrack. A popular IPv6 tunnel broker service is at http://www.tunnelbroker.net. 6to4 tunnels are another popular, free approach.

       -sL (List Scan) .
           The list scan simply lists each host and service that would be cracked if this option wasn´t specified. No packets are sent to the
           target hosts and the only network operation that might happen is DNS-resolution of any hostnames of targets. This option is really
           helpful in making sure that you have specified everything as you wanted. Service-specific options will also be printed so this acts as
           a good sanity check of potentially complex command-line arguments such as the advanced modes of Service Option Specification and the
           equivalent Hierarchy for sessions that require delicate timing handling. If list scan is called along with the -d debug option, then
           additional output, like the ServicesTable and the current Timing-Template´s parameters, is also going to be printed.

       --datadir directoryname (Specify custom Ncrack data file location) .
           Ncrack needs a file called ncrack-services to load a lookup-table of supported services/ports. This file shouldn´t be changed, unless
           you know what you are doing (e.g extending Ncrack for additional modules). In addition, Ncrack is shipped with various username and
           password lists, some of which are used by default in case the user doesn´t specify ones of his own. All these files are normally copied
           during the installation procedure to a directory such as /usr/share/ncrack or /usr/local/share/ncrack . Using the --datadir option,
           will force Ncrack to start searching for these files in specified directory. If the files aren´t found, then it will continue searching
           in the directory specified by the NCRACKDIR environmental variable NCRACKDIR (if it is defined). Next comes ~/.ncrack directory for
           real and effective UIDs (POSIX systems only) or location of the Ncrack executable (Win32 only), and then a compiled-in location such as
           /usr/local/share/ncrack or /usr/share/ncrack. As a last resort, Ncrack will look in the current directory.

       --proxy type://proxy:port (Make connections via socks4, 4a, http) .
           This will make Ncrack perform the authentication cracking session through the proxy host specified.

       -V; --version (Print version number) .
           Prints the Ncrack version number and exits.

       -h; --help (Print help summary page) .
           Prints a short help screen with the most common command flags. Running Ncrack without any arguments does the same thing.

RUNTIME INTERACTION
       During the execution of Ncrack, all key presses are captured. This allows you to interact with the program without aborting and restarting
       it. Certain special keys will change options, while any other keys will print out a status message telling you about the scan. The
       convention is that lowercase letters increase the amount of printing, and uppercase letters decrease the printing. You may also press ‘?’
       for help.

       v / V
           Increase / decrease the verbosity level

       d / D
           Increase / decrease the debugging Level

       p / P
           Display found credentials

       ?
           Print a runtime interaction help screen

       Anything else
           Print out a status message like this:

           Stats: 0:00:20 elapsed; 0 services completed (1 total)

           Rate: 6.26; Found: 1; About 13.27% done; ETC: 21:06 (0:02:17 remaining)

MODULES
       Ncrack´s architecture is modular with each module corresponding to one particular service or protocol. Currently, Ncrack supports the
       protocols FTP, Telnet, SSH, RDP, VNC, HTTP(S), POP3(S), SIP, Redis and PostgreSQL. If you want to write and contribute your own Ncrack
       modules, be sure to read the Ncrack Developer´s Guide at http://nmap.org/ncrack/devguide.html Below we describe some key points for each of
       them.

       FTP Module

           FTP authentication is quite fast, since there is very little protocol negotiation overhead. Most FTP daemons allow 3 to 6
           authentication attempts but usually impose a certain delay before replying with the results of a failed attempt. Filezilla is one of
           the most characteristic examples of this case, where the time delay is so great, that it is usually faster to open more connections
           against it, with each of them doing only 1 authentication per connection.

       Telnet Module

           Telnet daemons have been largely substituded by their safer ´counterpart´ of SSH. However, there are many boxes, mainly routers or
           printers, that still rely on Telnet for remote access. Usually these are also easier to crack, since default passwords for them are
           publicly known. The drawback is that telnet is a rather slow protocol, so you shouldn´t be expecting really high rates against it.

       SSH Module

           SSH is one of the most prevalent protocols in today´s networks. For this reason, a special library, named opensshlib and based on code
           from OpenSSH, was specifically built and tailored for Ncrack´s needs. Opensshlib ships in with Ncrack, so SSH support comes out of the
           box. OpenSSL will have to be installed in Unix systems though. Windows OpenSSL dlls are included in Ncrack, so Windows users shouldn´t
           be worrying about it at all.

           SSH bruteforcing holds many pitfalls and challenges, and you are well advised to read a paper that was written to explain them. The
           latest version of the "Hacking the OpenSSH library for Ncrack" document can be found under docs/openssh_library.txt or at
           http://sock-raw.org/papers/openssh_library

       HTTP(S) Module

           The HTTP Module currently supports basic and digest authentication. Ncrack tries to use the "Keepalive" HTTP option, whenever possible,
           which leads to really high speeds, since that allows dozens of attempts to be carried out per connection. The HTTP module can also be
           called over SSL.

       SMB Module

           The SMB module currently works over raw TCP. NetBIOS isn´t supported yet. This protocol allows for high parallelization, so users could
           potentially increase the number of concurrent probes against it. SMB is frequently used for file-sharing among other things and is one
           of the most ubiquitous protocols, being present in both Unix and Windows environments.

       RDP Module

           RDP (Remote Desktop Protocol) is a proprietary protocol developed by Microsoft for the purpose of providing remote terminal services by
           transferring graphics display information from the remote computer to the user and transporting input commands from the user to the
           remote computer. Fortunately, Microsoft recently decided to open the protocol´s internal workings to the public and has provided
           official documentation, which can be found at http://msdn.microsoft.com/en-us/library/cc240445%28v=PROT.10%29.aspx

           RDP is one of the most complex protocols, requiring the exchange of many packets, even for just the authentication phase. For this
           reason, cracking it takes a lot of time and this is probably the slowest module. The connection phase is briefly described at
           http://msdn.microsoft.com/en-us/library/cc240452%28v=PROT.10%29.aspx where you can also see a diagram of the various packets involved.
           Care must be taken against RDP servers in Windows XP versions, since they can´t handle multiple connections at the same time. It is
           advised to use a very slow timing template or even better limit the maximum parallel connections using timing options such as CL
           (Connection Limit) or cd (connection delay) against Windows XP (and relevant) RDP servers. Windows Vista and above don´t suffer from
           the same limitation.

       VNC Module

           The VNC protocol has known widespread usage among Unix administrators and users for remote graphical access. VNC is perhaps one of the
           most vulnerable protocols in terms of brute-forcing, since it often requires a password without a corresponding username for
           authentication. In addition, some versions of VNC impose an 8-character limit in password length. You should consider adding the
           --passwords-first option when cracking VNC systems to exploit the fact that the username often has no actual importance in
           authentication.

       POP3(S) Module

           POP3 support is still experimental and hasn´t been thoroughly tested. You can expect it to work against common mail servers,
           nevertheless.

       SIP Module

           The Session Initiation Protocol is a text-based protocol, very similar to HTTP in its structure. The most common application of SIP is
           in Internet telephony for voice and video calls. Nearly all enterprises have infrastructure that supports conference calls and part of
           them are based on SIP, making the authentication part a significant threat vector.

       Redis Module

           Redis is one of the most widely used caching servers and the most popular NoSQL database. Despite its reputation, the authentication
           mechanism is very simple, only allowing for a password to protect remote access to the service. Due to the high performance of Redis
           and the fact that only 2 packets are needed for the authentication phase, Ncrack can try a lot of passwords in parallel (‐
           http://redis.io/commands/AUTH). Specifying a username list or single username will have no effect in this module, since Redis only
           deals with passwords.

       PostgreSQL Module

           PostgreSQL is often used as a backend database. The PostgreSQL module supports md5 authentication, which is the most frequent password
           authentication method.

       MySQL Module

           The MySQL module supports native authentication.

BUGS
       Like its authors, Ncrack isn´t perfect. But you can help make it better by sending bug reports or even writing patches. If Ncrack doesn´t
       behave the way you expect, first upgrade to the latest version available from http://nmap.org/ncrack. If the problem persists, do some
       research to determine whether it has already been discovered and addressed. Try searching for the error message on our search page at
       http://insecure.org/search.html or at Google. Also try browsing the nmap-dev archives at http://seclists.org/ .  Read this full manual page
       as well. If you are developing your own Ncrack module, make sure you have first read the Ncrack Developer´s Guide at
       http://nmap.org/ncrack/devguide.html . If nothing comes of this, mail a bug report to nmap-dev@insecure.org . Please include everything you
       have learned about the problem, as well as what version of Ncrack you are running and what operating system version it is running on.
       Problem reports and Ncrack usage questions sent to nmap-dev@insecure.org are far more likely to be answered than those sent to Fyodor
       directly. If you subscribe to the nmap-dev list before posting, your message will bypass moderation and get through more quickly. Subscribe
       at http://cgi.insecure.org/mailman/listinfo/nmap-dev .

       Code patches to fix bugs are even better than bug reports. Basic instructions for creating patch files with your changes are available at
       http://nmap.org/data/HACKING . Patches may be sent to nmap-dev (recommended) or to Fyodor directly.

AUTHORS
       ithilgore (Fotis Hantzis) ithilgore.ryu.l@gmail.com (http://sock-raw.org)

       Fyodor fyodor@insecure.org (http://insecure.org)

NCRACK COPYRIGHT AND LICENSING
       While it isn´t distributed with Nmap, Ncrack is part of the Nmap project and falls under the same license and (non) warranty provisions, as
       described at http://nmap.org/book/man-legal.html.

Ncrack                                                              04/06/2016                                                           NCRACK(1)
