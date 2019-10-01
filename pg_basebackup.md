PG_BASEBACKUP(1)                                                                       PostgreSQL 9.2.24 Documentation                                                                       PG_BASEBACKUP(1)



NAME
       pg_basebackup - take a base backup of a PostgreSQL cluster

SYNOPSIS
       pg_basebackup [option...]

DESCRIPTION
       pg_basebackup is used to take base backups of a running PostgreSQL database cluster. These are taken without affecting other clients to the database, and can be used both for point-in-time recovery
       (see Section 24.3, “Continuous Archiving and Point-in-Time Recovery (PITR)”, in the documentation) and as the starting point for a log shipping or streaming replication standby servers (see Section
       25.2, “Log-Shipping Standby Servers”, in the documentation).

       pg_basebackup makes a binary copy of the database cluster files, while making sure the system is put in and out of backup mode automatically. Backups are always taken of the entire database cluster;
       it is not possible to back up individual databases or database objects. For individual database backups, a tool such as pg_dump(1) must be used.

       The backup is made over a regular PostgreSQL connection, and uses the replication protocol. The connection must be made with a superuser or a user having REPLICATION permissions (see Section 20.2,
       “Role Attributes”, in the documentation), and pg_hba.conf must explicitly permit the replication connection. The server must also be configured with max_wal_senders set high enough to leave at least
       one session available for the backup.

       There can be multiple pg_basebackups running at the same time, but it is better from a performance point of view to take only one backup, and copy the result.

       pg_basebackup can make a base backup from not only the master but also the standby. To take a backup from the standby, set up the standby so that it can accept replication connections (that is, set
       max_wal_senders and hot_standby, and configure host-based authentication). You will also need to enable full_page_writes on the master.

       Note that there are some limitations in an online backup from the standby:

       ·   The backup history file is not created in the database cluster backed up.

       ·   There is no guarantee that all WAL files required for the backup are archived at the end of backup. If you are planning to use the backup for an archive recovery and want to ensure that all
           required files are available at that moment, you need to include them into the backup by using the -x option.

       ·   If the standby is promoted to the master during online backup, the backup fails.

       ·   All WAL records required for the backup must contain sufficient full-page writes, which requires you to enable full_page_writes on the master and not to use a tool like pg_compresslog as
           archive_command to remove full-page writes from WAL files.


