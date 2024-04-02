PG_DROPCLUSTER(1)                                        Debian PostgreSQL infrastructure                                        PG_DROPCLUSTER(1)

NAME
       pg_dropcluster - completely delete a PostgreSQL cluster

SYNOPSIS
       pg_dropcluster [--stop] cluster-version cluster-name

DESCRIPTION
       This program removes all files that belong to a given PostgreSQL cluster; that includes the data directory, the log file, and all
       configuration files that were created by pg_createcluster(1). If the configuration directory (/etc/postgresql/version/cluster) is empty
       after this, it is removed as well.  An empty socket directory other than /var/run/postgresql or /tmp is also removed.

       Usually a cluster which still has a running server attached will not be deleted. To override this, the --stop option forces a server
       shutdown before the files are removed.

SEE ALSO
       pg_createcluster(1), pg_ctlcluster(1)

AUTHOR
       Martin Pitt <mpitt@debian.org>

Debian                                                              2016-08-09                                                   PG_DROPCLUSTER(1)
