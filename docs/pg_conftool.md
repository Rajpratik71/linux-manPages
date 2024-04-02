PG_CONFTOOL(1)                                           Debian PostgreSQL infrastructure                                           PG_CONFTOOL(1)

NAME
       pg_conftool - read and edit PostgreSQL cluster configuration files

SYNOPSIS
       pg_conftool [options] [version cluster] [configfile] command

DESCRIPTION
       pg_conftool allows to show and set parameters in PostgreSQL configuration files.

       If version cluster is omitted, it defaults to the default cluster (see user_clusters(5) and postgresqlrc(5)). If configfile is omitted, it
       defaults to postgresql.conf. configfile can also be a path, in which case version cluster is ignored.

OPTIONS
       -s, --short
           Show only the value (instead of key = value pair).

       -v, --verbose
           Verbose output.

       --help
           Print help.

COMMANDS
       show parameter|all
           Show a parameter, or all present in this config file.

       set parameter value
           Set or update a parameter.

       remove parameter
           Remove (comment out) a parameter from a config file.

       edit
           Open the config file in an editor.  Unless $EDITOR is set, vi is used.

SEE ALSO
       user_clusters(5), postgresqlrc(5)

AUTHOR
       Christoph Berg <myon@debian.org>

Debian                                                              2016-08-09                                                      PG_CONFTOOL(1)
