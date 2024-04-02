PG_CREATECLUSTER(1)                                      Debian PostgreSQL infrastructure                                      PG_CREATECLUSTER(1)

NAME
       pg_createcluster - create a new PostgreSQL cluster

SYNOPSIS
       pg_createcluster [options] version name [-- initdb options]

DESCRIPTION
       pg_createcluster creates a new PostgreSQL server cluster (i. e. a collection of databases served by a postmaster(1) instance) and
       integrates it into the multi-version/multi-cluster architecture of the postgresql-common package.

       Every cluster is uniquely identified by its version and name. The name can be arbitrary. The default cluster that is created on
       installation of a server package is main. However, you might wish to create other clusters for testing, with other superusers, a cluster
       for each user on a shared server, etc. pg_createcluster will abort with an error if you try to create a cluster with a name that already
       exists for that version.

       For compatibility with systemd service units, the cluster name should not contain any dashes (-). pg_ctlcluster will warn about the
       problem, but succeed with the operation.

       Given a major PostgreSQL version (like "8.2" or "8.3") and a cluster name, it creates the necessary configuration files in
       /etc/postgresql/version/name/; in particular these are postgresql.conf, pg_ident.conf, pg_hba.conf, a postgresql-common specific
       configuration file start.conf (see STARTUP CONTROL below), pg_ctl.conf, and a symbolic link log which points to the log file (by default,
       /var/log/postgresql/postgresql-version-name.log).

       postgresql.conf is automatically adapted to use the next available port, i.  e. the first port (starting from 5432) which is not yet used
       by an already existing cluster.

       If the data directory does not yet exist, PostgreSQL's initdb(1) command is used to generate a new cluster structure. If the data directory
       already exists, it is integrated into the postgresql-common structure by moving the configuration file and setting the data_directory
       option. Please note that this only works for data directories which were created directly with initdb, i.  e. all the configuration files
       (postgresql.conf etc.) must be present in the data directory.

       If a custom socket directory is given and it does not exist, it is created.

       If the log file does not exist, it is created. In any case the permissions are adjusted to allow write access to the cluster owner. Please
       note that postgresql.conf can be customized to specify log_directory and/or log_filename; if at least one of these options is present, then
       the symbolic link log in the cluster configuration directory is ignored.

       If the default snakeoil SSL certificate exists (/etc/ssl/certs/ssl-cert-snakeoil.pem and /etc/ssl/private/ssl-cert-snakeoil.key), and the
       postgres user is in the ssl-cert Unix group, pg_createcluster configures the cluster to use this certificate, and enables SSL. Therefore
       all clusters will use the same SSL certificate by default. For versions up to 9.1, symlinks in the data directory will be created
       (server.crt and server.key); for 9.2 and later, the appropriate postgresql.conf options will be set (ssl_cert_file and ssl_key_file). Of
       course you can replace this with a cluster specific certificate. Similarly for /etc/postgresql-common/root.crt and
       /etc/postgresql-common/root.crl, these files will be configured as client certificate CA and revocation list, when present. (root.crt is
       initially a placeholder that will only be used if real certificates are added to the file.)

