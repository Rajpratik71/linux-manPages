PG_CTL(1)                                                                              PostgreSQL 9.2.24 Documentation                                                                              PG_CTL(1)



NAME
       pg_ctl - initialize, start, stop, or control a PostgreSQL server

SYNOPSIS
       pg_ctl init[db] [-s] [-D datadir] [-o initdb-options]

       pg_ctl start [-w] [-t seconds] [-s] [-D datadir] [-l filename] [-o options] [-p path] [-c]

       pg_ctl stop [-W] [-t seconds] [-s] [-D datadir] [-m s[mart] | f[ast] | i[mmediate]]

       pg_ctl restart [-w] [-t seconds] [-s] [-D datadir] [-c] [-m s[mart] | f[ast] | i[mmediate]] [-o options]

       pg_ctl reload [-s] [-D datadir]

       pg_ctl status [-D datadir]

       pg_ctl promote [-s] [-D datadir]

       pg_ctl kill signal_name process_id

       pg_ctl register [-N servicename] [-U username] [-P password] [-D datadir] [-S a[uto] | d[emand]] [-w] [-t seconds] [-s] [-o options]

       pg_ctl unregister [-N servicename]

DESCRIPTION
       pg_ctl is a utility for initializing a PostgreSQL database cluster, starting, stopping, or restarting the PostgreSQL database server (postgres(1)), or displaying the status of a running server.
       Although the server can be started manually, pg_ctl encapsulates tasks such as redirecting log output and properly detaching from the terminal and process group. It also provides convenient options
       for controlled shutdown.

       The init or initdb mode creates a new PostgreSQL database cluster. A database cluster is a collection of databases that are managed by a single server instance. This mode invokes the initdb command.
       See initdb(1) for details.

       In start mode, a new server is launched. The server is started in the background, and its standard input is attached to /dev/null (or nul on Windows). On Unix-like systems, by default, the server's
       standard output and standard error are sent to pg_ctl's standard output (not standard error). The standard output of pg_ctl should then be redirected to a file or piped to another process such as a
       log rotating program like rotatelogs; otherwise postgres will write its output to the controlling terminal (from the background) and will not leave the shell's process group. On Windows, by default
       the server's standard output and standard error are sent to the terminal. These default behaviors can be changed by using -l to append the server's output to a log file. Use of either -l or output
       redirection is recommended.

       In stop mode, the server that is running in the specified data directory is shut down. Three different shutdown methods can be selected with the -m option.  “Smart” mode (the default) waits for all
       active clients to disconnect and any online backup to finish. If the server is in hot standby, recovery and streaming replication will be terminated once all clients have disconnected.  “Fast” mode
       does not wait for clients to disconnect and will terminate an online backup in progress. All active transactions are rolled back and clients are forcibly disconnected, then the server is shut down.
       “Immediate” mode will abort all server processes immediately, without a clean shutdown. This will lead to a crash-recovery run on the next restart.

       restart mode effectively executes a stop followed by a start. This allows changing the postgres command-line options.

       reload mode simply sends the postgres process a SIGHUP signal, causing it to reread its configuration files (postgresql.conf, pg_hba.conf, etc.). This allows changing of configuration-file options
       that do not require a complete restart to take effect.

       status mode checks whether a server is running in the specified data directory. If it is, the PID and the command line options that were used to invoke it are displayed. If the server is not
       running, the process returns an exit status of 3.

       In promote mode, the standby server that is running in the specified data directory is commanded to exit recovery and begin read-write operations.

       kill mode allows you to send a signal to a specified process. This is particularly valuable for Microsoft Windows which does not have a kill command. Use --help to see a list of supported signal
       names.

       register mode allows you to register a system service on Microsoft Windows. The -S option allows selection of service start type, either “auto” (start service automatically on system startup) or
       “demand” (start service on demand).

       unregister mode allows you to unregister a system service on Microsoft Windows. This undoes the effects of the register command.

