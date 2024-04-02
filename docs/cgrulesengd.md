CGRULESENGD(8)                                                                                 libcgroup Manual                                                                                CGRULESENGD(8)



NAME
       cgrulesengd - control group rules daemon


SYNOPSIS
       cgrulesengd [options]


DESCRIPTION
       cgrulesengd  is  a  daemon, which distributes processes to control groups. When any process changes its effective UID or GID, cgrulesengd inspects the list of rules loaded from the cgrules.conf file
       and moves the process to the appropriate control group.

       The list of rules is read during the daemon startup is are cached in the daemon's memory.  The daemon reloads the list of rules when it receives SIGUSR2 signal.  The daemon reloads the list of  tem‐
       plates when it receives SIGUSR1 signal.

       The daemon opens a standard unix socket to receive 'sticky' requests from cgexec.


OPTIONS
       -h|--help
              Display help.

       -f <path>|--logfile=<path>
              Write  log  messages to the given log file. When '-' is used as <path>, log messages are written to the standard output. If '-f' and '-s' are used together, the logs are sent to both destina‐
              tions.


       -s[facility]|--syslog=[facility]
              Write log messages to syslog. The default facility is DAEMON. If '-f' and '-s' are used together, the logs are sent to both destinations.

       -n|--nodaemon
              Don't fork the daemon, stay in the foreground.

       -v|--verbose
              Display more log messages. This option can be used three times to enable more verbose log messages.

       -q|--quiet
              Display less log messages.

       -Q|--nolog
              Disable logging.

       -d|--debug
              Equivalent to '-nvvvf -', i.e. don't fork the daemon, display all log messages and write them to the standard output.

       -u <user>|--socket-user=<user>
              -g <group>|--socket-group=<group> Set the owner of cgrulesengd socket. Assumes that cgexec runs with proper suid permissions so it can write to the socket when cgexec --sticky is used.


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


FILES
       /etc/cgrules.conf
              the default libcgroup configuration file

       /etc/cgconfig.conf
              the default templates file

       /etc/cgconfig.d/
              the default templates directory


SEE ALSO
       cgrules.conf (5)



Linux                                                                                             2009-02-18                                                                                   CGRULESENGD(8)
