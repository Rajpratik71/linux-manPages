SVSETUP(1)                                                         User Commands                                                        SVSETUP(1)

NAME
       svsetup - Service setup tool for daemontools

SYNOPSIS
       svsetup [OPTION]... CMD SERVICE

DESCRIPTION
       Service setup tool for daemontools

       -u USER
              Specify service user name (Default: root)

       -l USER
              Specify log user name (Default: root)

       -n     Do not setup logging with multilog

       -e ETCDIR
              Specify cfg directory (Default: /etc/sv/SERVICE)

       -L LOGDIR
              Specify log directory (Default: /var/log/sv/SERVICE)

       -s SERVICEDIR
              Specify service directory (Default: automatically

              detected)

       -d     Delete service user on removal

       -D     Delete log user on removal

       -h, --help
              Display help and exit

       -V, --version
              Display version and exit

       CMD    Specifies action to perform:

       CREATE Create new service

       REMOVE Delete existing service

       ENABLE Enable service

       DISABLE
              Disable service

       SERVICE
              Specifies the service name

       NOTE:  If you REMOVE a service and specify a service user (with -u) and/or a log user (with -l) these users (except root) are removed, too,
       if you also specify the option -d and/or -D! This happens without any confirmation requests and the users are deleted even if they were not
       created by svsetup!

       If  you  create  a  new service a default run script is created. If there is already a run script in ETCDIR this existing runscript is used
       instead.

REPORTING BUGS
       Report bugs to Klaus Reimer <k@ailis.de>

COPYRIGHT
       Copyright © 2000-2011 by Klaus Reimer
       This is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the  Free
       Software Foundation; either version 2 of the License, or (at your option) any later version.

svsetup 0.6                                                          May 2011                                                           SVSETUP(1)
