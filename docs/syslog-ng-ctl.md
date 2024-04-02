SYSLOG-NG-CTL(1)                                          The syslog-ng control tool man                                          SYSLOG-NG-CTL(1)

NAME
       syslog-ng-ctl - Display message statistics and enable verbose, debug and trace modes in syslog-ng Open Source Edition

SYNOPSIS
       syslog-ng-ctl [command] [options]

DESCRIPTION
       NOTE: The syslog-ng-ctl application is distributed with the syslog-ng Open Source Edition system logging application, and is usually part
       of the syslog-ng package. The latest version of the syslog-ng application is available at the official syslog-ng website[1].

       This manual page is only an abstract; for the complete documentation of syslog-ng, see The syslog-ng Open Source Edition Administrator
       Guide[2].

       The syslog-ng-ctl application is a utility that can be used to:

       ·   enable/disable various syslog-ng messages for troubleshooting;

       ·   display statistics about the processed messages.

ENABLING TROUBLESHOOTING MESSAGES
       command [options]

       Use the syslog-ng-ctl <command> --set=on command to display verbose, trace, or debug messages. If you are trying to solve configuration
       problems, the debug (and occassionally trace) messages are usually sufficient; debug messages are needed mostly for finding software
       errors. After solving the problem, do not forget to turn these messages off using the syslog-ng-ctl <command> --set=off. Note that enabling
       debug messages does not enable verbose and trace messages.

       Use syslog-ng-ctl <command> without any parameters to display whether the particular type of messages are enabled or not.

       If you need to use a non-standard control socket to access syslog-ng, use the syslog-ng-ctl <command> --set=on --control=<socket> command
       to specify the socket to use.

       verbose
           Print verbose messages. If syslog-ng was started with the --stderr or -e option, the messages will be sent to stderr. If not specified,
           syslog-ng will log such messages to its internal source.

       trace
           Print trace messages of how messages are processed. If syslog-ng was started with the --stderr or -e option, the messages will be sent
           to stderr. If not specified, syslog-ng will log such messages to its internal source.

       debug
           Print debug messages. If syslog-ng was started with the --stderr or -e option, the messages will be sent to stderr. If not specified,
           syslog-ng will log such messages to its internal source.

       Example:

           syslog-ng-ctl verbose --set=on

THE STATS COMMAND
       stats [options]

       Use the stats command to display statistics about the processed messages. The stats command has the following options:

       --control=<socket> or -c
           Specify the socket to use to access syslog-ng. Only needed when using a non-standard socket.

       Example:

           syslog-ng-ctl stats

       An example output:

           src.internal;s_all#0;;a;processed;6445
           src.internal;s_all#0;;a;stamp;1268989330
           destination;df_auth;;a;processed;404
           destination;df_news_dot_notice;;a;processed;0
           destination;df_news_dot_err;;a;processed;0
           destination;d_ssb;;a;processed;7128
           destination;df_uucp;;a;processed;0
           source;s_all;;a;processed;7128
           destination;df_mail;;a;processed;0
           destination;df_user;;a;processed;1
           destination;df_daemon;;a;processed;1
           destination;df_debug;;a;processed;15
           destination;df_messages;;a;processed;54
           destination;dp_xconsole;;a;processed;671
           dst.tcp;d_network#0;10.50.0.111:514;a;dropped;5080
           dst.tcp;d_network#0;10.50.0.111:514;a;processed;7128
           dst.tcp;d_network#0;10.50.0.111:514;a;stored;2048
           destination;df_syslog;;a;processed;6724
           destination;df_facility_dot_warn;;a;processed;0
           destination;df_news_dot_crit;;a;processed;0
           destination;df_lpr;;a;processed;0
           destination;du_all;;a;processed;0
           destination;df_facility_dot_info;;a;processed;0
           center;;received;a;processed;0
           destination;df_kern;;a;processed;70
           center;;queued;a;processed;0
           destination;df_facility_dot_err;;a;processed;0

FILES
       /usr/sbin/syslog-ng-ctl

SEE ALSO
       The syslog-ng Administrator Guide[2]

       syslog-ng.conf(5)

       syslog-ng(8)

       The syslog-ng OSE 3.3 Administrator Guide[2]

       If you experience any problems or need help with syslog-ng, visit visit the syslog-ng wiki[3] or the syslog-ng mailing list[4].

       For news and notifications about of syslog-ng, visit the syslog-ng Insider Blog[5].

AUTHOR
       This manual page was written by the BalaBit Documentation Team <documentation@balabit.com>.

COPYRIGHT

       The authors grant permission to copy, distribute and/or modify this manual page under the terms of the GNU General Public License Version 2
       or newer (GPL v2+).

NOTES
        1. the official syslog-ng website
           http://www.balabit.com/network-security/syslog-ng/

        2.

                     The syslog-ng Open Source Edition Administrator Guide

           http://www.balabit.com/support/documentation/

        3. visit the syslog-ng wiki
           http://www.balabit.com/wiki/syslog-ng-faq

        4. syslog-ng mailing list
           https://lists.balabit.hu/mailman/listinfo/syslog-ng

        5. syslog-ng Insider Blog
           http://insider.blogs.balabit.com

syslog-ng Open Source Edition                                       10/24/2015                                                    SYSLOG-NG-CTL(1)
