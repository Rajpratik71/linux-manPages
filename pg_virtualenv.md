PG_VIRTUALENV(1)                                         Debian PostgreSQL infrastructure                                         PG_VIRTUALENV(1)

NAME
       pg_virtualenv - Create a throw-away PostgreSQL environment for running regression tests

SYNOPSIS
       pg_virtualenv [OPTIONS] [-v 'version ...'] [command]

DESCRIPTION
       pg_virtualenv creates a virtual PostgreSQL server environment, and sets environment variables such that command can access the PostgreSQL
       database server(s). The servers are destroyed when command exits.

       The environment variables PGHOST, PGDATABASE, PGUSER, and PGPASSWORD will be set. Per default, a single new cluster is created, using the
       newest PostgreSQL server version installed. The cluster will use the first available port number starting from 5432, and PGPORT will be
       set.

       When clusters for more than one versions are created, they will differ in the port number used, and PGPORT is not set. The clusters are
       named version/regress. To access a cluster, set PGCLUSTER=version/regress. For ease of access, the clusters are also registered in
       /etc/postgresql-common/pg_service.conf, with the version number as cluster name. Clusters can be accessed by passing the connection string
       "service=version", e.g. psql service=9.2.

       When invoked as root, the clusters are created in /etc/postgresql/ as usual; for other users, PG_CLUSTER_CONF_ROOT and PGSYSCONFDIR are set
       to a temporary directory where all files belonging to the clusters are created.

OPTIONS
       -a  Use all PostgreSQL server versions installed.

       -v version ...
           Use these versions (space-separated list).

       -c pg_createcluster options
           Extra options to pass to pg_createcluster.

       -i initdb options
           Extra initdb options to pass to pg_createcluster.

       -o guc=value
           Configuration option to set in the postgresql.conf file, passed to pg_createcluster.

       -s  Launch a shell inside the virtual environment when command fails.

       -t  Install clusters in a temporary directory, even when running as root.

       -h  Show program help.

EXAMPLE
         # pg_virtualenv make check

NOTES
       When run with fakeroot(1), pg_virtualenv will fall back to the non-root mode of operation. Running "fakeroot pg_virtualenv" as root will
       fail, though.

ENVIRONMENT
       PG_VIRTUALENV_NEWPID=yes
           When non-empty, pg_virtualenv will re-exec itself using newpid(1).

       PG_VIRTUALENV_UNSHARE=flags
           When non-empty, pg_virtualenv will re-exec itself using unshare(1) using these flags.

       PGPORT=n
           When set, the value is used for the (single) cluster created.

SEE ALSO
       initdb(1), pg_createcluster(1).

AUTHOR
       Christoph Berg <myon@debian.org>

Debian                                                              2016-08-09                                                    PG_VIRTUALENV(1)
