DS-LOGPIPE.PY(1)                                                                           General Commands Manual                                                                           DS-LOGPIPE.PY(1)



NAME
       ds-logpipe.py - Create and read from a named pipe instead of a log file

SYNOPSIS
       ds-logpipe.py /full/path/to/namedpipe
              [-m maxlinestobuffer] [-u userid] [-s serverpidfile] [-t servertimeout] [--plugin=/path/to/pluginfile.py] [pluginfile.arg=value]


DESCRIPTION
       The Named Pipe Log Script allows you to replace a log file with a named pipe attached to a script. The server can then send the log output to a script instead of to a log file. This allows you to do
       many different things such as:

        * log only certain events e.g. failed binds, connections from certain ip addresses, etc.
        * log only lines that match a certain pattern
        * log only the last N lines - useful for enabling full error log debug levels in production environments
        * send an email or other notification when a certain event is detected

       The script is written in python, and allows plugins. By default, the script will log the last N lines (default 1000). There are two plugins provided - one to log only failed bind attempts,  and  one
       that will log only lines that match given regular expressions.

OPTIONS
       A summary of options is included below.

       /full/path/to/namedpipe
              Required  -  full path and file name of the named pipe. If this does not exist, it will be created.  If it exists and is a named pipe, the script will use it.  If it exists and is not a pipe,
              the script will abort.  The ownership will be the same as the user running the script (or see the -u option below).

       -m|--maxlines=N
              Number of lines to buffer - default is 1000

       -u|--userid=user
              The pipe and any other files created by the script will be chown()'d to this userid.  This may be a string userid name or a numeric userid value.

       -s|--serverpidfile=/path/to/servername.pid
              If you want the script to exit when a particular directory server  exists,  specify  the  full  path  to  the  file  containing  the  server  pid.   The  default  is  usually  something  like
              /var/run/dirsrv/slapd-<instancename>.pid where <instancename> is usually the hostname

       -t|--servertimeout=N
              Since  the serverpidfile may not exist yet when the script is run, the script will wait by default 60 seconds for the pid file to exist and the server to be started.  Use this option to spec‐
              ify a different timeout. The -t option only applies when using -s or --serverpid - otherwise it does nothing.

       --serverpid=P
              IF the server you want to track is already running, you can specify it using this argument.  If the specified pid is not valid, the script will abort.

       -p|--plugin=/full/path/to/pluginname.py
              Specify a plugin to use.  The plugin must be a python file and must end in .py.  It must specify a function called plugin and may specify functions called pre and post.

       pluginname.arg1=value ... pluginname.argN=value
              You can specify arguments to plugins on the command line.  If there is a plugin specified as --plugin=/full/path/to/pluginname.py, the arguments for  that  plugin  are  specified  as  plugin‐
              name.argname=value.  The script parses these arguments and passes them to the plugin pre function as a python dict.  IF there is more than one argument named pluginname.argname the values are
              passed as a python list.

DIRECTORY SERVER NOTES
       The directory server will usually need to be configured to log to the named pipe instead of the usual log file.  For example, use the following LDIF to tell the server to use  the  file  access.pipe
       for the access log:
        dn: cn=config
        changetype: modify
        replace: nsslapd-accesslog-maxlogsperdir
        nsslapd-accesslog-maxlogsperdir: 1
        -
        replace: nsslapd-accesslog-logexpirationtime
        nsslapd-accesslog-logexpirationtime: -1
        -
        replace: nsslapd-accesslog-logrotationtime
        nsslapd-accesslog-logrotationtime: -1
        -
        replace: nsslapd-accesslog
        nsslapd-accesslog: /var/log/dirsrv/slapd-localhost/access.pipe
        -
        replace: nsslapd-accesslog-logbuffering
        nsslapd-accesslog-logbuffering: off

       NOTE: Before doing this, you should save your current configuration so you can restore it later.
        ldapsearch  ...  -s  base  -b  "cn=config" nsslapd-accesslog-maxlogsperdir nsslapd-accesslog-logexpirationtime   nsslapd-accesslog-logrotationtime nsslapd-accesslog nsslapd-accesslog > savedaccess‐
       log.ldif

       The error log and audit log have similarly named configuration attributes e.g. nsslapd-errorlog, nsslapd-auditlog.  Note that the audit log is disabled by  default  -  use  nsslapd-auditlog-logging-
       enabled: on to enable it.

AUTHOR
       ds-logpipe.py was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug-in distribution.



                                                                                                March 31, 2017                                                                               DS-LOGPIPE.PY(1)
