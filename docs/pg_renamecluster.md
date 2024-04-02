PG_RENAMECLUSTER(1)                                      Debian PostgreSQL infrastructure                                      PG_RENAMECLUSTER(1)

NAME
       pg_renamecluster - rename a PostgreSQL cluster

SYNOPSIS
       pg_renamecluster version oldname newname

DESCRIPTION
       pg_renamecluster changes the name of a PostgreSQL cluster, i. e. the name of the config directory in /etc/postgresql/version/ along with
       the data directory in /var/lib/postgresql/version/.  Existing log files in /var/log/postgresql/ are also renamed.  The cluster is stopped
       and started for the operation.

       The following postgresql.conf config options are updated to refer to the changed path names: data_directory, hba_file, ident_file,
       external_pid_file, stats_temp_directory.

       Cluster names are a Debian convention, the name is not explicitly known to the cluster itself.  From the PostgreSQL viewpoint, the name is
       merely a substring of various path names.

OPTIONS
       None.

SEE ALSO
       pg_createcluster(8), pg_dropcluster(8), pg_lsclusters(1), pg_wrapper(1)

AUTHOR
       Christoph Berg <myon@debian.org>

Debian                                                              2016-08-09                                                 PG_RENAMECLUSTER(1)
