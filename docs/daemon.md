DAEMON.C(1)                                                        User Commands                                                       DAEMON.C(1)

NAME
       daemon - turns other processes into daemons

SYNOPSIS
        usage: daemon [options] [--] [cmd arg...]
        options:

        -h, --help                - Print a help message then exit
        -V, --version             - Print a version message then exit
        -v, --verbose[=level]     - Set the verbosity level
        -d, --debug[=level]       - Set the debugging level

        -C, --config=path         - Specify the system configuration file
        -N, --noconfig            - Bypass the system configuration file
        -n, --name=name           - Guarantee a single named instance
        -X, --command=cmd         - Specify the client command as an option
        -P, --pidfiles=/dir       - Override standard pidfile location
        -F, --pidfile=/path       - Override standard pidfile name and location

        -u, --user=user[:[group]] - Run the client as user[:group]
        -R, --chroot=path         - Run the client with path as root
        -D, --chdir=path          - Run the client in directory path
        -m, --umask=umask         - Run the client with the given umask
        -e, --env="var=val"       - Set a client environment variable
        -i, --inherit             - Inherit environment variables
        -U, --unsafe              - Allow execution of unsafe executable
        -S, --safe                - Deny execution of unsafe executable
        -c, --core                - Allow core file generation

        -r, --respawn             - Respawn the client when it terminates
        -a, --acceptable=#        - Minimum acceptable client duration (seconds)
        -A, --attempts=#          - Respawn # times on error before delay
        -L, --delay=#             - Delay between spawn attempt bursts (seconds)
        -M, --limit=#             - Maximum number of spawn attempt bursts
            --idiot               - Idiot mode (trust root with the above)

        -f, --foreground          - Run the client in the foreground
        -p, --pty[=noecho]        - Allocate a pseudo terminal for the client

        -l, --errlog=spec         - Send daemon's error output to syslog or file
        -b, --dbglog=spec         - Send daemon's debug output to syslog or file
        -o, --output=spec         - Send client's output to syslog or file
        -O, --stdout=spec         - Send client's stdout to syslog or file
        -E, --stderr=spec         - Send client's stderr to syslog or file

            --running             - Check if a named daemon is running
            --restart             - Restart a named daemon client
            --stop                - Terminate a named daemon process

