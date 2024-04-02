ABRTD(8)                                                                                         ABRT Manual                                                                                         ABRTD(8)



NAME
       abrtd - automated bug reporting tool's daemon.

SYNOPSIS
       abrtd [-dsv[v]...]

DESCRIPTION
       abrtd is a daemon that watches for application crashes. When a crash occurs, it collects the problem data (core file, application’s command line etc.) and takes action according to the type of
       application that crashed and according to the configuration in the abrt.conf config file. There are plugins for various actions: for example to report the crash to Bugzilla, to mail the report, or
       to transfer the report via FTP or SCP. See the manual pages for the respective plugins.

OPTIONS
       -v
           Log more detailed debugging information.

       -d
           Stay in the foreground and log to standard error.

       -s
           Log to system log even with option -d.

       -t NUM
           Exit after NUM seconds of inactivity.

       -p
           Add program names to log.

CAVEATS
       When you use some other crash-catching tool specific for an application or an application type (for example BugBuddy for GNOME applications), crashes of this type will be handled by that tool and
       not by abrtd. If you want abrtd to handle these crashes, turn off the higher-level crash-catching tool.

AUTHORS
       ·   ABRT team

SEE ALSO
       abrt.conf(5)



abrt 2.1.11                                                                                       08/12/2019                                                                                         ABRTD(8)
