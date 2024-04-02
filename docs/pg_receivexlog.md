PG_RECEIVEXLOG(1)                                                                      PostgreSQL 9.2.24 Documentation                                                                      PG_RECEIVEXLOG(1)



NAME
       pg_receivexlog - streams transaction logs from a PostgreSQL cluster

SYNOPSIS
       pg_receivexlog [option...]

DESCRIPTION
       pg_receivexlog is used to stream transaction log from a running PostgreSQL cluster. The transaction log is streamed using the streaming replication protocol, and is written to a local directory of
       files. This directory can be used as the archive location for doing a restore using point-in-time recovery (see Section 24.3, “Continuous Archiving and Point-in-Time Recovery (PITR)”, in the
       documentation).

       pg_receivexlog streams the transaction log in real time as it's being generated on the server, and does not wait for segments to complete like archive_command does. For this reason, it is not
       necessary to set archive_timeout when using pg_receivexlog.

       The transaction log is streamed over a regular PostgreSQL connection, and uses the replication protocol. The connection must be made with a superuser or a user having REPLICATION permissions (see
       Section 20.2, “Role Attributes”, in the documentation), and pg_hba.conf must explicitly permit the replication connection. The server must also be configured with max_wal_senders set high enough to
       leave at least one session available for the stream.

       If the connection is lost, or if it cannot be initially established, with a non-fatal error, pg_receivexlog will retry the connection indefinitely, and reestablish streaming as soon as possible. To
       avoid this behavior, use the -n parameter.

OPTIONS
       The following command-line options control the location and format of the output.

       -D directory, --directory=directory
           Directory to write the output to.

           This parameter is required.

       The following command-line options control the running of the program.

       -n, --no-loop
           Don't loop on connection errors. Instead, exit right away with an error.

       -v, --verbose
           Enables verbose mode.

       The following command-line options control the database connection parameters.

       -h host, --host=host
           Specifies the host name of the machine on which the server is running. If the value begins with a slash, it is used as the directory for the Unix domain socket. The default is taken from the
           PGHOST environment variable, if set, else a Unix domain socket connection is attempted.

       -p port, --port=port
           Specifies the TCP port or local Unix domain socket file extension on which the server is listening for connections. Defaults to the PGPORT environment variable, if set, or a compiled-in default.

       -s interval, --status-interval=interval
           Specifies the number of seconds between status packets sent back to the server. This is required if replication timeout is configured on the server, and allows for easier monitoring. A value of
           zero disables the status updates completely. The default value is 10 seconds.

       -U username, --username=username
           User name to connect as.

       -w, --no-password
           Never issue a password prompt. If the server requires password authentication and a password is not available by other means such as a .pgpass file, the connection attempt will fail. This option
           can be useful in batch jobs and scripts where no user is present to enter a password.

       -W, --password
           Force pg_receivexlog to prompt for a password before connecting to a database.

           This option is never essential, since pg_receivexlog will automatically prompt for a password if the server demands password authentication. However, pg_receivexlog will waste a connection
           attempt finding out that the server wants a password. In some cases it is worth typing -W to avoid the extra connection attempt.

       Other options are also available:

       -V, --version
           Print the pg_receivexlog version and exit.

       -?, --help
           Show help about pg_receivexlog command line arguments, and exit.

ENVIRONMENT
       This utility, like most other PostgreSQL utilities, uses the environment variables supported by libpq (see Section 31.14, “Environment Variables”, in the documentation).

NOTES
       When using pg_receivexlog instead of archive_command, the server will continue to recycle transaction log files even if the backups are not properly archived, since there is no command that fails.
       This can be worked around by having an archive_command that fails when the file has not been properly archived yet, for example:

           archive_command = 'sleep 5 && test -f /mnt/server/archivedir/%f'

       The initial timeout is necessary because pg_receivexlog works using asynchronous replication and can therefore be slightly behind the master.

EXAMPLES
       To stream the transaction log from the server at mydbserver and store it in the local directory /usr/local/pgsql/archive:

           $ pg_receivexlog -h mydbserver -D /usr/local/pgsql/archive

SEE ALSO
       pg_basebackup(1)



PostgreSQL 9.2.24                                                                                 2017-11-06                                                                                PG_RECEIVEXLOG(1)
