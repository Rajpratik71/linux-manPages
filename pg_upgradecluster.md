PG_UPGRADECLUSTER(1)                                     Debian PostgreSQL infrastructure                                     PG_UPGRADECLUSTER(1)

NAME
       pg_upgradecluster - upgrade an existing PostgreSQL cluster to a new major version.

SYNOPSIS
       pg_upgradecluster [-v newversion] oldversion name [newdatadir]

DESCRIPTION
       pg_upgradecluster upgrades an existing PostgreSQL server cluster (i. e. a collection of databases served by a postmaster instance) to a new
       version specified by newversion (default: latest available version).  The configuration files of the old version are copied to the new
       cluster.

       The cluster of the old version will be configured to use a previously unused port since the upgraded one will use the original port. The
       old cluster is not automatically removed. After upgrading, please verify that the new cluster indeed works as expected; if so, you should
       remove the old cluster with pg_dropcluster(8). Please note that the old cluster is set to "manual" startup mode, in order to avoid
       inadvertently changing it; this means that it will not be started automatically on system boot, and you have to use pg_ctlcluster(8) to
       start/stop it. See section "STARTUP CONTROL" in pg_createcluster(8) for details.

       The newdatadir argument can be used to specify a non-default data directory of the upgraded cluster. It is passed to pg_createcluster. If
       not specified, this defaults to /var/lib/postgresql/newversion/name.

OPTIONS
       -v newversion
           Set the version to upgrade to (default: latest available).

       --logfile filel
           Set a custom log file path for the upgraded database cluster.

       --locale=locale
           Set the default locale for the upgraded database cluster. If this option is not specified, the locale is inherited from the old
           cluster.

       --lc-collate=locale
       --lc-ctype=locale
       --lc-messages=locale
       --lc-monetary=locale
       --lc-numeric=locale
       --lc-time=locale
           Like --locale, but only sets the locale in the specified category.

       -m, --method=dump|upgrade
           Specify the upgrade method.  "dump" uses pg_dump(1) and pg_restore(1), "upgrade" uses pg_upgrade(1).  The default is "dump".

       -k, --link
           In pg_upgrade mode, use hard links instead of copying files to the new cluster.  This option is merely passed on to pg_upgrade.  See
           pg_upgrade(1) for details.

       --rename new cluster name
           Use a different name for the upgraded cluster.

       --old-bindir directory
           Passed to pg_upgrade.

HOOK SCRIPTS
       Some PostgreSQL extensions like PostGIS need metadata in auxiliary tables which must not be upgraded from the old version, but rather
       initialized for the new version before copying the table data. For this purpose, extensions (as well as administrators, of course) can drop
       upgrade hook scripts into /etc/postgresql-common/pg_upgradecluster.d/. Script file names must consist entirely of upper and lower case
       letters, digits, underscores, and hyphens; in particular, dots (i. e. file extensions) are not allowed.

       Scripts in that directory will be called with the following arguments:

       <old version> <cluster name> <new version> <phase>

       Phases:

       init
           A virgin cluster of version new version has been created, i. e.  this new cluster will already have template1, but no user databases.
           Please note that you should not create tables in this phase, since they will be overwritten by the dump/restore or pg_upgrade
           operation.

       finish
           All data from the old version cluster has been dumped/reloaded into the new one. The old cluster still exists, but is not running.

       Failing scripts will abort the upgrade.  The scripts are called as the user who owns the database.

       When --mode=dump and upgrade hook scripts are used, pg_restore is invoked with --no-data-for-failed-tables.

SEE ALSO
       pg_createcluster(8), pg_dropcluster(8), pg_lsclusters(1), pg_wrapper(1)

AUTHOR
       Martin Pitt <mpitt@debian.org>

Debian                                                              2016-08-09                                                PG_UPGRADECLUSTER(1)