DESCRIPTION
       daemon(1) turns other processes into daemons. There are many tasks that need to be performed to correctly set up a daemon process. This can
       be tedious. daemon performs these tasks for other processes.

       The preparatory tasks that daemon performs for other processes are:

       ·   First revoke any setuid or setgid privileges that daemon may have been installed with (by system administrators who laugh in the face
           of danger).

       ·   Process command line options.

       ·   Change the root directory if the --chroot option was supplied.

       ·   Change the process uid and gid if the --user option was supplied. Only root can use this option. Note that the uid of daemon itself is
           changed, rather than just changing the uid of the client process.

       ·   Read the system configuration file (/etc/daemon.conf by default, or specified by the --config option) unless the --noconfig option was
           supplied. Then read the user's configuration file (~/.daemonrc), if any.  Generic options are processed first, then options specific to
           the daemon with the given name. Note: The root directory and the user must be set before access to the configuration file can be
           attempted so neither --chroot nor --user options may appear in the configuration file.

       ·   Disable core file generation to prevent leaking sensitive information in daemons run by root (unless the --core option was supplied).

       ·   Become a daemon process:

           ·   If daemon was not invoked by init(8) or inetd(8):

               ·   Background the process to lose process group leadership.

               ·   Start a new process session.

               ·   Under SVR4, background the process again to lose process session leadership. This prevents the process from ever gaining a
                   controlling terminal. This only happens when SVR4 is defined and NO_EXTRA_SVR4_FORK is not defined when libslack(3) is
                   compiled. Before doing this, ignore SIGHUP because when the session leader terminates, all processes in the foreground process
                   group are sent a SIGHUP signal (apparently). Note that this code may not execute (e.g. when started by init(8) or inetd(8) or
                   when either SVR4 was not defined or NO_EXTRA_SVR4_FORK was defined when libslack(3) was compiled). This means that the client
                   can't make any assumptions about the SIGHUP handler.

           ·   Change directory to the root directory so as not to hamper umounts.

           ·   Clear the umask to enable explicit file creation modes.

           ·   Close all open file descriptors. If daemon was invoked by inetd(8), stdin, stdout and stderr are left open since they are open to a
               socket.

           ·   Open stdin, stdout and stderr to /dev/null in case something requires them to be open. Of course, this is not done if daemon was
               invoked by inetd(8).

           ·   If the --name option was supplied, create and lock a file containing the process id of the daemon process. The presence of this
               locked file prevents two instances of a daemon with the same name from running at the same time. The standard location of the
               pidfile is /var/run for root or /tmp for ordinary users. If the --pidfiles option was supplied, its argument specifies the
               directory in which the pidfile will be placed.  If the --pidfile option was supplied, its argument specifies the name of the
               pidfile and the directory in which it will be placed.

       ·   If the --umask option was supplied, set the umask to its argument.  Otherwise, set the umask to 022 to prevent clients from
           accidentally creating group or world writable files.

       ·   Set the current directory if the --chdir option was supplied.

       ·   Spawn the client command and wait for it to terminate. The client command may be specified as command line arguments or as the argument
           of the --command option. If both the --command option and command line arguments are present, the client command is the result of
           appending the command line arguments to the argument of the --command option.

       ·   If the --syslog, --outlog and/or --errlog options were supplied, the client's standard output and/or standard error are captured by
           daemon and sent to the respective syslog destinations.

       ·   When the client terminates, daemon respawns it if the --respawn option was supplied. If the client ran for less than 300 seconds (or
           the value of the --acceptable option), then daemon sees this as an error. It will attempt to restart the client up to five times (or
           the value of the --attempts option) before waiting for 300 seconds (or the value of the --delay option). This gives the administrator
           the chance to correct whatever is preventing the client from running without overloading system resources. If the --limit option was
           supplied, daemon terminates after the specified number of spawn attempt bursts. The default is zero which means never give up, never
           surrender.

           When the client terminates and the --respawn option wasn't supplied, daemon terminates.

       ·   If daemon receives a SIGTERM signal, it propagates the signal to the client and then terminates.

       ·   If daemon receives a SIGUSR1 signal (from another invocation of daemon supplied with the --restart option), it sends a SIGTERM signal
           to the client. If started with the --respawn option, the client process will be restarted after it is killed by the SIGTERM signal.

       ·   If the --foreground option was supplied, the client process is run as a foreground process and is not turned into a daemon. If daemon
           is connected to a terminal, so will the client process. If daemon is not connected to a terminal but the client needs to be connected
           to a terminal, use the --pty option.