OPTIONS
       -u user, --user=user
           Set the user who owns the cluster and becomes the database superuser to the given name or uid.  By default, this is the user postgres.
           A cluster must not be owned by root.

       -g group, --group=group
           Change the group of the cluster related data files. By default this will be the primary group of the database owner.

       -d dir, --datadir=dir
           Explicitly set the data directory path, which is used to store all the actual databases and tables. This will become quite big (easily
           in the order of five times the amount of actual data stored in the cluster). Defaults to /var/lib/postgresql/version/cluster.

       -s dir, --socketdir=dir
           Explicitly set the directory where the postmaster(1) server stores the Unix socket for local connections. Defaults to
           /var/run/postgresql/ for clusters owned by the user postgres, and /tmp for clusters owned by other users.  Please be aware that /tmp is
           an unsafe directory since everybody can create a socket there and impersonate the database server. If the given directory does not
           exist, it is created with appropriate permissions.

       -l path, --logfile=path
           Explicitly set the path for the postmaster(1) server log file. Defaults to /var/log/postgresql/postgresql-version-cluster.log.

       --locale=locale
           Set the default locale for the database cluster. If this option is not specified, the locale is inherited from the environment that
           pg_createcluster runs in.

       --lc-collate=locale
       --lc-ctype=locale
       --lc-messages=locale
       --lc-monetary=locale
       --lc-numeric=locale
       --lc-time=locale
           Like --locale, but only sets the locale in the specified category.

       -e encoding, --encoding=encoding
           Select the encoding of the template database. This will also be the default encoding of any database you create later, unless you
           override it there. The default is derived from the locale, or SQL_ASCII if that does not work.  The character sets supported by the
           PostgreSQL server are described in the documentation.

           Note: It is not recommended to set this option directly! Set the locale instead.

       -p port, --port=port
           Select the port the new cluster listens on (for the Unix socket and the TCP port); this must be a number between 1024 and 65535, since
           PostgreSQL does not run as root and thus needs an unprivileged port number. By default the next free port starting from 5432 is
           assigned.

       --start
           Immediately start a server for the cluster after creating it (i. e. call pg_ctlcluster version cluster start on it). By default, the
           cluster is not started.

       --start-conf=auto|manual|disabled
           Set the initial value in the start.conf configuration file. See STARTUP CONTROL below. By default, auto is used, which means that the
           cluster is handled by /etc/init.d/postgresql, i. e. starts and stops automatically on system boot.

       -o guc=value, --pgoption guc=value
           Configuration option to set in the new postgresql.conf file.

       --createclusterconf=file
           Alternative createcluster.conf file to use. Default is /etc/postgresql-common/createcluster.conf (or $PGSYSCONFDIR/createcluster.conf).

       --environment=file
           Alternative default environment file to use. Default is /etc/postgresql-common/environment (or $PGSYSCONFDIR/environment).  If the file
           is missing, a placeholder string is used.  %v and %c are replaced; see DEFAULT VALUES below.

       -- initdb options
           Options passed directly to initdb(1).

           Per default, pg_createcluster will update the pg_hba.conf file generated by initdb to use peer authentication on local (unix)
           connections, and md5 on TCP (host) connections. If explicit authentication config is included here (-A, --auth, --auth-host,
           --auth-local), the pg_hba.conf file will be left untouched.

STARTUP CONTROL
       The start.conf file in the cluster configuration directory controls the start/stop behavior of that cluster's postmaster process. The file
       can contain comment lines (started with '#'), empty lines, and must have exactly one line with one of the following keywords:

       auto
           The postmaster process is started/stopped automatically in the init script.  This is also the default if the file is missing.

       manual
           The postmaster process is not handled by the init script, but manually controlling the cluster with pg_ctlcluster(1) is permitted.

       disabled
           Neither the init script nor pg_ctlcluster(1) are permitted to start/stop the cluster. Please be aware that this will not stop the
           cluster owner from calling lower level tools to control the postmaster process; this option is only meant to prevent accidents during
           maintenance, not more.

       The pg_ctl.conf file in the cluster configuration directory can contain additional options passed to pg_ctl of that cluster.

DEFAULT VALUES
       Some default values used by pg_createcluster can be modified in /etc/postgresql-common/createcluster.conf. Occurrences of %v are replaced
       by the major version number, and %c by the cluster name. Use %% for a literal %.

       create_main_cluster (Default: true)
           Create a main cluster when a new postgresql-x.y server package is installed.

       start_conf (Default: auto)
           Default start.conf value to use.

       data_directory (Default: /var/lib/postgresql/%v/%c)
           Default data directory.

       xlogdir (Default: unset)
           Default directory for transaction logs. When used, initdb will create a symlink from pg_xlog in the data directory to this location.
           Unset by default, i.e. pg_xlog is remains in the data directory.

       initdb_options (Default: unset)
           Other options to pass to initdb.

       Other options
           All other options listed are copied into the new cluster's postgresql.conf, e.g.:

               listen_addresses = '*'
               log_line_prefix = '%%t '

           Some postgresql.conf options are treated specially:

           ssl Only added to postgresql.conf if the default snakeoil certificates exist and are readable for the cluster owner as detailed above.

           stats_temp_directory
               Only added to postgresql.conf if existing, and writable for the cluster owner, or else if the parent directory is writable.

SEE ALSO
       initdb(1), pg_ctlcluster(8), pg_lsclusters(1), pg_wrapper(1)

AUTHORS
       Martin Pitt <mpitt@debian.org>, Christoph Berg <myon@debian.org>

Debian                                                              2016-08-09                                                 PG_CREATECLUSTER(1)