OPTIONS
       -c, --core-file
           Attempt to allow server crashes to produce core files, on platforms where this is possible, by lifting any soft resource limit placed on core files. This is useful in debugging or diagnosing
           problems by allowing a stack trace to be obtained from a failed server process.

       -D datadir, --pgdata datadir
           Specifies the file system location of the database files. If this is omitted, the environment variable PGDATA is used.

       -l filename, --log filename
           Append the server log output to filename. If the file does not exist, it is created. The umask is set to 077, so access to the log file is disallowed to other users by default.

       -m mode, --mode mode
           Specifies the shutdown mode.  mode can be smart, fast, or immediate, or the first letter of one of these three. If this is omitted, smart is used.

       -o options
           Specifies options to be passed directly to the postgres command.

           The options should usually be surrounded by single or double quotes to ensure that they are passed through as a group.

       -o initdb-options
           Specifies options to be passed directly to the initdb command.

           The options should usually be surrounded by single or double quotes to ensure that they are passed through as a group.

       -p path
           Specifies the location of the postgres executable. By default the postgres executable is taken from the same directory as pg_ctl, or failing that, the hard-wired installation directory. It is
           not necessary to use this option unless you are doing something unusual and get errors that the postgres executable was not found.

           In init mode, this option analogously specifies the location of the initdb executable.

       -s, --silent
           Print only errors, no informational messages.

       -t, --timeout
           The maximum number of seconds to wait when waiting for startup or shutdown to complete. Defaults to the value of the PGCTLTIMEOUT environment variable or, if not set, to 60 seconds.

       -V, --version
           Print the pg_ctl version and exit.

       -w
           Wait for the startup or shutdown to complete. Waiting is the default option for shutdowns, but not startups. When waiting for startup, pg_ctl repeatedly attempts to connect to the server. When
           waiting for shutdown, pg_ctl waits for the server to remove its PID file.  pg_ctl returns an exit code based on the success of the startup or shutdown.

       -W
           Do not wait for startup or shutdown to complete. This is the default for start and restart modes.

       -?, --help
           Show help about pg_ctl command line arguments, and exit.

   Options for Windows
       -N servicename
           Name of the system service to register. The name will be used as both the service name and the display name.

       -P password
           Password for the user to start the service.

       -S start-type
           Start type of the system service to register. start-type can be auto, or demand, or the first letter of one of these two. If this is omitted, auto is used.

       -U username
           User name for the user to start the service. For domain users, use the format DOMAIN\username.

ENVIRONMENT
       PGCTLTIMEOUT
           Default limit on the number of seconds to wait when waiting for startup or shutdown to complete. If not set, the default is 60 seconds.

       PGDATA
           Default data directory location.

       pg_ctl, like most other PostgreSQL utilities, also uses the environment variables supported by libpq (see Section 31.14, “Environment Variables”, in the documentation). For additional server
       variables, see postgres(1).

FILES
       postmaster.pid
           The existence of this file in the data directory is used to help pg_ctl determine if the server is currently running.

       postmaster.opts
           If this file exists in the data directory, pg_ctl (in restart mode) will pass the contents of the file as options to postgres, unless overridden by the -o option. The contents of this file are
           also displayed in status mode.

EXAMPLES
   Starting the Server
       To start the server:

           $ pg_ctl start

       To start the server, waiting until the server is accepting connections:

           $ pg_ctl -w start

       To start the server using port 5433, and running without fsync, use:

           $ pg_ctl -o "-F -p 5433" start

   Stopping the Server
       To stop the server, use:

           $ pg_ctl stop

       The -m option allows control over how the server shuts down:

           $ pg_ctl stop -m fast

   Restarting the Server
       Restarting the server is almost equivalent to stopping the server and starting it again, except that pg_ctl saves and reuses the command line options that were passed to the previously running
       instance. To restart the server in the simplest form, use:

           $ pg_ctl restart

       To restart the server, waiting for it to shut down and restart:

           $ pg_ctl -w restart

       To restart using port 5433, disabling fsync upon restart:

           $ pg_ctl -o "-F -p 5433" restart

   Showing the Server Status
       Here is sample status output from pg_ctl:

           $ pg_ctl status
           pg_ctl: server is running (PID: 13718)
           /usr/local/pgsql/bin/postgres "-D" "/usr/local/pgsql/data" "-p" "5433" "-B" "128"

       This is the command line that would be invoked in restart mode.

SEE ALSO
       initdb(1), postgres(1)



PostgreSQL 9.2.24                                                                                 2017-11-06                                                                                        PG_CTL(1)