OPTIONS
       -h, --help
           Display a help message and exit.

       -V, --version
           Display a version message and exit.

       -v[level], --verbose[=level]
           Set the message verbosity level to level (or 1 if level is not supplied). daemon does not have any verbose messages so this has no
           effect unless the --running option is supplied.

       -d[level], --debug[=level]
           Set the debug message level to level (or 1 if level is not supplied).  Level 1 traces high level function calls. Level 2 traces lower
           level function calls and shows configuration information. Level 3 adds environment variables. Level 9 adds every return value from
           select(2) to the output.  Debug messages are sent to the destination specified by the --dbglog option (by default, the syslog(3)
           facility, daemon.debug).

       -C path, --config=path
           Specify the configuration file to use. By default, /etc/daemon.conf is the configuration file if it exists and is not group or world
           writable and does not exist in a group or world writable directory. The configuration file lets you predefine options that apply to all
           clients and to specifically named clients.

       -N, --noconfig
           Bypass the system configuration file, /etc/daemon.conf. Only the user's ~/.daemonrc configuration file will be read (if it exists).

       -n name, --name=name
           Create and lock a pid file (/var/run/name.pid), ensuring that only one daemon with the given name is active at the same time.

       -X cmd, --command=cmd
           Specify the client command as an option. If a command is specified along with its name in the configuration file, then daemons can be
           started merely by mentioning their name:

               daemon --name ftumpch

           Note: Specifying the client command in the configuration file means that no shell features are available (i.e. no meta characters).

       -P /dir, --pidfiles=/dir
           Override the standard pidfile location. The standard pidfile location is user dependent: root's pidfiles live in /var/run. Normal
           users' pidfiles live in /tmp. This option can only be used with the --name option. Use this option if these locations are unacceptable
           but make sure you don't forget where you put your pidfiles. This option is best used in configuration files or in shell scripts, not on
           the command line.

       -F /path, --pidfile=/path
           Override the standard pidfile name and location. The standard pidfile location is described immediately above. The standard pidfile
           name is the argument of the --name option followed by .pid. Use this option if the standard pidfile name and location are unacceptable
           but make sure you don't forget where you put your pidfile. This option should only be used in configuration files or in shell scripts,
           not on the command line.

       -u user[:[group]], --user=user[:[group]]
           Run the client as a different user (and group). This only works for root.  If the argument includes a :group specifier, daemon will
           assume the specified group and no other. Otherwise, daemon will assume all groups that the specified user is in. For backwards
           compatibility, "." may be used instead of ":" to separate the user and group but since "." may appear in user and group names,
           ambiguities can arise such as using --user=u.g with users u and u.g and group g. With such an ambiguity, daemon will assume the user u
           and group g. Use --user=u.g: instead for the other interpretation.

       -R path, --chroot=path
           Change the root directory to path before running the client. On some systems, only root can do this. Note that the path to the client
           program and to the configuration file (if any) must be relative to the new root path.

       -D path, --chdir=path
           Change the directory to path before running the client.

       -m umask, --umask=umask
           Change the umask to umask before running the client. umask must be a valid octal mode. The default umask is 022.

       -e var=val, --env=var=val
           Set an environment variable for the client process. This option can be used any number of times. If it is used, only the supplied
           environment variables are passed to the client process. Otherwise, the client process inherits the current set of environment
           variables.

       -i, --inherit
           Explicitly inherit environment variables. This is only needed when the --env option is used. When this option is used, the --env option
           adds to the inherited environment, rather than replacing it.

       -U, --unsafe
           Allow reading an unsafe configuration file and execution of an unsafe executable. A configuration file or executable is unsafe if it is
           group or world writable or is in a directory that is group or world writable (following symbolic links). If an executable is a script
           interpreted by another executable, then it is considered unsafe if the interpreter is unsafe. If the interpreter is /usr/bin/env (with
           an argument that is a command name to be searched for in $PATH), then that command must be safe. By default, daemon(1) will refuse to
           read an unsafe configuration file or to execute an unsafe executable when run by root. This option overrides that behaviour and hence
           should never be used.

       -S, --safe
           Deny reading an unsafe configuration file and execution of an unsafe executable. By default, daemon(1) will allow reading an unsafe
           configuration file and execution of an unsafe executable when run by ordinary users. This option overrides that behaviour.

       -c, --core
           Allow the client to create a core file. This should only be used for debugging as it could lead to security holes in daemons run by
           root.

       -r, --respawn
           Respawn the client when it terminates.

       -a #, --acceptable=#
           Specify the minimum acceptable duration in seconds of a client process. The default value is 300 seconds. It cannot be set to less than
           10 seconds except by root when used in conjunction with the --idiot option. This option can only be used with the --respawn option.

           less than this, it is considered to have failed.

       -A #, --attempts=#
           Number of attempts to spawn before delaying. The default value is 5. It cannot be set to more than 100 attempts except by root when
           used in conjunction with the --idiot option. This option can only be used with the --respawn option.

       -L #, --delay=#
           Delay in seconds between each burst of spawn attempts. The default value is 300 seconds. It cannot be set to less than 10 seconds
           except by root when used in conjunction with the --idiot option. This option can only be used with the --respawn option.

       -M #, ---limit=#
           Limit the number of spawn attempt bursts. The default value is zero which means no limit. This option can only be used with the
           --respawn option.

       --idiot
           Turn on idiot mode in which daemon will not enforce the minimum or maximum values normally imposed on the --acceptable, --attempts and
           --delay option arguments. The --idiot option must appear before any of these options. Only the root user may use this option because it
           can turn a slight misconfiguration into a lot of wasted CPU effort and log messages.

       -f, --foreground
           Run the client in the foreground. The client is not turned into a daemon.

       -p[noecho], --pty[=noecho]
           Connect the client to a pseudo terminal. This option can only be used with the --foreground option. This is the default when the
           --foreground option is supplied and daemon's standard input is connected to a terminal. This option is only necessary when the client
           process must be connected to a controlling terminal but daemon itself has been run without a controlling terminal (e.g. from cron(8) or
           a pipeline).

           If the noecho argument is supplied with this option, the client's side of the pseudo terminal will be set to noecho mode. Use this only
           if there really is a terminal involved and input is being echoed twice.

       -l spec, --errlog=spec
           Send daemon's standard output and error to the syslog destination or file specified by spec. If spec is of the form
           "facility.priority", then output is sent to syslog(3). Otherwise, output is appended to the file whose path is given in spec. By
           default, output is sent to daemon.err.

       -b spec, --dbglog=spec
           Send daemon's debug output to the syslog destination or file specified by spec. If spec is of the form "facility.priority", then output
           is sent to syslog(3). Otherwise, output is appended to the file whose path is given in spec. By default, output is sent to
           daemon.debug.

       -o spec, --output=spec
           Capture the client's standard output and error and send it to the syslog destination or file specified by spec. If spec is of the form
           "facility.priority", then output is sent to syslog(3). Otherwise, output is appended to the file whose path is given in spec. By
           default, output is discarded unless the --foreground option is present. In this case, the client's stdout and stderr are propagated to
           daemon's stdout and stderr respectively.

       -O spec, --stdout=spec
           Capture the client's standard output and send it to the syslog destination or file specified by spec. If spec is of the form
           "facility.priority", then output is sent to syslog(3). Otherwise, stdout is appended to the file whose path is given in spec. By
           default, stdout is discarded unless the --foreground option is present, in which case, the client's stdout is propagated to daemon's
           stdout.

       -E spec, --stderr=spec
           Capture the client's standard error and send it to the syslog destination specified by spec. If spec is of the form
           "facility.priority", then stderr is sent to syslog(3). Otherwise, stderr is appended to the file whose path is given in spec. By
           default, stderr is discarded unless the --foreground option is present, in this case, the client's stderr is propagated to daemon's
           stderr.

       --running
           Check whether or not a named daemon is running, then exit(3) with EXIT_SUCCESS if the named daemon is running or EXIT_FAILURE if it
           isn't. If the --verbose option is supplied, print a message before exiting. This option can only be used with the --name option. Note
           that the --chroot, --user, --name, --pidfiles and --pidfile (and possibly --config) options must be the same as for the target daemon.
           Note that the --running option must appear before any --pidfile or --pidfiles option when checking if another user's daemon is running
           otherwise you might get an error about the pidfile directory not being writable.

       --restart
           Instruct a named daemon to terminate and restart its client process. This option can only be used with the --name option. Note that the
           --chroot, --user, --name, --pidfiles and --pidfile (and possibly --config) options must be the same as for the target daemon.

       --stop
           Stop a named daemon then exit(3). This option can only be used with the --name option. Note that the --chroot, --user, --name,
           --pidfiles and --pidfile (and possibly --config) options must be the same as for the target daemon.

       As with all other programs, a -- argument signifies the end of options.  Any options that appear on the command line after -- are part of
       the client command.

