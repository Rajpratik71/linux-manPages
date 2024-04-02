PG_LSCLUSTERS(1)                                         Debian PostgreSQL infrastructure                                         PG_LSCLUSTERS(1)

NAME
       pg_lsclusters - show information about all PostgreSQL clusters

SYNOPSIS
       pg_lsclusters [options]

DESCRIPTION
       This command shows a list about the configuration and status of all clusters.

OPTIONS
       -h, --no-header
           Do not print the column header line.

NOTES
       The cluster status is shown as online or down. If a recovery.conf file is found in the data directory, ,recovery is appended. The latter
       needs read access to the data directory, which only root and the cluster owner have.

       The output lines are colored green and red to indicate the cluster status visually.

AUTHOR
       Martin Pitt <mpitt@debian.org>

Debian                                                              2016-08-09                                                    PG_LSCLUSTERS(1)
