service(8)                                                                                 System Manager's Manual                                                                                 service(8)



NAME
       service - run service

SYNOPSIS
              service SERVICE ACTION [OPTIONS]
              service --status-all
              service --help | -h


DESCRIPTION
       The  SERVICE  parameter  specifies  a  systemd service name to operate on.  The supported values of ACTION depend  on  the specified  service.  The actions start, stop, reload, restart, try-restart,
       force-reload, and status are forwarded to systemctl, OPTIONS are ignored in that case.  Other actions may be defined in /usr/lib/initscripts/legacy-actions. Legacy actions are  called  directly  and
       OPTIONS are passed on the command line.

       The --status-all option displays the status of all loaded service units.


FILES
       /usr/lib/initscripts/legacy-actions
                     Directory containing System V legacy actions


HISTORY
       service used to run System V init scripts in a predictable environment.


USE AS rc* WRAPPER
       SUSE  Linux distributions used to have convenience symlinks to call System V init scripts, for example /usr/sbin/rcexample -> /etc/init.d/example. With the move to systemd the service command can be
       used as wrapper for systemctl instead. For example /usr/sbin/rcexample -> /usr/sbin/service.



SEE ALSO
       chkconfig(8), systemctl(1) systemd.service(5)



                                                                                                   Sep 2014                                                                                        service(8)
