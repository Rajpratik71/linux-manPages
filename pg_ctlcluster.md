PG_CTLCLUSTER(1)                                         Debian PostgreSQL infrastructure                                         PG_CTLCLUSTER(1)

NAME
       pg_ctlcluster - start/stop/restart/reload a PostgreSQL cluster

SYNOPSIS
       pg_ctlcluster [options] cluster-version cluster-name action -- [pg_ctl options]

       where action = start|stop|restart|reload|status|promote

DESCRIPTION
       This program controls the postgres server for a particular cluster. It essentially wraps the pg_ctl(1) command. It determines the cluster
       version and data path and calls the right version of pg_ctl with appropriate configuration parameters and paths.

       You have to start this program as the user who owns the database cluster or as root.

       To ease integration with systemd operation, the alternative syntax "pg_ctlcluster version-cluster action" is also supported.

ACTIONS
       start
           A log file for this specific cluster is created if it does not exist yet (by default, /var/log/postgresql/postgresql-cluster-
           version-cluster-name.log), and a PostreSQL server process (postgres(1)) is started on it. Exits with 0 on success, with 2 if the server
           is already running, and with 1 on other failure conditions.

       stop
           Stops the postgres(1) server of the given cluster. By default, "smart" shutdown mode is used, which waits until all clients
           disconnected.

       restart
           Stops the server if it is running and starts it (again).

       reload
           Causes the configuration files to be re-read without a full shutdown of the server.

       status
           Checks whether a server is running. If it is, the PID and the command line options that were used to invoke it are displayed.

       promote
           Commands a running standby server to exit recovery and begin read-write operations.

OPTIONS
       -f|--force
           For stop and restart, the "fast" mode is used which rolls back all active transactions, disconnects clients immediately and thus shuts
           down cleanly. If that does not work, shutdown is attempted again in "immediate" mode, which can leave the cluster in an inconsistent
           state and thus will lead to a recovery run at the next start. If this still does not help, the postgres process is killed.  Exits with
           0 on success, with 2 if the server is not running, and with 1 on other failure conditions. This mode should only be used when the
           machine is about to be shut down.

       -m|--mode [smart|fast|immediate]
           Shutdown mode to use for stop and restart actions, default is smart.  See pg_ctl(1) for documentation.

       --foreground
           Start postgres in foreground, without daemonizing via pg_ctl.

       --stdlog
           When --foreground is in use, redirect stderr to the standard logfile in /var/log/postgresql/.  (Default when not run in foreground.)

       --bindir directory
           Path to pg_ctl.  (Default is /usr/lib/postgresql/version/bin.)

       -o|--options option
           Pass given option as command line option to the postgres process. It is possible to specify -o multiple times. See postgres(1) for a
           description of valid options.

       pg_ctl options
           Pass given pg_ctl options as command line options to pg_ctl. See pg_ctl(1) for a description of valid options.

FILES
       /etc/postgresql/cluster-version/cluster-name/pg_ctl.conf
           This configuration file contains cluster specific options to be passed to pg_ctl(1).

       /etc/postgresql/cluster-version/cluster-name/start.conf
           This configuration file controls the start/stop behavior of the cluster. See section "STARTUP CONTROL" in pg_createcluster(8) for
           details.

BUGS
       Changing the port number on startup using -o -p will not work as it breaks the checks for running clusters.

SEE ALSO
       pg_createcluster(8), pg_ctl(1), pg_wrapper(1), pg_lsclusters(1), postgres(1)

AUTHOR
       Martin Pitt <mpitt@debian.org>

Debian                                                              2016-08-09                                                    PG_CTLCLUSTER(1)
