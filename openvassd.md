OpenVASSD(8)                                                       User Manuals                                                       OpenVASSD(8)

NAME
       openvassd - The Scanner of the Open Vulnerability Assessment System (OpenVAS)

SYNOPSIS
       openvassd [-v] [-h]  [-c config-file]  [-D] [-R] [-P] [-q] [-f]

DESCRIPTION
       OpenVAS  is a security auditing framework made up of several modules.  The Scanner, openvassd is in charge of executing many security tests
       against many target hosts in a highly optimized way.

       openvassd inspects the remote hosts and attempts to list all the vulnerabilities and common misconfigurations that affects them. Note  that
       openvassd will run in daemon mode by default (unless you specify -f as an option).

OPTIONS
       -c <config-file>, --config-file=<config-file>
              Use the alternate configuration file instead of /etc/openvas/openvassd.conf

       -f, --foreground
              Make the scanner stay in foreground (non-daemon mode)

       -v, --version
              Writes the version number and exits

       -h, --help
              Show a summary of the commands

THE CONFIGURATION FILE
       The default openvassd configuration file, /etc/openvas/openvassd.conf contains these options:

       plugins_folder
              Contains the location of the plugins folder. This is usually /var/lib/openvas/plugins, but you may change this.

       logfile
              path  to  the logfile. You can enter syslog if you want the openvassd messages to be logged via syslogd You may also enter stderr if
              you want the openvassd logs to be written on stderr.  Because openvassd is a sensitive program, you should keep your logs.

       max_hosts
              is maximum number of hosts to test at the same time which should be given to the client (which can override it). This value must  be
              computed given your bandwidth, the number of hosts you want to test, your amount of memory and the horsepower of your processor(s).

       max_checks
              is  the  number  of plugins that will run against each host being tested. Note that the total number of process will be max_checks x
              max_hosts so you need to find a balance between these two options. Note that launching too many plugins at the same time may disable
              the  remote host, either temporarily (ie: inetd closes its ports) or definitely (the remote host crash because it is asked to do too
              many things at the same time), so be careful.

       be_nice
              If this option is set to 'yes', then each child forked by openvassd will nice(2) itself to a very low priority. This  may  speed  up
              your  scan  as  the  main  openvassd process will be able to continue to spew processes, and this guarantees that openvassd does not
              deprives other important processes from their resources.

       log_whole_attack
              If this option is set to 'yes', openvassd will store the name, pid, date and target of each plugin launched.  This  is  helpful  for
              monitoring and debugging purpose, however this option might make openvassd fill your disk rather quickly.

       log_plugins_name_at_load
              If this option is set to 'yes', openvassd will log the name of each plugin being loaded at startup, or each time it receives the HUP
              signal.

       dumpfile
              Some plugins might issue messages, most of the time to inform you that something went wrong. If you want to read these messages, set
              this value to a given file name. If you want to save space, set this option value to /dev/null

       cgi_path
              By  default, openvassd looks for default CGIs in /cgi-bin and /scripts. You may change these to something else to reflect the policy
              of your site. The syntax of this option is the same as the shell $PATH variable: path1:path2:...

       port_range
              This is the default range of ports that the scanner plugins will probe. The syntax of this option is flexible, it can  be  a  single
              range  ("1-1500"), several ports ("21,23,80"), several ranges of ports ("1-1500,32000-33000"). Note that you can specify UDP and TCP
              ports by prefixing each range by T or U. For instance, the following range will make openvassd scan UDP ports  1  to  1024  and  TCP
              ports 1 to 65535 : "T:1-65535,U:1-1024".

       optimize_test
              By  default, openvassd does not trust the remote host banners. It means that it will check a webserver claiming to be IIS for Apache
              flaws, and so on. This behavior might generate false positive and will slow the scan down somehow. If you are sure  the  banners  of
              the  remote  host  have not been tampered with, you can safely enable this option, which will force the plugins to perform their job
              only against the services they have been designed to check.

       checks_read_timeout
              Number of seconds that the security checks will wait for when doing a recv(). You should increase this  value  if  you  are  running
              openvassd across a slow network slink (testing a host via a dialup connection for instance)

       timeout_retry
              Number of retries when a socket connection attempt timesout.

       time_between_request
              Some devices do not appreciate quick connection establishment and termination neither quick request. This option allows you to set a
              wait time between two actions like to open a tcp socket, to send a request trought the open tcp socket, and to close the tcp socket.
              This  value should be given in miliseconds. If the set value is 0 (default value), this option is disabled and there is no wait time
              between requests.

       non_simult_ports
              Some services (in particular SMB) do not appreciate multiple connections at the same time coming from the  same  host.  This  option
              allows  you  to  prevent  openvassd  to  make two connections on the same given ports at the same time. The syntax of this option is
              "port1[, port2....]". Note that you can use the KB notation of openvassd to designate a service formally. Ex:  "139,  Services/www",
              will prevent openvassd from making two connections at the same time on port 139 and on every port which hosts a web server.

       plugins_timeout
              This  is  the maximum lifetime, in seconds of a plugin. It may happen that some plugins are slow because of the way they are written
              or the way the remote server behaves. This option allows you to make sure your scan is never caught in an endless loop because of  a
              non-finishing plugin. Doesn't affect ACT_SCANNER plugins.

       scanner_plugins_timeout
              Like plugins_timeout, but for ACT_SCANNER plugins.

       safe_checks
              Most  of  the  time,  openvassd attempts to reproduce an exceptional condition to determine if the remote services are vulnerable to
              certain flaws. This includes the reproduction of buffer overflows or format strings, which may make the remote server crash. If  you
              set  this option to 'yes', openvassd will disable the plugins which have the potential to crash the remote services, and will at the
              same time make several checks rely on the banner of the service tested instead of its behavior towards a certain input. This reduces
              false  positives and makes openvassd nicer towards your network, however this may make you miss important vulnerabilities (as a vul‐
              nerability affecting a given service may also affect another one).

       auto_enable_dependencies
              OpenVAS plugins use the result of each other to execute their job. For instance, a plugin which logs into the  remote  SMB  registry
              will  need the results of the plugin which finds the SMB name of the remote host and the results of the plugin which attempts to log
              into the remote host. If you want to only select a subset of the plugins available, tracking the  dependencies  can  quickly  become
              tiresome. If you set this option to 'yes', openvassd will automatically enable the plugins that are depended on.

       use_mac_addr
              Set  this  option  to  'yes' if you are testing your local network and each local host has a dynamic IP address (affected by DHCP or
              BOOTP), and all the tested hosts will be referred to by their MAC address.

       source_iface
              Name of the network interface that will be used as the source of connections established by OpenVAS. The scan won't be  launched  if
              the value isn't authorized according to (sys_)ifaces_allow / (sys_)ifaces_deny if present.

       ifaces_allow
              Comma-separated list of interfaces names that are authorized as source_iface values.

       ifaces_deny
              Comma-separated list of interfaces names that are not authorized as source_iface values.

       sys_ifaces_allow
              Like ifaces_allow. Can't be overridden by the client.

       sys_ifaces_deny
              Like ifaces_deny. Can't be overridden by the client.

       hosts_allow
              Comma-separated list of the only targets that are authorized to be scanned.  Supports the same syntax as the list targets. Both tar‐
              get hostnames and the address to which they resolve are checked. Hostnames in hosts_allow list are not resolved however.

       hosts_deny
              Comma-separated list of targets that are not authorized to be scanned. Supports the same syntax as the  list  targets.  Both  target
              hostnames and the address to which they resolve are checked. Hostnames in hosts_deny list are not resolved however.

       sys_hosts_allow
              Like hosts_allow. Can't be overridden by the client.

       sys_hosts_deny
              Like hosts_deny. Can't be overridden by the client.

              The other options in this file can usually be redefined by the client.

              At  log in attempt, openvassd checks that the certificate has been signed by a recognized authority.

