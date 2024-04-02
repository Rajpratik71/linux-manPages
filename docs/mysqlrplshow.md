MYSQLRPLSHOW(1)                                                   MySQL Utilities                                                  MYSQLRPLSHOW(1)

NAME
       mysqlrplshow - Show Slaves for Master Server

SYNOPSIS
       mysqlrplshow [options]

DESCRIPTION
       This utility shows the replication slaves for a master. It prints a graph of the master and its slaves labeling each with the host name and
       port number.

       You must specify the --discover-slaves-login option to provide the user name and password to discover any slaves in the topology.

       To explore the slaves for each client, use the --recurse option. This causes the utility to connect to each slave found and attempt to
       determine whether it has any slaves. If slaves are found, the process continues until the slave is found in the list of servers serving as
       masters (a circular topology). The graph displays the topology with successive indents. A notation is made for circular topologies.

       If you use the --recurse option, the utility attempts to connect to the slaves using the user name and password provided for the master. By
       default, if the connection attempt fails, the utility throws an error and stops. To change this behavior, use the --prompt option, which
       permits the utility to prompt for the user name and password for each slave that fails to connect. You can also use the --num-retries=n
       option to reattempt a failed connection 'n' times before the utility fails.

       An example graph for a typical topology with relay slaves is shown here:

           # Replication Topology Graph::
           localhost:3311 (MASTER)
              |
              +--- localhost:3310 - (SLAVE)
              |
              +--- localhost:3312 - (SLAVE + MASTER)
                  |
                  +--- localhost:3313 - (SLAVE)

       MASTER, SLAVE, and SLAVE+MASTER indicate that a server is a master only, slave only, and both slave and master, respectively.

       A circular replication topology is shown like this, where <--> indicates circularity:

           # Replication Topology Graph
           localhost:3311 (MASTER)
              |
              +--- localhost:3312 - (SLAVE + MASTER)
                  |
                  +--- localhost:3313 - (SLAVE + MASTER)
                      |
                      +--- localhost:3311 <--> (SLAVE)

       To produce a column list in addition to the graph, specify the --show-list option. In this case, to specify how to display the list, use
       one of the following values with the --format option:

       ·   grid (default)

           Display output in grid or table format like that of the mysql monitor.

       ·   csv

           Display output in comma-separated values format.

       ·   tab

           Display output in tab-separated format.

       ·   vertical

           Display output in single-column format like that of the \G command for the mysql monitor.

       The utility uses of the SHOW SLAVE HOSTS statement to determine which slaves the master has. If you want to use the --recurse option,
       slaves should have been started with the --report-host and --report-port options set to their actual host name and port number or the
       utility may not be able to connect to the slaves to determine their own slaves.
             OPTIONS

       mysqlrplshow accepts the following command-line options:

       ·   --help

           Display a help message and exit.

       ·   --discover-slaves-login=<slave-login>

           Supply the user and password in the form <user>[:<passwd>] or <login-path> for discovering slaves and relay slaves in the topology. For
           example, --discover=joe:secret will use 'joe' as the user and 'secret' as the password for each discovered slave.

       ·   --format=<format>, -f<format>

           Specify the display format for column list output. Permitted format values are grid, csv, tab, and vertical. The default is grid. This
           option applies only if --show-list is given.

       ·   --master=<source>

           Connection information for the master server in the format: <user>[:<passwd>]@<host>[:<port>][:<socket>] or
           <login-path>[:<port>][:<socket>].

       ·   --max-depth=<N>

           The maximum recursion depth. This option is valid only if --recurse is given.

       ·   --num-retries=<num_retries>, -n<num_retries>

           The number of retries permitted for failed slave login attempts. This option is valid only if --prompt is given.

       ·   --prompt, -p

           Prompt for the slave user and password if different from the master user and password.

           If you give this option, the utility sets --num-retries to 1 if that option is not set explicitly. This ensures at least one attempt to
           retry and prompt for the user name and password should a connection fail.

       ·   --quiet, -q

           Turn off all messages for quiet execution. This option does not suppress errors or warnings.

       ·   --recurse, -r

           Traverse the list of slaves to find additional master/slave connections. User this option to map a replication topology.

       ·   --show-list, -l

           Display a column list of the topology.

       ·   --verbose, -v

           Specify how much information to display. If this option is used, the IO thread status of each slave is also displayed. Use this option
           multiple times to increase the amount of information. For example, -v = verbose, -vv = more verbose, -vvv = debug. If you use -vvv, the
           output will contain the state of the IO and SQL threads for each slave.

       ·   --version

           Display version information and exit.
             NOTES

       The login user must have the REPLICATE SLAVE and REPLICATE CLIENT privileges to successfully execute this utility. Specifically, the login
       user must have appropriate permissions to execute SHOW SLAVE STATUS, SHOW MASTER STATUS, and SHOW SLAVE HOSTS.

       For the --format option, the permitted values are not case sensitive. In addition, values may be specified as any unambiguous prefix of a
       valid value. For example, --format=g specifies the grid format. An error occurs if a prefix matches more than one valid value.

       Mixing IP and hostnames is not recommended. The replication-specific utilities will attempt to compare hostnames and IP addresses as
       aliases for checking slave connectivity to the master. However, if your installation does not support reverse name lookup, the comparison
       could fail. Without the ability to do a reverse name lookup, the replication utilities could report a false negative that the slave is
       (not) connected to the master.

       For example, if you setup replication using MASTER_HOST=ubuntu.net on the slave and later connect to the slave with mysqlrplcheck and have
       the master specified as --master=192.168.0.6 using the valid IP address for ubuntu.net, you must have the ability to do a reverse name
       lookup to compare the IP (192.168.0.6) and the hostname (ubuntu.net) to determine if they are the same machine.

       The path to the MySQL client tools should be included in the PATH environment variable in order to use the authentication mechanism with
       login-paths. This will allow the utility to use the my_print_defaults tools which is required to read the login-path values from the login
       configuration file (.mylogin.cnf).
             EXAMPLES

       To show the slaves for a master running on port 3311 on the local host, use the following command:

           $ mysqlrplshow  --master=root@localhost:3311 --discover-slaves-login=root
           # master on localhost: ... connected.
           # Finding slaves for master: localhost:3311
           # Replication Topology Graph
           localhost:3311 (MASTER)
              |
              +--- localhost:3310 - (SLAVE)
              |
              +--- localhost:3312 - (SLAVE)

       As shown in the example, you must provide valid login information for the master.

       To show additional information about the IO thread status (to confirm if the slaves are really connected to the master) use the option
       --verbose:

           $ mysqlrplshow  --master=root@localhost:3311 --discover-slaves-login=root --verbose
           # master on localhost: ... connected.
           # Finding slaves for master: localhost:3311
           # Replication Topology Graph
           localhost:3311 (MASTER)
              |
              +--- localhost:3310 [IO: Yes, SQL: Yes] - (SLAVE)
              |
              +--- localhost:3312 [IO: Yes, SQL: Yes] - (SLAVE)

       To show the full replication topology of a master running on the local host, use the following command:

           $ mysqlrplshow  --master=root@localhost:3311 --recurse --discover-slaves-login=root
           # master on localhost: ... connected.
           # Finding slaves for master: localhost:3311
           # Replication Topology Graph
           localhost:3311 (MASTER)
              |
              +--- localhost:3310 - (SLAVE)
              |
              +--- localhost:3312 - (SLAVE + MASTER)
                  |
                  +--- localhost:3313 - (SLAVE)

       To show the full replication topology of a master running on the local host, prompting for the user name and password for slaves that do
       not have the same user name and password credentials as the master, use the following command:

           $ mysqlrplshow --recurse --prompt --num-retries=1 \
             --master=root@localhost:3331 --discover-slaves-login=root
           Server localhost:3331 is running on localhost.
           # master on localhost: ... connected.
           # Finding slaves for master: localhost:3331
           Server localhost:3332 is running on localhost.
           # master on localhost: ... FAILED.
           Connection to localhost:3332 has failed.
           Please enter the following information to connect to this server.
           User name: root
           Password:
           # master on localhost: ... connected.
           # Finding slaves for master: localhost:3332
           Server localhost:3333 is running on localhost.
           # master on localhost: ... FAILED.
           Connection to localhost:3333 has failed.
           Please enter the following information to connect to this server.
           User name: root
           Password:
           # master on localhost: ... connected.
           # Finding slaves for master: localhost:3333
           Server localhost:3334 is running on localhost.
           # master on localhost: ... FAILED.
           Connection to localhost:3334 has failed.
           Please enter the following information to connect to this server.
           User name: root
           Password:
           # master on localhost: ... connected.
           # Finding slaves for master: localhost:3334
           # Replication Topology Graph
           localhost:3331 (MASTER)
              |
              +--- localhost:3332 - (SLAVE)
              |
              +--- localhost:3333 - (SLAVE + MASTER)
                  |
                  +--- localhost:3334 - (SLAVE)

COPYRIGHT
SEE ALSO
       For more information, please refer to the MySQL Utilities section of the MySQL Workbench Reference Manual, which is available online at
       http://dev.mysql.com/doc/workbench/en/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 1.4.0                                                         10/03/2013                                                     MYSQLRPLSHOW(1)
