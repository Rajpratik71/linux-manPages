GALERA_NEW_CLUSTER(1)                  MariaDB Database System                  GALERA_NEW_CLUSTER(1)

NAME
       galera_new_cluster - starting a new Galera cluster

DESCRIPTION
       Used to bootstrap a new Galera Cluster when all nodes are down.  Run galera_new_cluster on the
       first node only.  On the remaining nodes simply run 'service @DAEMON_NAME@ start'.

       ·   --help, -h

           Display a help message and exit.

SEE ALSO
       For more information on configuration and usage see https://mariadb.com/kb/en/mariadb/getting-
       started-with-mariadb-galera-cluster/

MariaDB 10.5                                 27 June 2019                       GALERA_NEW_CLUSTER(1)
