PG_CONTROLDATA(1)                                                                      PostgreSQL 9.2.24 Documentation                                                                      PG_CONTROLDATA(1)



NAME
       pg_controldata - display control information of a PostgreSQL database cluster

SYNOPSIS
       pg_controldata [option] [datadir]

DESCRIPTION
       pg_controldata prints information initialized during initdb, such as the catalog version. It also shows information about write-ahead logging and checkpoint processing. This information is
       cluster-wide, and not specific to any one database.

       This utility can only be run by the user who initialized the cluster because it requires read access to the data directory. You can specify the data directory on the command line, or use the
       environment variable PGDATA. This utility supports the options -V and --version, which print the pg_controldata version and exit. It also supports options -?  and --help, which output the supported
       arguments.

ENVIRONMENT
       PGDATA
           Default data directory location



PostgreSQL 9.2.24                                                                                 2017-11-06                                                                                PG_CONTROLDATA(1)
