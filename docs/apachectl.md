apache2ctl(8)                                                 System Manager's Manual                                                apache2ctl(8)

NAME
       apache2ctl - Apache HTTP server control interface

SYNOPSIS
       When acting in SysV init mode, apache2ctl takes simple, one-word commands, defined below.

       apachectl command

       apache2ctl command

       When acting in pass-through mode, apache2ctl can take all the arguments available for the httpd binary.

       apachectl [httpd-argument]

       apache2ctl [httpd-argument]

DESCRIPTION
       apache2ctl  is  a  front end to the Apache HyperText Transfer Protocol (HTTP) server.  It is designed to help the administrator control the
       functioning of the Apache apache2 daemon.

       NOTE: The default Debian configuration requires the environment variables APACHE_RUN_USER, APACHE_RUN_GROUP, and APACHE_PID_FILE to be  set
       in /etc/apache2/envvars.

       The apache2ctl script returns a 0 exit value on success, and >0 if an error occurs.  For more details, view the comments in the script.

OPTIONS
       The command can be any one or more of the following options:

       start         Start the Apache daemon.  Gives an error if it is already running.

       stop          Stops the Apache daemon.

       restart       Restarts  the Apache daemon by sending it a SIGHUP.  If the daemon is not running, it is started.  This command automatically
                     checks the configuration files via configtest before initiating the restart to to catch  the  most obvious  errors.  However,
                     it is still possible for the daemon to die because of problems with the configuration.

       fullstatus    Displays  a  full  status report from mod_status.  For this to work, you need to have mod_status enabled on your server and a
                     text-based browser such as lynx available on your system.  The URL used to access the status report can be set by setting the
                     APACHE_STATUSURL variable in /etc/apache2/envvars.

       status        Displays  a brief status report. Similar to the fullstatus option, except that the list of requests currently being served is
                     omitted.

       graceful      Gracefully restarts the Apache daemon by sending it a SIGUSR1.  If the daemon is not running, it is  started.   This  differs
                     from  a  normal  restart in that currently open connections are not aborted.  A side effect is that old log files will not be
                     closed immediately.  This means that if used in a log rotation script, a substantial delay may be necessary  to  ensure  that
                     the  old  log  files  are  closed  before  processing  them.   This  command automatically checks the configuration files via
                     apache2ctl configtest before initiating the restart to to catch the most obvious errors.  However, it is still  possible  for
                     the daemon to die because of problems with the configuration.

       graceful-stop Gracefully  stops  the  Apache  httpd  daemon.   This  differs  from a normal stop in that currently open connections are not
                     aborted.  A side effect is that old log files will not be closed immediately.

       configtest    Run a configuration file syntax test. It parses the configuration files and either reports Syntax Ok or information about the
                     particular syntax error. This test does not catch all errors.

       help          Displays a short help message.

       The following option was available in earlier versions but has been removed.

       startssl      To  start httpd with SSL support, you should edit your configuration file to include the relevant directives and then use the
                     normal apache2ctl start.

ENVIRONMENT
       The  behaviour  of  apache2ctl  can  be  influenced  with  these  environment  variables:  APACHE_HTTPD,   APACHE_LYNX,   APACHE_STATUSURL,
       APACHE_ULIMIT_MAX_FILES,  APACHE_RUN_DIR,  APACHE_LOCK_DIR,  APACHE_RUN_USER,  APACHE_ARGUMENTS,  APACHE_ENVVARS.   See the comments in the
       script for details.  These variables (except APACHE_ENVVARS) can be set in /etc/apache2/envvars.

SEE ALSO
       apache2(8), /usr/share/doc/apache2/README.Debian.gz

                                                                    April 2008                                                       apache2ctl(8)