NETWORK USAGE
       Bear  in  mind  that  OpenVAS  can  be quite network intensive. Even if the OpenVAS developers have taken every effort to avoid packet loss
       (including transparently resending UDP packets, waiting for data to be received in TCP connections, etc.) so bandwidth use should always be
       closely monitored, with current server hardware, bandwidth is usually the bottleneck in a OpenVAS scan. It might not became too apparent in
       the final reports, scanners will still run, holes might be detected, but you will risk to run into false negatives (i.e. OpenVAS  will  not
       report a security hole that is present in a remote host)

       Users  might  need to tune OpenVAS configuration if running the scanner in low bandwidth conditions (low being 'less bandwidth that the one
       your hardware system can produce) or otherwise will get erratic results. There are several parameters that can be modified to  reduce  net‐
       work load:

       checks_read_timeout
              (Introduced  in OpenVAS 0.99.4) The default value is set to 5 seconds, that can (should) be increased if network bandwidth is low in
              the openvassd.conf or openvasrc configuration files. Notice that it is recommended to increase this this value, if you are running a
              test outside your LAN (i.e. to Internet hosts through an Internet connection), to over 10 seconds.

       max_hosts
              Number of hosts to test at the same time (this value is set by the OpenVAS GUI client or by .openvasrc) it can be as low as you want
              it to be (obviously 1 is the minimum)

       max_checks
              Number of checks to test at the same time (this value is also set by the OpenVAS GUI client or by .openvasrc ) it can be as  low  as
              you  want it to be and it will also reduce network load and improve performance (obviously 1 is the minimum) Notice that the OpenVAS
              scanner will spawn max_hosts * max_checks processes.

              Other options might be using the QoS features offered by your server operating system or your network to improve the bandwidth use.

              It is not easy to give a bandwidth estimate for a OpenVAS run, you will probably need to make your own counts. However, assuming you
              test 65536 TCP ports. This will require at least a single packet per port that is at least 40 bytes large. Add 14 bytes for the eth‐
              ernet header and you will send 65536 * (40 + 14) = 3670016 bytes. So for just probing all TCP ports we may need a multitude of  this
              as nmap will try to resend the packets twice if no response is received.

              A very rough estimate is that a full scan for UDP, TCP and RPC as well as all NASL scripts may result in 8 to 32 MB worth of traffic
              per scanned host.  Reducing the amount of tested part and such will reduce the amount of data to be transferred significantly.

MORE INFORMATION ABOUT THE OpenVAS PROJECT
       The canonical places where you will find more information about the OpenVAS project are:

              http://www.openvas.org/ ⟨⟩ (Official site)
              http://wald.intevation.org/projects/openvas/ ⟨⟩ (Developers site)
              http://bugs.openvas.org ⟨⟩ (Bug Tracker)

AUTHORS
       openvassd was forked from nessusd in 2005. Nessusd was written by Renaud Deraison <deraison@cvs.nessus.org>. Since 2005 the OpenVAS  devel‐
       opment team improved and extended the tool.

The OpenVAS Project                                                January 2011                                                       OpenVASSD(8)