FILES
       /etc/daemon.conf, ~/.daemonrc - define default options

       Each line of the configuration file consists of a client name or '*', followed by whitespace, followed by a comma separated list of
       options. Blank lines and comments ('#' to end of the line) are ignored. Lines may be continued with a '\' character at the end of the line.

       For example:

           *       errlog=daemon.err,output=local0.err,core
           test1   syslog=local0.debug,debug=9,verbose=9,respawn
           test2   syslog=local0.debug,debug=9,verbose=9,respawn

       The command line options are processed first to look for a --config option. If no --config option was supplied, the default file,
       /etc/daemon.conf, is used. If the user has their own configuration file (~/.daemonrc) it is also used. If the configuration files contain
       any generic ('*') entries, their options are applied in order of appearance.  If the --name option was supplied and the configuration files
       contain any entries with the given name, their options are then applied in order of appearance. Finally, the command line options are
       applied again. This ensures that any generic options apply to all clients by default. Client specific options override generic options.
       User options override system wide options. Command line options override everything else.

       Note that the configuration files are not opened and read until after any --chroot and/or --user command line options are processed. This
       means that the configuration file paths and the client's file path must be relative to the --chroot argument. It also means that the
       configuration files and the client executable must be readable/executable by the user specified by the --user argument. It also means that
       the --chroot and --user options must not appear in the configuration file. Also note that the --name must not appear in the configuration
       file either.

