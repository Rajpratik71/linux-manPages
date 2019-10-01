LOGGER(1)                                                                                       User Commands                                                                                       LOGGER(1)



NAME
       logger - a shell command interface to the syslog(3) system log module

SYNOPSIS
       logger [options] [message]

DESCRIPTION
       logger makes entries in the system log.  It provides a shell command interface to the syslog(3) system log module.

OPTIONS
       -n, --server server
              Write  to the specified remote syslog server instead of to the builtin syslog routines.  Unless --udp or --tcp is specified the logger will first try to use UDP, but if it fails a TCP connec‐
              tion is attempted.

       -d, --udp
              Use datagram (UDP) only.  By default the connection is tried to syslog port defined in /etc/services, which is often 514.

       -T, --tcp
              Use stream (TCP) only.  By default the connection is tried to syslog-conn port defined in /etc/services, which is often 601.

       -P, --port port
              Use the specified port.  When this option is not specified, the port defaults to syslog for udp and to syslog-conn for tcp connections.

       -i, --id
              Log the process ID of the logger process with each line.

       -f, --file file
              Log the contents of the specified file.  This option cannot be combined with a command-line message.

       -h, --help
              Display a help text and exit.

       -p, --priority priority
              Enter the message into the log with the specified priority.  The priority may be specified numerically or as a facility.level pair.  For example, -p local3.info logs the message  as  informa‐
              tional in the local3 facility.  The default is user.notice.

       -S, --size size
              Sets the maximum permitted message size. The default is 1KiB, which is the limit traditionally used and specified in RFC 3164. When selecting a maximum message size, it is important to ensure
              that the receiver supports the max size as well, otherwise messages may become truncated.

       -s, --stderr
              Output the message to standard error as well as to the system log.

       -t, --tag tag
              Mark every line to be logged with the specified tag.  The default tag is the name of the user logged in on the terminal (or a user name based on effective user ID).

       -u, --socket socket
              Write to the specified socket instead of to the builtin syslog routines.

       -V, --version
              Display version information and exit.

       --     End the argument list.  This is to allow the message to start with a hyphen (-).

       message
              Write the message to log; if not specified, and the -f flag is not provided, standard input is logged.

       The logger utility exits 0 on success, and >0 if an error occurs.

FACILITIES AND LEVELS
       Valid facility names are:

              auth
              authpriv   for security information of a sensitive nature
              cron
              daemon
              ftp
              kern       cannot be generated from userspace process, automatically converted to user
              lpr
              mail
              news
              syslog
              user
              uucp
              local0
                to
              local7
              security   deprecated synonym for auth

       Valid level names are:

              emerg
              alert
              crit
              err
              warning
              notice
              info
              debug
              panic     deprecated synonym for emerg
              error     deprecated synonym for err
              warn      deprecated synonym for warning

       For the priority order and intended purposes of these facilities and levels, see syslog(3).

EXAMPLES
       logger System rebooted
       logger -p local0.notice -t HOSTIDM -f /dev/idmc
       logger -n loghost.example.com System rebooted

SEE ALSO
       syslog(3), syslogd(8)

STANDARDS
       The logger command is expected to be IEEE Std 1003.2 ("POSIX.2") compatible.

AVAILABILITY
       The logger command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                        April 2013                                                                                        LOGGER(1)
