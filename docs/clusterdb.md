CLUSTERDB(1)                                               PostgreSQL 11.4 Documentation                                              CLUSTERDB(1)

NAME
       clusterdb - cluster a PostgreSQL database

SYNOPSIS
       clusterdb [connection-option...] [--verbose | -v] [ --table | -t table ]...  [dbname]

       clusterdb [connection-option...] [--verbose | -v] --all | -a

DESCRIPTION
       clusterdb is a utility for reclustering tables in a PostgreSQL database. It finds tables that have previously been clustered, and clusters
       them again on the same index that was last used. Tables that have never been clustered are not affected.

       clusterdb is a wrapper around the SQL command CLUSTER(7). There is no effective difference between clustering databases via this utility
       and via other methods for accessing the server.

OPTIONS
       clusterdb accepts the following command-line arguments:

       -a
       --all
           Cluster all databases.

       [-d] dbname
       [--dbname=]dbname
           Specifies the name of the database to be clustered. If this is not specified and -a (or --all) is not used, the database name is read
           from the environment variable PGDATABASE. If that is not set, the user name specified for the connection is used.

       -e
       --echo
           Echo the commands that clusterdb generates and sends to the server.

       -q
       --quiet
           Do not display progress messages.

       -t table
       --table=table
           Cluster table only. Multiple tables can be clustered by writing multiple -t switches.

       -v
       --verbose
           Print detailed information during processing.

       -V
       --version
           Print the clusterdb version and exit.

       -?
       --help
           Show help about clusterdb command line arguments, and exit.

       clusterdb also accepts the following command-line arguments for connection parameters:

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
           Force clusterdb to prompt for a password before connecting to a database.

           This option is never essential, since clusterdb will automatically prompt for a password if the server demands password authentication.
           However, clusterdb will waste a connection attempt finding out that the server wants a password. In some cases it is worth typing -W to
           avoid the extra connection attempt.

       --maintenance-db=dbname
           Specifies the name of the database to connect to discover what other databases should be clustered. If not specified, the postgres
           database will be used, and if that does not exist, template1 will be used.

ENVIRONMENT
       PGDATABASE
       PGHOST
       PGPORT
       PGUSER
           Default connection parameters

       This utility, like most other PostgreSQL utilities, also uses the environment variables supported by libpq (see Section 34.14).

DIAGNOSTICS
       In case of difficulty, see CLUSTER(7) and psql(1) for discussions of potential problems and error messages. The database server must be
       running at the targeted host. Also, any default connection settings and environment variables used by the libpq front-end library will
       apply.

EXAMPLES
       To cluster the database test:

           $ clusterdb test

       To cluster a single table foo in a database named xyzzy:

           $ clusterdb --table=foo xyzzy

SEE ALSO
       CLUSTER(7)

PostgreSQL 11.4                                                        2019                                                           CLUSTERDB(1)