BUGS
       If you specify (in a configuration file) that all clients allow core file generation, there is no way to countermand that for any client
       (without using an alternative configuration file). So don't do that. The same applies to respawning and foreground.

       It is possible for the client process to obtain a controlling terminal under BSD. If anything calls open(2) on a terminal device without
       the O_NOCTTY flag, the process doing so will obtain a controlling terminal and then be susceptible to unintended termination by a SIGHUP.

       Clients run in the foreground with a pseudo terminal don't respond to job control (i.e. suspending with Control-Z doesn't work). This is
       because the client belongs to an orphaned process group (it starts in its own process session) so the kernel won't send it SIGSTOP signals.
       However, if the client is a shell that supports job control, it's subprocesses can be suspended.

       Clients can only be restarted if they were started with the --respawn option. Using --restart on a non-respawning daemon client is
       equivalent to using --stop.

MAILING LISTS
       The following mailing lists exist for daemon related discussion:

        daemon-announce@libslack.org - Announcements
        daemon-users@libslack.org    - User forum
        daemon-dev@libslack.org      - Development forum

       To subscribe to any of these mailing lists, send a mail message to listname-request@libslack.org with subscribe as the message body.  e.g.

        $ echo subscribe | mail daemon-announce-request@libslack.org
        $ echo subscribe | mail daemon-users-request@libslack.org
        $ echo subscribe | mail daemon-dev-request@libslack.org

       Or you can send a mail message to majordomo@libslack.org with subscribe listname in the message body. This way, you can subscribe to
       multiple lists at the same time.  e.g.

        $ mail majordomo@libslack.org
        subscribe daemon-announce
        subscribe daemon-users
        subscribe daemon-dev
        .

       A digest version of each mailing list is also available. Subscribe to digests as above but append -digest to the listname.

SEE ALSO
       libslack(3), daemon(3), coproc(3), pseudo(3), init(8), inetd(8), fork(2), umask(2), setsid(2), chdir(2), chroot(2), setrlimit(2),
       setgid(2), setuid(2), setgroups(2), initgroups(3), syslog(3), kill(2)

AUTHOR
       20100612 raf <raf@raf.org>

perl v5.10.1                                                        2010-06-13                                                         DAEMON.C(1)
