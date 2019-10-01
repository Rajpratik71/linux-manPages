REPL-MONITOR(1)                                                                            General Commands Manual                                                                            REPL-MONITOR(1)



NAME
       repl-monitor - Directory Server replication monitor

SYNOPSIS
       repl‐monitor  [-f configuration‐file] [‐h host] [-p port] [-r] [-c connection] [-a alias] [-k color] [-u refresh‐url] [-s] [-t refresh‐interval] [-v]


DESCRIPTION
       Outputs the status of all of the configured Directory Servers participating in replication. The servers to query for status are specified in the configuration file.

OPTIONS
       A summary of options is included below:

       -h, --host host
              Hostname of DS server

       -p, --port port
              TCP port

       -f, --configfile configuration-file
              Configuration file

       -c, --conn connection
              Uses the same format as the configfile directive

       -a, --alias alias
              Uses the same format as the configfile directive

       -k, --color color
              Uses the same format as the configfile directive

       -r, --skip-header
              Removes extra HTML tags

       -u, --refreshurl refresh url
              Refresh url

       -t, --interval refresh interval
              Refresh interval

       -W, --prompt
              Prompt for passwords

       -s, --text
              Print plain text report


CONFIGURATION FILE
       This section describes the various directives that can be used in the configuration file.

       [connection]
              The connection details about a replica

              host:port:binddn:bindpwd:cert_file

              or,

              host:port=shadowport:binddn:bindpwd:cert_file

       [alias]
              Define an alias for a server, this alias is used in the report in place of the hostname/port

              alias = host:port

       [color]
              Set a color based on the replicaton lag time lowmark (in minutes)

              lowmark = color

EXAMPLE
       Example of a configuration file:

       [connection]
       localhost.localdomain:3891:cn=directory manager:password:*
       localhost2.localdomain:3892:cn=directory manager:password:*

       [alias]
       MY_SYSTEM1 = localhost.localdomain:3891
       MY_SYSTEM2 = localhost2.localdomain:3892

       [color]
       0 = #CCFFCC
       5 = #FFFFCC
       60 = #FFCCCC


AUTHOR
       repl-monitor was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       Manual page updated by Mark Reynolds <mreynolds@redhat.com> 3/31/2017
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 3 with an exception for plug‐in distribution.



                                                                                                March 31, 2017                                                                                REPL-MONITOR(1)
