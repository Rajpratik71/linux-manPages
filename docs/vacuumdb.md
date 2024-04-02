VACUUMDB(1)                                                PostgreSQL 11.4 Documentation                                               VACUUMDB(1)

NAME
       vacuumdb - garbage-collect and analyze a PostgreSQL database

SYNOPSIS
       vacuumdb [connection-option...] [option...] [ --table | -t table [( column [,...] )] ]...  [dbname]

       vacuumdb [connection-option...] [option...] --all | -a

DESCRIPTION
       vacuumdb is a utility for cleaning a PostgreSQL database.  vacuumdb will also generate internal statistics used by the PostgreSQL query
       optimizer.

       vacuumdb is a wrapper around the SQL command VACUUM(7). There is no effective difference between vacuuming and analyzing databases via this
       utility and via other methods for accessing the server.

OPTIONS
       vacuumdb accepts the following command-line arguments:

       -a
       --all
           Vacuum all databases.

       [-d] dbname
       [--dbname=]dbname
           Specifies the name of the database to be cleaned or analyzed. If this is not specified and -a (or --all) is not used, the database name
           is read from the environment variable PGDATABASE. If that is not set, the user name specified for the connection is used.

       -e
       --echo
           Echo the commands that vacuumdb generates and sends to the server.

       -f
       --full
           Perform “full” vacuuming.

       -F
       --freeze
           Aggressively “freeze” tuples.

       -j njobs
       --jobs=njobs
           Execute the vacuum or analyze commands in parallel by running njobs commands simultaneously. This option reduces the time of the
           processing but it also increases the load on the database server.

           vacuumdb will open njobs connections to the database, so make sure your max_connections setting is high enough to accommodate all
           connections.

           Note that using this mode together with the -f (FULL) option might cause deadlock failures if certain system catalogs are processed in
           parallel.

       -q
       --quiet
           Do not display progress messages.

       -t table [ (column [,...]) ]
       --table=table [ (column [,...]) ]
           Clean or analyze table only. Column names can be specified only in conjunction with the --analyze or --analyze-only options. Multiple
           tables can be vacuumed by writing multiple -t switches.

               Tip
               If you specify columns, you probably have to escape the parentheses from the shell. (See examples below.)

       -v
       --verbose
           Print detailed information during processing.

       -V
       --version
           Print the vacuumdb version and exit.

       -z
       --analyze
           Also calculate statistics for use by the optimizer.

       -Z
       --analyze-only
           Only calculate statistics for use by the optimizer (no vacuum).

       --analyze-in-stages
           Only calculate statistics for use by the optimizer (no vacuum), like --analyze-only. Run several (currently three) stages of analyze
           with different configuration settings, to produce usable statistics faster.

           This option is useful to analyze a database that was newly populated from a restored dump or by pg_upgrade. This option will try to
           create some statistics as fast as possible, to make the database usable, and then produce full statistics in the subsequent stages.

       -?
       --help
           Show help about vacuumdb command line arguments, and exit.

       vacuumdb also accepts the following command-line arguments for connection parameters:

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
           Force vacuumdb to prompt for a password before connecting to a database.

           This option is never essential, since vacuumdb will automatically prompt for a password if the server demands password authentication.
           However, vacuumdb will waste a connection attempt finding out that the server wants a password. In some cases it is worth typing -W to
           avoid the extra connection attempt.

       --maintenance-db=dbname
           Specifies the name of the database to connect to discover what other databases should be vacuumed. If not specified, the postgres
           database will be used, and if that does not exist, template1 will be used.

ENVIRONMENT
       PGDATABASE
       PGHOST
       PGPORT
       PGUSER
           Default connection parameters

       This utility, like most other PostgreSQL utilities, also uses the environment variables supported by libpq (see Section 34.14).

DIAGNOSTICS
       In case of difficulty, see VACUUM(7) and psql(1) for discussions of potential problems and error messages. The database server must be
       running at the targeted host. Also, any default connection settings and environment variables used by the libpq front-end library will
       apply.

NOTES
       vacuumdb might need to connect several times to the PostgreSQL server, asking for a password each time. It is convenient to have a
       ~/.pgpass file in such cases. See Section 34.15 for more information.

EXAMPLES
       To clean the database test:

           $ vacuumdb test

       To clean and analyze for the optimizer a database named bigdb:

           $ vacuumdb --analyze bigdb

       To clean a single table foo in a database named xyzzy, and analyze a single column bar of the table for the optimizer:

           $ vacuumdb --analyze --verbose --table='foo(bar)' xyzzy

SEE ALSO
       VACUUM(7)

PostgreSQL 11.4                                                        2019                                                            VACUUMDB(1)
