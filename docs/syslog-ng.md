SYSLOG-NG(8)                                                 The syslog-ng manual page                                                SYSLOG-NG(8)

NAME
       syslog-ng - syslog-ng system logger application

SYNOPSIS
       syslog-ng [options]

DESCRIPTION
       This manual page is only an abstract; for the complete documentation of syslog-ng, see The syslog-ng Open Source Edition Administrator
       Guide[1] or the official syslog-ng website[2].

       The syslog-ng OSE application is a flexible and highly scalable system logging application. Typically, syslog-ng is used to manage log
       messages and implement centralized logging, where the aim is to collect the log messages of several devices on a single, central log
       server. The different devices - called syslog-ng clients - all run syslog-ng, and collect the log messages from the various applications,
       files, and other sources. The clients send all important log messages to the remote syslog-ng server, where the server sorts and stores
       them.

OPTIONS
       --cfgfile <file> or -f <file>
           Use the specified configuration file.

       --chroot <dir> or -C <dir>
           Change root to the specified directory. The configuration file is read after chrooting so, the configuration file must be available
           within the chroot. That way it is also possible to reload the syslog-ng configuration after chrooting. However, note that the --user
           and --group options are resolved before chrooting.

       --debug or -d
           Start syslog-ng in debug mode.

       --default-modules
           A comma-separated list of the modules that are loaded automatically. Modules not loaded automatically can be loaded by including the
           @module <modulename> statement in the syslog-ng OSE configuration file. The following modules are loaded by default: affile, afprog,
           afsocket, afuser, basicfuncs, csvparser, dbparser, syslogformat, afsql. Available only in syslog-ng Open Source Edition 3.3 and later.

       --enable-core
           Enable syslog-ng to write core files in case of a crash to help support and debugging.

       --fd-limit <number>
           Set the minimal number of required file descriptors (fd-s); this sets how many files syslog-ng can keep open simultaneously. Default
           value: 4096. Note that this does not override the global ulimit setting of the host.

       --foreground or -F
           Do not daemonize, run in the foreground.

       --group <group> or -g <group>
           Switch to the specified group after initializing the configuration file.

       --help or -h
           Display a brief help message.

       --module-registry
           Display the list and description of the available modules. Note that not all of these modules are loaded automatically, only the ones
           specified in the --default-modules option. Available only in syslog-ng Open Source Edition 3.3 and later.

       --no-caps
           Run syslog-ng as root, without capability-support. This is the default behavior. On Linux, it is possible to run syslog-ng as non-root
           with capability-support if syslog-ng was compiled with the --enable-linux-caps option enabled. (Execute syslog-ng --version to display
           the list of enabled build parameters.)

       --persist-file <persist-file> or -R <persist-file>
           Set the path and name of the syslog-ng.persist file where the persistent options and data are stored.

       --pidfile <pidfile> or -p <pidfile>
           Set path to the PID file where the pid of the main process is stored.

       --preprocess-into <output-file>
           After processing the configuration file and resolving included files and variables, write the resulting configuration into the
           specified output file. Available only in syslog-ng Open Source Edition 3.3 and later.

       --process-mode <mode>
           Sets how to run syslog-ng: in the foreground (mainly used for debugging), in the background as a daemon, or in safe-background mode. By
           default, syslog-ng runs in safe-background mode. This mode creates a supervisor process called supervising syslog-ng , that restarts
           syslog-ng if it crashes.

       --stderr or -e
           Log internal messages of syslog-ng to stderr. Mainly used for debugging purposes in conjunction with the --foreground option. If not
           specified, syslog-ng will log such messages to its internal source.

       --syntax-only or -s
           Verify that the configuration file is syntactically correct and exit.

       --user <user> or -u <user>
           Switch to the specified user after initializing the configuration file (and optionally chrooting). Note that it is not possible to
           reload the syslog-ng configuration if the specified user has no privilege to create the /dev/log file.

       --verbose or -v
           Enable verbose logging used to troubleshoot syslog-ng.

       --version or -V
           Display version number and compilation information, and also the list and short description of the available modules. For detailed
           description of the available modules, see the --module-registry option. Note that not all of these modules are loaded automatically,
           only the ones specified in the --default-modules option.

       --worker-threads
           Sets the number of worker threads syslog-ng OSE can use, including the main syslog-ng OSE thread. Note that certain operations in
           syslog-ng OSE can use threads that are not limited by this option. This setting has effect only when syslog-ng OSE is running in
           multithreaded mode. Available only in syslog-ng Open Source Edition 3.3 and later. See The syslog-ng Open Source Edition 3.3
           Administrator Guide for details.

FILES
       /usr/

       /etc/syslog-ng/syslog-ng.conf

SEE ALSO
       syslog-ng.conf(5)

       The syslog-ng OSE 3.3 Administrator Guide[1]

       If you experience any problems or need help with syslog-ng, visit visit the syslog-ng wiki[3] or the syslog-ng mailing list[4].

       For news and notifications about of syslog-ng, visit the syslog-ng Insider Blog[5].

AUTHOR
       This manual page was written by the BalaBit Documentation Team <documentation@balabit.com>.

COPYRIGHT

       The authors grant permission to copy, distribute and/or modify this manual page under the terms of the GNU General Public License Version 2
       or newer (GPL v2+).

NOTES
        1. The syslog-ng Open Source Edition Administrator Guide
           http://www.balabit.com/support/documentation/

        2. the official syslog-ng website
           http://www.balabit.com/network-security/syslog-ng/

        3. visit the syslog-ng wiki
           http://www.balabit.com/wiki/syslog-ng-faq

        4. syslog-ng mailing list
           https://lists.balabit.hu/mailman/listinfo/syslog-ng

        5. syslog-ng Insider Blog
           http://insider.blogs.balabit.com

syslog-ng Open Source Edition                                       10/24/2015                                                        SYSLOG-NG(8)
