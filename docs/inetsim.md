inetsim(1)                                                                                                                              inetsim(1)

NAME
       inetsim - INetSim is a suite for simulating common internet services

SYNOPSIS
       inetsim [--config <configuration file>] [--version] [--data-dir <data directory>] [--log-dir <log directory>] [--report-dir <report
       directory>] [--bind-address <ip address>] [--max-childs <maximum child processes>] [--user <user name>] [--faketime-init-delta <initial
       time delta>] [--faketime-auto-delay <delay time>] [--faketime-auto-incr <stepwidth>] [--session <session name>] [--pidfile <pid file>]

DESCRIPTION
       INetSim simulates common internet services like DNS, HTTP, SMTP or POP3.

OPTIONS
       --config <configuration file>
           The configuration file to use, default is conf/inetsim.conf in the current directory.

       --version
           Output version information.

       --data-dir <data directory>
           The data directory to use, default is data/ in the current directory.

       --log-dir <log directory>
           The log directory to use, default is log/ in the current directory.

       --report-dir <report directory>
           The report directory to use, default is report/ in the current directory.

       --bind-address <IP address>
           The IP address to bind services to.

       --max-childs <maximum child processes>
           The maximum number of child processes (number of parallel connections) for each service. Default is 10.

       --user <username>
           User to run services. Default is 'nobody'.

       --faketime-init-delta <initial time delta>
           Initial number of seconds (positive or negative) relative to current date/time for fake time used by all services. This overrides the
           option 'faketime-init-delta' in the configuration file.  Default is 0 (use current date/time).

       --faketime-auto-delay <delay time>
           Number of seconds to wait before incrementing or decrementing fake time by amount of seconds specified with faketime-auto-incr.
           Setting to '0' disables this option. This overrides the option 'faketime-auto-delay' in the configuration file.  Default is 0
           (disabled).

       --faketime-auto-incr <stepwidth>
           Number of seconds by which fake time is incremented or decremented at regular intervals specified by faketime_auto_delay. This option
           only takes effect if faketime-auto-delay is enabled (not set to '0').  This overrides the option 'faketime-auto-incr' in the
           configuration file.  Default is 3600.

       --session <session name>
           Session name to use, default is the PID of the parent process.

       --pidfile <pid file>
           The pid file to use, default is /var/run/inetsim.pid.

EXAMPLES
       Start the simulation with session name 'simtest5'

               # inetsim --session simtest5

       Start the simulation with a one-day-jump to the future after 60 seconds

               # inetsim --faketime-auto-delay 60 --faketime-auto-incr 86400

       dito, but with jump to the past

               # inetsim --faketime-auto-delay 60 --faketime-auto-incr -86400

REQUIRES
       Perl 5, Getopt::Long, Net::Server, Net::DNS, IO::Handle, IO::Socket, IO::Select, IPC::Shareable, Digest::SHA, File::Copy, MIME::Base64,
       IPTables::IPv4::IPQueue (optional)

AUTHOR
       Matthias Eckert <me@inetsim.org>, Thomas Hungenberg <th@inetsim.org>

perl v5.10.1                                                        2014-05-24                                                          inetsim(1)
