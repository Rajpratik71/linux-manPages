CHKCONFIG(8)                                                                               System Manager's Manual                                                                               CHKCONFIG(8)



NAME
       chkconfig - enable or disable system services


SYNOPSIS
       chkconfig -t|--terse [names]
       chkconfig -s|--set [name state]
       chkconfig -e|--edit [names]
       chkconfig -c|--check name [state]
       chkconfig -l|--list [--deps] [names]
       chkconfig -A|--allservices
       chkconfig -a|--add [names]
       chkconfig -d|--del [names]


DESCRIPTION
       chkconfig  is  used  to manipulate the runlevel links at boot time (see init.d(7)).  It can be thought of as a frontend to insserv(8).  Chkconfig can run in six different modes: terse list mode, set
       mode, edit mode, list mode, add mode and delete mode. The last three modes were added for compatiblity reasons.

TERSE LIST MODE
       This mode lists the state of the specified services, or all known services if no service name was provided. Every printed line consists of the name of the service and the runlevels  the  service  is
       configured for at the moment. If it is configured in no runlevel, off is used instead, if it is configured in the runlevels defined as a default by the start script, on is used. If the service is an
       enabled inetd or xinetd service, inetd and xinetd are used. Inetd/xinetd services are configured in /etc/inetd.d and /etc/xinetd.d, respectively. You can use the -A or --allservices parameter to get
       all services (even the boot.*-services) listed.

       If chkconfig is called without arguments, all services are listed in terse mode.

SET MODE
       Set  mode  is  used  to  configure  at which runlevel a service should be started. The arguments must be specified as pairs of service name and new state. You can use on and off as special states to
       select the default set of runlevels or to disable a service completely. You can use inetd or xinetd to configure a service managed by the inetd/xinetd daemons.

       Insserv can calculate dependencies for only one service at the same time. To work around this limitation imposed by insserv, chkconfig uses the '-f' option of insserv when it reads the list of  ser-
       vices from standard input. Note that --force switches off all dependency checks and could lead to depending services no longer working, use with care.

       If  no  services  are  specified, chkconfig reads lines from standard input. Each line must consist of a service/state pair. As this is exactly the output of the terse list mode, this can be used to
       reconfigure a service specification saved by a former run.

       If the option -f or --force is also given, insserv is called with a '-f' option.

EDIT MODE
       This mode is a combination of the terse list mode and set mode.  It writes the state of all specified services (or all known services, if no service was provided) into a temporary  file,  starts  an
       editor and re-configures all services to reflect the states of the changed temporary file.

CHECK MODE
       This  mode  can  be used to check the state of a service.  chkconfig exits with a return code of '0' if the service is enabled in all of the specified runlevels, otherwise the exit status is '1'. If
       chkconfig is called with only a service name the current runlevel of the system is used for checking.

LIST MODE
       List mode prints for each specified service a line that consists of the service name and for runlevels zero to six on or off depending if the service will be started or not.  on will be  printed  in
       bright green if the output is written to a terminal. If the --deps option is given, the names of the services that must be started before this service is appended to each line. The inetd/xinetd ser-
       vices are listed in extra sections.

       You can use the -A or --allservices parameter to get all services (even the boot.*-services) listed.

ADD MODE
       Calls insserv to enable a service and uses list mode to display the new setting afterwards.

DEL MODE
       Same as add mode, but disable the service.

OTHER OPTIONS
       When no service names are given on the command line, chkconfig defaults to all known services excluding those that are not enabled in runlevels 1 to 6 and start with 'boot.'.  Use the  --allservices
       or -A option if you want to see such services as well.

EXAMPLES
              chkconfig

       list the runlevel configuration of all known services

              chkconfig apache

       list the runlevel configuration of the apache web server

              chkconfig -t apache xntpd

       list the runlevel configuration of the apache web server and the network time protocol daemon.

              chkconfig apache on

       configure the apache web server to be started on next boot time.

              chkconfig apache 5

       configure the apache web server to be started only if the system reaches runlevel 5.

              chkconfig apache 35

       configure the apache web server for runlevel 3 and 5.

              chkconfig apache on xntpd off

       configure two services

              chkconfig finger xinetd

       configure a xinetd service

              chkconfig -A >~root/chkconfig.save

       backup the current configuration

              chkconfig -s <~root/chkconfig.save

       restore the configuration

              chkconfig -e apache xntpd

       change the runlevel configuration interactively

              chkconfig -e

       change the runlevel configuration of all services interactively


FILES
       /etc/init.d/
              path to the boot script base directory as required by the Linux Standard Base Specification (LSB).

       /etc/inetd.d/
              path to the inetd services. See the inetd manpage to find out how to enable this feature.

       /etc/xinetd.d/
              path to the xinetd services.


SEE ALSO
       init.d(7), init(7), inetd(8) xinetd(8) insserv(8)


COPYRIGHT
       2003 SuSE Linux AG, Nuernberg, Germany.


AUTHOR
       Michael Schroeder <mls@suse.de>



                                                                                                   Oct 2006                                                                                      CHKCONFIG(8)
