TEAMD(8)                                                                                         Team daemon                                                                                         TEAMD(8)



NAME
       teamd — team network device control daemon

SYNOPSIS
       teamd -k [-p pid_file] [-g]
       teamd -e [-p pid_file] [-g]
       teamd -c config_text [-p pid_file] [-gdrD] [-Z address]
       teamd -f config_file [-p pid_file] [-gdrD] [-Z address]
       teamd -h|-V

DESCRIPTION
       teamd  is  a daemon to control a given team network device, during runtime, as a puppeteer controls a puppet. It uses libteam to communicate with the kernel team device instance via Netlink sockets.
       The behaviour depends on the selected runner and its configuration. This daemon is part of the libteam project.

OPTIONS
       -h, --help
              Print help text to console and exit.

       -V, --version
              Print version information to console and exit.

       -d, --daemonize
              Daemonize after startup.

       -k, --kill
              Kill running daemon instance.

       -e, --check
              Return 0 if a daemon is already running.

       -f filename, --config-file filename
              Load the specified configuration file.

       -c text, --config text
              Use given JSON format configuration string. If this option is present then -f option will be ignored.

       -p filename, --pid-file filename
              Use the specified PID file.

       -g, --debug
              Turns on debugging messages. Repeating the option increases verbosity.

       -l, --log-output
              Force teamd log output to stdout, stderr or syslog.

       -r, --force-recreate
              Force team device recreation in case it already exists.

       -o, --take-over
              Take over the device if it already exists.

       -N, --no-quit-destroy
              This option also ensures that the team device is not removed after teamd finishes.

       -t devicename, --team-dev devicename
              Use the specified team device name (overrides "device" key in the configuration).

       -n, --no-ports
              Start without ports, even if they are listed in the configuration.

       -D, --dbus-enable
              Enable D-Bus interface.

       -Z address, --zmq-enable address
              Enable ZMQ interface. Possible address formats are "tcp://ip:port", "ipc://path" and others. Detailed description of ZMQ library is in page http://zguide.zeromq.org/page:all.

       -U, --usock-enable
              Enable UNIX domain socket interface. This is enabled by default.

       -u, --usock-disable
              Disable UNIX domain socket interface.

SEE ALSO
       teamdctl(8), teamd.conf(5), teamnl(8), bond2team(1)

AUTHOR
       Jiri Pirko is the original author and current maintainer of libteam.



libteam                                                                                           2013-07-10                                                                                         TEAMD(8)
