YPBIND(8)                                                                                         ypbind-mt                                                                                         YPBIND(8)



NAME
       ypbind - NIS binding process

SYNOPSIS
       ypbind [-c] [-d | -debug] [-verbose] [-n | -forground] [-broadcast] [-broken-server] [-ypset] [-ypsetme] [-no-ping] [-f configfile] [-local-only] [-ping-interval ping-interval] [-rebind-interval]
              [-no-dbus]

       ypbind --version

DESCRIPTION
       ypbind finds the server for NIS domains and maintains the NIS binding information. The client (normally the NIS routines in the standard C library) could get the information over RPC from ypbind or
       read the binding files. The binding files resides in the directory /var/yp/binding and are conventionally named [domainname].[version]. The supported versions are 1 and 2. There could be several
       such files since it is possible for an NIS client to be bound to more than one domain.

       After a binding has been established, ypbind will send YPPROC_DOMAIN requests to the current NIS server at 20 seconds intervals. If it doesn't get an response or the NIS server reports that he
       doesn't have this domain any longer, ypbind will search for a new NIS server. All 15 minutes ypbind will check to see if the current NIS server is the fastest. If it find a server which answers
       faster, it will switch to this server. You could tell ypbind to use network broadcasts to find a new server, what is insecure, or you could give it a list of known secure servers. In this case
       ypbind will send a ping to all servers and binds to first one which answers.

       Unless the option -debug is used, ypbind detaches itself from the controlling terminal and puts itself into background.  ypbind uses syslog(3) for logging errors and warnings. At startup or when
       receiving signal SIGHUP, ypbind parses the file /etc/yp.conf and tries to use the entries for its initial binding.

       A broadcast entry in the configuration file will overwrite a ypserver/server entry and a ypserver/server entry broadcast. If all given server are down, ypbind will not switch to use broadcast.
       ypbind will try at first /etc/hosts and then DNS for resolving the hosts names from /etc/yp.conf. If ypbind couldn't reconfigure the search order, it will use only DNS. If DNS isn't available, you
       could only use IP-addresses in /etc/hosts.  ypbind could only reconfigure the search order with glibc 2.x. If the -broadcast option is specified, ypbind will ignore the configuration file. If the
       file does not exist or if there are no valid entries, ypbind exit.

       This ypbind version listens for DBUS messages from NetworkManager. If no NetworkManager is running at startup, ypbind will behave as usual and assumes there is a working network connection. If
       NetworkManager is running on the system, ypbind will only search and provide NIS informations, if NetworkManager tells that a network connection is available. If NetworkManager establishes a
       connection, ypbind will reread all configuration files, registers at the local portmapper and try to search NIS servers. If NetworkManager drops a connection, ypbind will unregister from portmapper.

OPTIONS
       -broadcast
           Send a broadcast to request the information needed to bind to a specific NIS server. With this option, /etc/yp.conf will be ignored.

       -ypset
           Allow root from any remote machine to change the binding for a domain via the ypset(8) command. By default, no one can change the binding. This option is really insecure. If you change a binding
           for a domain, all the current known servers for this domain will be forgotten. If the new server goes down, ypbind will use the old searchlist.

       -ypsetme
           The same as -ypset, but only root on the local machine is allowed to change the binding. Such requests are only allowed from loopback.

       -c
           ypbind only checks if the config file has syntax errors and exits.

       -d, -debug
           starts ypbind in debug mode.  ypbind will not put itself into background, and error messages and debug output are written to standard error.

       -n, -foreground
           ypbind will not put itself into backgroun.

       -v, -verbose
           Causes ypbind to syslog(2) any and all changes in the server its bound to.

       -broken-server
           Lets ypbind accept answers from servers running on an illegal port number. This should usually be avoided, but is required by some ypserv(8) versions.

       -no-ping
           ypbind will not check if the binding is alive. This option is for use with dialup connections to prevent ypbind from keeping the connection unnecessarily open or causing auto-dials.

       -f configfile
           ypbind will use configfile and not /etc/yp.conf

       -local-only
           ypbind will only bind to the loopback device and is not reachable from a remote network.

       -i, -ping-interval ping-interval
           The default value for ypbind to check, if a NIS server is still reachable, is 20 seconds. With this options another frequency in seconds can be specified.

       -r, -rebind-interval
           The default value for ypbind to search for the fastest NIS server is 900 seconds (15 minutes). With this options another frequency in seconds can be specified.

       -no-dbus
           Disables DBUS support if compiled in.

       --version
           Prints the version number

FILES
       /etc/yp.conf
           configuration file.

       /var/yp/binding/[domainname].[version]
           binding file containing information about each NIS domain.

       /var/run/ypbind.pid
           contains the process id of the currently running ypbind master process.

SEE ALSO
       syslog(3), domainname(1), yp.conf(5), ypdomainname(8), ypwhich(1), ypserv(8), ypset(8)

AUTHOR
       ypbind-mt was written by Thorsten Kukuk <kukuk@thkukuk.de>.



ypbind-mt                                                                                         11/06/2013                                                                                        YPBIND(8)
