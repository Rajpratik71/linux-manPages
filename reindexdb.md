REINDEXDB(1)                                               PostgreSQL 11.4 Documentation                                              REINDEXDB(1)

NAME
       reindexdb - reindex a PostgreSQL database

SYNOPSIS
       reindexdb [connection-option...] [option...] [ --schema | -S schema ]...  [ --table | -t table ]...  [ --index | -i index ]...  [dbname]

       reindexdb [connection-option...] [option...] --all | -a

       reindexdb [connection-option...] [option...] --system | -s  [dbname]

DESCRIPTION
       reindexdb is a utility for rebuilding indexes in a PostgreSQL database.

       reindexdb is a wrapper around the SQL command REINDEX(7). There is no effective difference between reindexing databases via this utility
       and via other methods for accessing the server.

OPTIONS
       reindexdb accepts the following command-line arguments:

       -a
       --all
           Reindex all databases.

       [-d] dbname
       [--dbname=]dbname
           Specifies the name of the database to be reindexed. If this is not specified and -a (or --all) is not used, the database name is read
           from the environment variable PGDATABASE. If that is not set, the user name specified for the connection is used.

       -e
       --echo
           Echo the commands that reindexdb generates and sends to the server.

       -i index
       --index=index
           Recreate index only. Multiple indexes can be recreated by writing multiple -i switches.

       -q
       --quiet
           Do not display progress messages.

       -s
       --system
           Reindex database's system catalogs.

       -S schema
       --schema=schema
           Reindex schema only. Multiple schemas can be reindexed by writing multiple -S switches.

       -t table
       --table=table
           Reindex table only. Multiple tables can be reindexed by writing multiple -t switches.

       -v
       --verbose
           Print detailed information during processing.

       -V
       --version
           Print the reindexdb version and exit.

       -?
       --help
           Show help about reindexdb command line arguments, and exit.

       reindexdb also accepts the following command-line arguments for connection parameters:

       -h host
       --host=host
           Specifies the host name of the machine on which the server is running. If the value begins with a slash, it is used as the directory
           for the Unix domain socket.

       -p port
       --port=port
           Specifies the TCP port or local Unix domain socket file extension on which the server is listening for connections.

       -U username
       --username=username
           User name to connect as.

       -w
       --no-password
           Never issue a password prompt. If the server requires password authentication and a password is not available by other means such as a
           .pgpass file, the connection attempt will fail. This option can be useful in batch jobs and scripts where no user is present to enter a
           password.

       -W
       --password
           Force reindexdb to prompt for a password before connecting to a database.

           This option is never essential, since reindexdb will automatically prompt for a password if the server demands password authentication.
           However, reindexdb will waste a connection attempt finding out that the server wants a password. In some cases it is worth typing -W to
           avoid the extra connection attempt.

       --maintenance-db=dbname
           Specifies the name of the database to connect to discover what other databases should be reindexed. If not specified, the postgres
           database will be used, and if that does not exist, template1 will be used.

ENVIRONMENT
       PGDATABASE
       PGHOST
       PGPORT
       PGUSER
           Default connection parameters

       This utility, like most other PostgreSQL utilities, also uses the environment variables supported by libpq (see Section 34.14).

DIAGNOSTICS
       In case of difficulty, see REINDEX(7) and psql(1) for discussions of potential problems and error messages. The database server must be
       running at the targeted host. Also, any default connection settings and environment variables used by the libpq front-end library will
       apply.

NOTES
       reindexdb might need to connect several times to the PostgreSQL server, asking for a password each time. It is convenient to have a
       ~/.pgpass file in such cases. See Section 34.15 for more information.

EXAMPLES
       To reindex the database test:

           $ reindexdb test

       To reindex the table foo and the index bar in a database named abcd:

           $ reindexdb --table=foo --index=bar abcd

SEE ALSO
       REINDEX(7)

PostgreSQL 11.4                                                        2019                                                           REINDEXDB(1)