OPTIONS
       The following command-line options control the location and format of the output.

       -D directory, --pgdata=directory
           Directory to write the output to.  pg_basebackup will create the directory and any parent directories if necessary. The directory may already exist, but it is an error if the directory already
           exists and is not empty.

           When the backup is in tar mode, and the directory is specified as - (dash), the tar file will be written to stdout.

           This option is required.

       -F format, --format=format
           Selects the format for the output.  format can be one of the following:

           p, plain
               Write the output as plain files, with the same layout as the current data directory and tablespaces. When the cluster has no additional tablespaces, the whole database will be placed in the
               target directory. If the cluster contains additional tablespaces, the main data directory will be placed in the target directory, but all other tablespaces will be placed in the same
               absolute path as they have on the server.

               This is the default format.

           t, tar
               Write the output as tar files in the target directory. The main data directory will be written to a file named base.tar, and all other tablespaces will be named after the tablespace OID.

               If the value - (dash) is specified as target directory, the tar contents will be written to standard output, suitable for piping to for example gzip. This is only possible if the cluster has
               no additional tablespaces.

       -x, --xlog
           Using this option is equivalent of using -X with method fetch.

       -X method, --xlog-method=method
           Includes the required transaction log files (WAL files) in the backup. This will include all transaction logs generated during the backup. If this option is specified, it is possible to start a
           postmaster directly in the extracted directory without the need to consult the log archive, thus making this a completely standalone backup.

           The following methods for collecting the transaction logs are supported:

           f, fetch
               The transaction log files are collected at the end of the backup. Therefore, it is necessary for the wal_keep_segments parameter to be set high enough that the log is not removed before the
               end of the backup. If the log has been rotated when it's time to transfer it, the backup will fail and be unusable.

           s, stream
               Stream the transaction log while the backup is created. This will open a second connection to the server and start streaming the transaction log in parallel while running the backup.
               Therefore, it will use up two slots configured by the max_wal_senders parameter. As long as the client can keep up with transaction log received, using this mode requires no extra
               transaction logs to be saved on the master.


       -z, --gzip
           Enables gzip compression of tar file output, with the default compression level. Compression is only available when using the tar format.

       -Z level, --compress=level
           Enables gzip compression of tar file output, and specifies the compression level (0 through 9, 0 being no compression and 9 being best compression). Compression is only available when using the
           tar format.

       The following command-line options control the generation of the backup and the running of the program.

       -c fast|spread, --checkpoint=fast|spread
           Sets checkpoint mode to fast or spread (default).

       -l label, --label=label
           Sets the label for the backup. If none is specified, a default value of “pg_basebackup base backup” will be used.

       -P, --progress
           Enables progress reporting. Turning this on will deliver an approximate progress report during the backup. Since the database may change during the backup, this is only an approximation and may
           not end at exactly 100%. In particular, when WAL log is included in the backup, the total amount of data cannot be estimated in advance, and in this case the estimated target size will increase
           once it passes the total estimate without WAL.

           When this is enabled, the backup will start by enumerating the size of the entire database, and then go back and send the actual contents. This may make the backup take slightly longer, and in
           particular it will take longer before the first data is sent.

       -v, --verbose
           Enables verbose mode. Will output some extra steps during startup and shutdown, as well as show the exact file name that is currently being processed if progress reporting is also enabled.

       The following command-line options control the database connection parameters.

       -h host, --host=host
           Specifies the host name of the machine on which the server is running. If the value begins with a slash, it is used as the directory for the Unix domain socket. The default is taken from the
           PGHOST environment variable, if set, else a Unix domain socket connection is attempted.

       -p port, --port=port
           Specifies the TCP port or local Unix domain socket file extension on which the server is listening for connections. Defaults to the PGPORT environment variable, if set, or a compiled-in default.

       -s interval, --status-interval=interval
           Specifies the number of seconds between status packets sent back to the server. This is required when streaming the transaction log (using --xlog=stream) if replication timeout is configured on
           the server, and allows for easier monitoring. A value of zero disables the status updates completely. The default value is 10 seconds.

       -U username, --username=username
           User name to connect as.

       -w, --no-password
           Never issue a password prompt. If the server requires password authentication and a password is not available by other means such as a .pgpass file, the connection attempt will fail. This option
           can be useful in batch jobs and scripts where no user is present to enter a password.

       -W, --password
           Force pg_basebackup to prompt for a password before connecting to a database.

           This option is never essential, since pg_basebackup will automatically prompt for a password if the server demands password authentication. However, pg_basebackup will waste a connection attempt
           finding out that the server wants a password. In some cases it is worth typing -W to avoid the extra connection attempt.

       Other options are also available:

       -V, --version
           Print the pg_basebackup version and exit.

       -?, --help
           Show help about pg_basebackup command line arguments, and exit.

ENVIRONMENT
       This utility, like most other PostgreSQL utilities, uses the environment variables supported by libpq (see Section 31.14, “Environment Variables”, in the documentation).

NOTES
       The backup will include all files in the data directory and tablespaces, including the configuration files and any additional files placed in the directory by third parties. Only regular files and
       directories are allowed in the data directory, no symbolic links or special device files.

       The way PostgreSQL manages tablespaces, the path for all additional tablespaces must be identical whenever a backup is restored. The main data directory, however, is relocatable to any location.

EXAMPLES
       To create a base backup of the server at mydbserver and store it in the local directory /usr/local/pgsql/data:

           $ pg_basebackup -h mydbserver -D /usr/local/pgsql/data

       To create a backup of the local server with one compressed tar file for each tablespace, and store it in the directory backup, showing a progress report while running:

           $ pg_basebackup -D backup -Ft -z -P

       To create a backup of a single-tablespace local database and compress this with bzip2:

           $ pg_basebackup -D - -Ft | bzip2 > backup.tar.bz2

       (This command will fail if there are multiple tablespaces in the database.)

SEE ALSO
       pg_dump(1)



PostgreSQL 9.2.24                                                                                 2017-11-06                                                                                 PG_BASEBACKUP(1)
