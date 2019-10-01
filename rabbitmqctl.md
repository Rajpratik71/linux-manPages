RABBITMQCTL(1)                                                                                 RabbitMQ Service                                                                                RABBITMQCTL(1)



NAME
       rabbitmqctl - command line tool for managing a RabbitMQ broker

SYNOPSIS


                   rabbitmqctl [-n node] [-t timeout] [-q] {command} [command options...]

DESCRIPTION
       RabbitMQ is an implementation of AMQP, the emerging standard for high performance enterprise messaging. The RabbitMQ server is a robust and scalable implementation of an AMQP broker.

       rabbitmqctl is a command line tool for managing a RabbitMQ broker. It performs all actions by connecting to one of the broker's nodes.

       Diagnostic information is displayed if the broker was not running, could not be reached, or rejected the connection due to mismatching Erlang cookies.

OPTIONS
       [-n node]
           Default node is "rabbit@server", where server is the local host. On a host named "server.example.com", the node name of the RabbitMQ Erlang node will usually be rabbit@server (unless
           RABBITMQ_NODENAME has been set to some non-default value at broker startup time). The output of hostname -s is usually the correct suffix to use after the "@" sign. See rabbitmq-server(1) for
           details of configuring the RabbitMQ broker.

       [-q]
           Quiet output mode is selected with the "-q" flag. Informational messages are suppressed when quiet mode is in effect.

       [-t timeout]
           Operation timeout in seconds. Only applicable to "list" commands. Default is "infinity".

COMMANDS
   Application and Cluster Management
       stop [pid_file]
           Stops the Erlang node on which RabbitMQ is running. To restart the node follow the instructions for Running the Server in the installation guide[1].

           If a pid_file is specified, also waits for the process specified there to terminate. See the description of the wait command below for details on this file.

           For example:

           rabbitmqctl stop

           This command instructs the RabbitMQ node to terminate.

       shutdown
           Shuts down the Erlang process on which RabbitMQ is running. The command is blocking and will return after the Erlang process exits. If RabbitMQ fails to stop, it will return a non-zero exit
           code.

           Unlike the stop command, the shutdown command: * does not require a pid_file to wait for the Erlang process to exit * if RabbitMQ node is not running, it will return a non-zero exit code

           For example:

           rabbitmqctl shutdown

           This command shuts down the Erlang process on which RabbitMQ is running.

       stop_app
           Stops the RabbitMQ application, leaving the Erlang node running.

           This command is typically run prior to performing other management actions that require the RabbitMQ application to be stopped, e.g.  reset.

           For example:

           rabbitmqctl stop_app

           This command instructs the RabbitMQ node to stop the RabbitMQ application.

       start_app
           Starts the RabbitMQ application.

           This command is typically run after performing other management actions that required the RabbitMQ application to be stopped, e.g.  reset.

           For example:

           rabbitmqctl start_app

           This command instructs the RabbitMQ node to start the RabbitMQ application.

       wait {pid_file}
           Wait for the RabbitMQ application to start.

           This command will wait for the RabbitMQ application to start at the node. It will wait for the pid file to be created, then for a process with a pid specified in the pid file to start, and then
           for the RabbitMQ application to start in that process. It will fail if the process terminates without starting the RabbitMQ application.

           A suitable pid file is created by the rabbitmq-server script. By default this is located in the Mnesia directory. Modify the RABBITMQ_PID_FILE environment variable to change the location.

           For example:

           rabbitmqctl wait /var/run/rabbitmq/pid

           This command will return when the RabbitMQ node has started up.

       reset
           Return a RabbitMQ node to its virgin state.

           Removes the node from any cluster it belongs to, removes all data from the management database, such as configured users and vhosts, and deletes all persistent messages.

           For reset and force_reset to succeed the RabbitMQ application must have been stopped, e.g. with stop_app.

           For example:

           rabbitmqctl reset

           This command resets the RabbitMQ node.

       force_reset
           Forcefully return a RabbitMQ node to its virgin state.

           The force_reset command differs from reset in that it resets the node unconditionally, regardless of the current management database state and cluster configuration. It should only be used as a
           last resort if the database or cluster configuration has been corrupted.

           For reset and force_reset to succeed the RabbitMQ application must have been stopped, e.g. with stop_app.

           For example:

           rabbitmqctl force_reset

           This command resets the RabbitMQ node.

       rotate_logs {suffix}
           Instruct the RabbitMQ node to rotate the log files.

           The RabbitMQ broker appends the contents of its log files to files with names composed of the original name and the suffix, and then resumes logging to freshly created files at the original
           location. I.e. effectively the current log contents are moved to the end of the suffixed files.

           When the target files do not exist they are created. When no suffix is specified, no rotation takes place - log files are just re-opened.

           For example:

           rabbitmqctl rotate_logs .1

           This command instructs the RabbitMQ node to append the contents of the log files to files with names consisting of the original logs' names and ".1" suffix, e.g. rabbit@mymachine.log.1 and
           rabbit@mymachine-sasl.log.1. Finally, logging resumes to fresh files at the old locations.

       hipe_compile {directory}
           Performs HiPE-compilation and caches resulting .beam-files in the given directory.

           Parent directories are created if necessary. Any existing .beam files from the directory are automatically deleted prior to compilation.

           To use this precompiled files, you should set RABBITMQ_SERVER_CODE_PATH environment variable to directory specified in hipe_compile invokation.

           For example:

           rabbitmqctl hipe_compile /tmp/rabbit-hipe/ebin

           HiPE-compiles modules and stores them to /tmp/rabbit-hipe/ebin directory.

   Cluster management
       join_cluster {clusternode} [--ram]

           clusternode
               Node to cluster with.

           [--ram]
               If provided, the node will join the cluster as a RAM node.

           Instruct the node to become a member of the cluster that the specified node is in. Before clustering, the node is reset, so be careful when using this command. For this command to succeed the
           RabbitMQ application must have been stopped, e.g. with stop_app.

           Cluster nodes can be of two types: disc or RAM. Disc nodes replicate data in RAM and on disc, thus providing redundancy in the event of node failure and recovery from global events such as power
           failure across all nodes. RAM nodes replicate data in RAM only (with the exception of queue contents, which can reside on disc if the queue is persistent or too big to fit in memory) and are
           mainly used for scalability. RAM nodes are more performant only when managing resources (e.g. adding/removing queues, exchanges, or bindings). A cluster must always have at least one disc node,
           and usually should have more than one.

           The node will be a disc node by default. If you wish to create a RAM node, provide the --ram flag.

           After executing the cluster command, whenever the RabbitMQ application is started on the current node it will attempt to connect to the nodes that were in the cluster when the node went down.

           To leave a cluster, reset the node. You can also remove nodes remotely with the forget_cluster_node command.

           For more details see the clustering guide[2].

           For example:

           rabbitmqctl join_cluster hare@elena --ram

           This command instructs the RabbitMQ node to join the cluster that hare@elena is part of, as a ram node.

       cluster_status
           Displays all the nodes in the cluster grouped by node type, together with the currently running nodes.

           For example:

           rabbitmqctl cluster_status

           This command displays the nodes in the cluster.

       change_cluster_node_type {disc | ram}
           Changes the type of the cluster node. The node must be stopped for this operation to succeed, and when turning a node into a RAM node the node must not be the only disc node in the cluster.

           For example:

           rabbitmqctl change_cluster_node_type disc

           This command will turn a RAM node into a disc node.

       forget_cluster_node [--offline]

           [--offline]
               Enables node removal from an offline node. This is only useful in the situation where all the nodes are offline and the last node to go down cannot be brought online, thus preventing the
               whole cluster from starting. It should not be used in any other circumstances since it can lead to inconsistencies.

           Removes a cluster node remotely. The node that is being removed must be offline, while the node we are removing from must be online, except when using the --offline flag.

           When using the --offline flag rabbitmqctl will not attempt to connect to a node as normal; instead it will temporarily become the node in order to make the change. This is useful if the node
           cannot be started normally. In this case the node will become the canonical source for cluster metadata (e.g. which queues exist), even if it was not before. Therefore you should use this
           command on the latest node to shut down if at all possible.

           For example:

           rabbitmqctl -n hare@mcnulty forget_cluster_node rabbit@stringer

           This command will remove the node rabbit@stringer from the node hare@mcnulty.

       rename_cluster_node {oldnode1} {newnode1} [oldnode2] [newnode2 ...]
           Supports renaming of cluster nodes in the local database.

           This subcommand causes rabbitmqctl to temporarily become the node in order to make the change. The local cluster node must therefore be completely stopped; other nodes can be online or offline.

           This subcommand takes an even number of arguments, in pairs representing the old and new names for nodes. You must specify the old and new names for this node and for any other nodes that are
           stopped and being renamed at the same time.

           It is possible to stop all nodes and rename them all simultaneously (in which case old and new names for all nodes must be given to every node) or stop and rename nodes one at a time (in which
           case each node only needs to be told how its own name is changing).

           For example:

           rabbitmqctl rename_cluster_node rabbit@misshelpful rabbit@cordelia

           This command will rename the node rabbit@misshelpful to the node rabbit@cordelia.

       update_cluster_nodes {clusternode}

           clusternode
               The node to consult for up to date information.

           Instructs an already clustered node to contact clusternode to cluster when waking up. This is different from join_cluster since it does not join any cluster - it checks that the node is already
           in a cluster with clusternode.

           The need for this command is motivated by the fact that clusters can change while a node is offline. Consider the situation in which node A and B are clustered. A goes down, C clusters with B,
           and then B leaves the cluster. When A wakes up, it'll try to contact B, but this will fail since B is not in the cluster anymore.  update_cluster_nodes -n A C will solve this situation.

       force_boot
           Ensure that the node will start next time, even if it was not the last to shut down.

           Normally when you shut down a RabbitMQ cluster altogether, the first node you restart should be the last one to go down, since it may have seen things happen that other nodes did not. But
           sometimes that's not possible: for instance if the entire cluster loses power then all nodes may think they were not the last to shut down.

           In such a case you can invoke rabbitmqctl force_boot while the node is down. This will tell the node to unconditionally start next time you ask it to. If any changes happened to the cluster
           after this node shut down, they will be lost.

           If the last node to go down is permanently lost then you should use rabbitmqctl forget_cluster_node --offline in preference to this command, as it will ensure that mirrored queues which were
           mastered on the lost node get promoted.

           For example:

           rabbitmqctl force_boot

           This will force the node not to wait for other nodes next time it is started.

       sync_queue [-p vhost] {queue}

           queue
               The name of the queue to synchronise.

           Instructs a mirrored queue with unsynchronised slaves to synchronise itself. The queue will block while synchronisation takes place (all publishers to and consumers from the queue will block).
           The queue must be mirrored for this command to succeed.

           Note that unsynchronised queues from which messages are being drained will become synchronised eventually. This command is primarily useful for queues which are not being drained.

       cancel_sync_queue [-p vhost] {queue}

           queue
               The name of the queue to cancel synchronisation for.

           Instructs a synchronising mirrored queue to stop synchronising itself.

       purge_queue [-p vhost] {queue}

           queue
               The name of the queue to purge.

           Purges a queue (removes all messages in it).

       set_cluster_name {name}
           Sets the cluster name. The cluster name is announced to clients on connection, and used by the federation and shovel plugins to record where a message has been. The cluster name is by default
           derived from the hostname of the first node in the cluster, but can be changed.

           For example:

           rabbitmqctl set_cluster_name london

           This sets the cluster name to "london".

   User management
       Note that rabbitmqctl manages the RabbitMQ internal user database. Users from any alternative authentication backend will not be visible to rabbitmqctl.

       add_user {username} {password}

           username
               The name of the user to create.

           password
               The password the created user will use to log in to the broker.

           For example:

           rabbitmqctl add_user tonyg changeit

           This command instructs the RabbitMQ broker to create a (non-administrative) user named tonyg with (initial) password changeit.

       delete_user {username}

           username
               The name of the user to delete.

           For example:

           rabbitmqctl delete_user tonyg

           This command instructs the RabbitMQ broker to delete the user named tonyg.

       change_password {username} {newpassword}

           username
               The name of the user whose password is to be changed.

           newpassword
               The new password for the user.

           For example:

           rabbitmqctl change_password tonyg newpass

           This command instructs the RabbitMQ broker to change the password for the user named tonyg to newpass.

       clear_password {username}

           username
               The name of the user whose password is to be cleared.

           For example:

           rabbitmqctl clear_password tonyg

           This command instructs the RabbitMQ broker to clear the password for the user named tonyg. This user now cannot log in with a password (but may be able to through e.g. SASL EXTERNAL if
           configured).

       authenticate_user {username} {password}

           username
               The name of the user.

           password
               The password of the user.

           For example:

           rabbitmqctl authenticate_user tonyg verifyit

           This command instructs the RabbitMQ broker to authenticate the user named tonyg with password verifyit.

       set_user_tags {username} {tag ...}

           username
               The name of the user whose tags are to be set.

           tag
               Zero, one or more tags to set. Any existing tags will be removed.

           For example:

           rabbitmqctl set_user_tags tonyg administrator

           This command instructs the RabbitMQ broker to ensure the user named tonyg is an administrator. This has no effect when the user logs in via AMQP, but can be used to permit the user to manage
           users, virtual hosts and permissions when the user logs in via some other means (for example with the management plugin).

           rabbitmqctl set_user_tags tonyg

           This command instructs the RabbitMQ broker to remove any tags from the user named tonyg.

       list_users
           Lists users. Each result row will contain the user name followed by a list of the tags set for that user.

           For example:

           rabbitmqctl list_users

           This command instructs the RabbitMQ broker to list all users.

   Access control
       Note that rabbitmqctl manages the RabbitMQ internal user database. Permissions for users from any alternative authorisation backend will not be visible to rabbitmqctl.

       add_vhost {vhost}

           vhost
               The name of the virtual host entry to create.

           Creates a virtual host.

           For example:

           rabbitmqctl add_vhost test

           This command instructs the RabbitMQ broker to create a new virtual host called test.

       delete_vhost {vhost}

           vhost
               The name of the virtual host entry to delete.

           Deletes a virtual host.

           Deleting a virtual host deletes all its exchanges, queues, bindings, user permissions, parameters and policies.

           For example:

           rabbitmqctl delete_vhost test

           This command instructs the RabbitMQ broker to delete the virtual host called test.

       list_vhosts [vhostinfoitem ...]
           Lists virtual hosts.

           The vhostinfoitem parameter is used to indicate which virtual host information items to include in the results. The column order in the results will match the order of the parameters.
           vhostinfoitem can take any value from the list that follows:

           name
               The name of the virtual host with non-ASCII characters escaped as in C.

           tracing
               Whether tracing is enabled for this virtual host.

           If no vhostinfoitems are specified then the vhost name is displayed.

           For example:

           rabbitmqctl list_vhosts name tracing

           This command instructs the RabbitMQ broker to list all virtual hosts.

       set_permissions [-p vhost] {user} {conf} {write} {read}

           vhost
               The name of the virtual host to which to grant the user access, defaulting to /.

           user
               The name of the user to grant access to the specified virtual host.

           conf
               A regular expression matching resource names for which the user is granted configure permissions.

           write
               A regular expression matching resource names for which the user is granted write permissions.

           read
               A regular expression matching resource names for which the user is granted read permissions.

           Sets user permissions.

           For example:

           rabbitmqctl set_permissions -p /myvhost tonyg "^tonyg-.*" ".*" ".*"

           This command instructs the RabbitMQ broker to grant the user named tonyg access to the virtual host called /myvhost, with configure permissions on all resources whose names starts with "tonyg-",
           and write and read permissions on all resources.

       clear_permissions [-p vhost] {username}

           vhost
               The name of the virtual host to which to deny the user access, defaulting to /.

           username
               The name of the user to deny access to the specified virtual host.

           Sets user permissions.

           For example:

           rabbitmqctl clear_permissions -p /myvhost tonyg

           This command instructs the RabbitMQ broker to deny the user named tonyg access to the virtual host called /myvhost.

       list_permissions [-p vhost]

           vhost
               The name of the virtual host for which to list the users that have been granted access to it, and their permissions. Defaults to /.

           Lists permissions in a virtual host.

           For example:

           rabbitmqctl list_permissions -p /myvhost

           This command instructs the RabbitMQ broker to list all the users which have been granted access to the virtual host called /myvhost, and the permissions they have for operations on resources in
           that virtual host. Note that an empty string means no permissions granted.

       list_user_permissions {username}

           username
               The name of the user for which to list the permissions.

           Lists user permissions.

           For example:

           rabbitmqctl list_user_permissions tonyg

           This command instructs the RabbitMQ broker to list all the virtual hosts to which the user named tonyg has been granted access, and the permissions the user has for operations on resources in
           these virtual hosts.

   Parameter Management
       Certain features of RabbitMQ (such as the federation plugin) are controlled by dynamic, cluster-wide parameters. There are 2 kinds of parameters: parameters scoped to a virtual host and global
       parameters. Each vhost-scoped parameter consists of a component name, a name and a value. The component name and name are strings, and the value is an Erlang term. A global parameter consists of a
       name and value. The name is a string and the value is an Erlang term. Parameters can be set, cleared and listed. In general you should refer to the documentation for the feature in question to see
       how to set parameters.

       set_parameter [-p vhost] {component_name} {name} {value}
           Sets a parameter.

           component_name
               The name of the component for which the parameter is being set.

           name
               The name of the parameter being set.

           value
               The value for the parameter, as a JSON term. In most shells you are very likely to need to quote this.

           For example:

           rabbitmqctl set_parameter federation local_username '"guest"'

           This command sets the parameter local_username for the federation component in the default virtual host to the JSON term "guest".

       clear_parameter [-p vhost] {component_name} {key}
           Clears a parameter.

           component_name
               The name of the component for which the parameter is being cleared.

           name
               The name of the parameter being cleared.

           For example:

           rabbitmqctl clear_parameter federation local_username

           This command clears the parameter local_username for the federation component in the default virtual host.

       list_parameters [-p vhost]
           Lists all parameters for a virtual host.

           For example:

           rabbitmqctl list_parameters

           This command lists all parameters in the default virtual host.

       set_global_parameter {name} {value}
           Sets a global runtime parameter. This is similar to set_parameter but the key-value pair isn't tied to a virtual host.

           name
               The name of the global runtime parameter being set.

           value
               The value for the global runtime parameter, as a JSON term. In most shells you are very likely to need to quote this.

           For example:

           rabbitmqctl set_global_parameter mqtt_default_vhosts '{"O=client,CN=guest":"/"}'

           This command sets the global runtime parameter mqtt_default_vhosts to the JSON term {"O=client,CN=guest":"/"}.

       clear_global_parameter {name}
           Clears a global runtime parameter. This is similar to clear_global_parameter but the key-value pair isn't tied to a virtual host.

           name
               The name of the global runtime parameter being cleared.

           For example:

           rabbitmqctl clear_global_parameter mqtt_default_vhosts

           This command clears the global runtime parameter mqtt_default_vhosts.

       list_global_parameters
           Lists all global runtime parameters. This is similar to list_parameters but the global runtime parameters are not tied to any virtual host.

           For example:

           rabbitmqctl list_global_parameters

           This command lists all global parameters.

   Policy Management
       Policies are used to control and modify the behaviour of queues and exchanges on a cluster-wide basis. Policies apply within a given vhost, and consist of a name, pattern, definition and an optional
       priority. Policies can be set, cleared and listed.

       set_policy [-p vhost] [--priority priority] [--apply-to apply-to] {name} {pattern} {definition}
           Sets a policy.

           name
               The name of the policy.

           pattern
               The regular expression, which when matches on a given resources causes the policy to apply.

           definition
               The definition of the policy, as a JSON term. In most shells you are very likely to need to quote this.

           priority
               The priority of the policy as an integer. Higher numbers indicate greater precedence. The default is 0.

           apply-to
               Which types of object this policy should apply to - "queues", "exchanges" or "all". The default is "all".

           For example:

           rabbitmqctl set_policy federate-me "^amq." '{"federation-upstream-set":"all"}'

           This command sets the policy federate-me in the default virtual host so that built-in exchanges are federated.

       clear_policy [-p vhost] {name}
           Clears a policy.

           name
               The name of the policy being cleared.

           For example:

           rabbitmqctl clear_policy federate-me

           This command clears the federate-me policy in the default virtual host.

       list_policies [-p vhost]
           Lists all policies for a virtual host.

           For example:

           rabbitmqctl list_policies

           This command lists all policies in the default virtual host.

   Server Status
       The server status queries interrogate the server and return a list of results with tab-delimited columns. Some queries (list_queues, list_exchanges, list_bindings, and list_consumers) accept an
       optional vhost parameter. This parameter, if present, must be specified immediately after the query.

       The list_queues, list_exchanges and list_bindings commands accept an optional virtual host parameter for which to display results. The default value is "/".

       list_queues [-p vhost] [[--offline] | [--online] | [--local]] [queueinfoitem ...]
           Returns queue details. Queue details of the / virtual host are returned if the "-p" flag is absent. The "-p" flag can be used to override this default.

           Displayed queues can be filtered by their status or location using one of the following mutually exclusive options:

           [--offline]
               List only those durable queues that are not currently available (more specifically, their master node isn't).

           [--online]
               List queues that are currently available (their master node is).

           [--local]
               List only those queues whose master process is located on the current node.

           The queueinfoitem parameter is used to indicate which queue information items to include in the results. The column order in the results will match the order of the parameters.  queueinfoitem
           can take any value from the list that follows:

           name
               The name of the queue with non-ASCII characters escaped as in C.

           durable
               Whether or not the queue survives server restarts.

           auto_delete
               Whether the queue will be deleted automatically when no longer used.

           arguments
               Queue arguments.

           policy
               Policy name applying to the queue.

           pid
               Id of the Erlang process associated with the queue.

           owner_pid
               Id of the Erlang process representing the connection which is the exclusive owner of the queue. Empty if the queue is non-exclusive.

           exclusive
               True if queue is exclusive (i.e. has owner_pid), false otherwise

           exclusive_consumer_pid
               Id of the Erlang process representing the channel of the exclusive consumer subscribed to this queue. Empty if there is no exclusive consumer.

           exclusive_consumer_tag
               Consumer tag of the exclusive consumer subscribed to this queue. Empty if there is no exclusive consumer.

           messages_ready
               Number of messages ready to be delivered to clients.

           messages_unacknowledged
               Number of messages delivered to clients but not yet acknowledged.

           messages
               Sum of ready and unacknowledged messages (queue depth).

           messages_ready_ram
               Number of messages from messages_ready which are resident in ram.

           messages_unacknowledged_ram
               Number of messages from messages_unacknowledged which are resident in ram.

           messages_ram
               Total number of messages which are resident in ram.

           messages_persistent
               Total number of persistent messages in the queue (will always be 0 for transient queues).

           message_bytes
               Sum of the size of all message bodies in the queue. This does not include the message properties (including headers) or any overhead.

           message_bytes_ready
               Like message_bytes but counting only those messages ready to be delivered to clients.

           message_bytes_unacknowledged
               Like message_bytes but counting only those messages delivered to clients but not yet acknowledged.

           message_bytes_ram
               Like message_bytes but counting only those messages which are in RAM.

           message_bytes_persistent
               Like message_bytes but counting only those messages which are persistent.

           head_message_timestamp
               The timestamp property of the first message in the queue, if present. Timestamps of messages only appear when they are in the paged-in state.

           disk_reads
               Total number of times messages have been read from disk by this queue since it started.

           disk_writes
               Total number of times messages have been written to disk by this queue since it started.

           consumers
               Number of consumers.

           consumer_utilisation
               Fraction of the time (between 0.0 and 1.0) that the queue is able to immediately deliver messages to consumers. This can be less than 1.0 if consumers are limited by network congestion or
               prefetch count.

           memory
               Bytes of memory consumed by the Erlang process associated with the queue, including stack, heap and internal structures.

           slave_pids
               If the queue is mirrored, this gives the IDs of the current slaves.

           synchronised_slave_pids
               If the queue is mirrored, this gives the IDs of the current slaves which are synchronised with the master - i.e. those which could take over from the master without message loss.

           state
               The state of the queue. Normally 'running', but may be "{syncing, MsgCount}" if the queue is synchronising. Queues which are located on cluster nodes that are currently down will be shown
               with a status of 'down' (and most other queueinfoitems will be unavailable).

           If no queueinfoitems are specified then queue name and depth are displayed.

           For example:

           rabbitmqctl list_queues -p /myvhost messages consumers

           This command displays the depth and number of consumers for each queue of the virtual host named /myvhost.

       list_exchanges [-p vhost] [exchangeinfoitem ...]
           Returns exchange details. Exchange details of the / virtual host are returned if the "-p" flag is absent. The "-p" flag can be used to override this default.

           The exchangeinfoitem parameter is used to indicate which exchange information items to include in the results. The column order in the results will match the order of the parameters.
           exchangeinfoitem can take any value from the list that follows:

           name
               The name of the exchange with non-ASCII characters escaped as in C.

           type
               The exchange type (such as [direct, topic, headers, fanout]).

           durable
               Whether or not the exchange survives server restarts.

           auto_delete
               Whether the exchange will be deleted automatically when no longer used.

           internal
               Whether the exchange is internal, i.e. cannot be directly published to by a client.

           arguments
               Exchange arguments.

           policy
               Policy name for applying to the exchange.

           If no exchangeinfoitems are specified then exchange name and type are displayed.

           For example:

           rabbitmqctl list_exchanges -p /myvhost name type

           This command displays the name and type for each exchange of the virtual host named /myvhost.

       list_bindings [-p vhost] [bindinginfoitem ...]
           Returns binding details. By default the bindings for the / virtual host are returned. The "-p" flag can be used to override this default.

           The bindinginfoitem parameter is used to indicate which binding information items to include in the results. The column order in the results will match the order of the parameters.
           bindinginfoitem can take any value from the list that follows:

           source_name
               The name of the source of messages to which the binding is attached. With non-ASCII characters escaped as in C.

           source_kind
               The kind of the source of messages to which the binding is attached. Currently always exchange. With non-ASCII characters escaped as in C.

           destination_name
               The name of the destination of messages to which the binding is attached. With non-ASCII characters escaped as in C.

           destination_kind
               The kind of the destination of messages to which the binding is attached. With non-ASCII characters escaped as in C.

           routing_key
               The binding's routing key, with non-ASCII characters escaped as in C.

           arguments
               The binding's arguments.

           If no bindinginfoitems are specified then all above items are displayed.

           For example:

           rabbitmqctl list_bindings -p /myvhost exchange_name queue_name

           This command displays the exchange name and queue name of the bindings in the virtual host named /myvhost.

       list_connections [connectioninfoitem ...]
           Returns TCP/IP connection statistics.

           The connectioninfoitem parameter is used to indicate which connection information items to include in the results. The column order in the results will match the order of the parameters.
           connectioninfoitem can take any value from the list that follows:

           pid
               Id of the Erlang process associated with the connection.

           name
               Readable name for the connection.

           port
               Server port.

           host
               Server hostname obtained via reverse DNS, or its IP address if reverse DNS failed or was not enabled.

           peer_port
               Peer port.

           peer_host
               Peer hostname obtained via reverse DNS, or its IP address if reverse DNS failed or was not enabled.

           ssl
               Boolean indicating whether the connection is secured with SSL.

           ssl_protocol
               SSL protocol (e.g. tlsv1)

           ssl_key_exchange
               SSL key exchange algorithm (e.g. rsa)

           ssl_cipher
               SSL cipher algorithm (e.g. aes_256_cbc)

           ssl_hash
               SSL hash function (e.g. sha)

           peer_cert_subject
               The subject of the peer's SSL certificate, in RFC4514 form.

           peer_cert_issuer
               The issuer of the peer's SSL certificate, in RFC4514 form.

           peer_cert_validity
               The period for which the peer's SSL certificate is valid.

           state
               Connection state (one of [starting, tuning, opening, running, flow, blocking, blocked, closing, closed]).

           channels
               Number of channels using the connection.

           protocol
               Version of the AMQP protocol in use (currently one of {0,9,1} or {0,8,0}). Note that if a client requests an AMQP 0-9 connection, we treat it as AMQP 0-9-1.

           auth_mechanism
               SASL authentication mechanism used, such as PLAIN.

           user
               Username associated with the connection.

           vhost
               Virtual host name with non-ASCII characters escaped as in C.

           timeout
               Connection timeout / negotiated heartbeat interval, in seconds.

           frame_max
               Maximum frame size (bytes).

           channel_max
               Maximum number of channels on this connection.

           client_properties
               Informational properties transmitted by the client during connection establishment.

           recv_oct
               Octets received.

           recv_cnt
               Packets received.

           send_oct
               Octets send.

           send_cnt
               Packets sent.

           send_pend
               Send queue size.

           connected_at
               Date and time this connection was established, as timestamp.

           If no connectioninfoitems are specified then user, peer host, peer port, time since flow control and memory block state are displayed.

           For example:

           rabbitmqctl list_connections send_pend port

           This command displays the send queue size and server port for each connection.

       list_channels [channelinfoitem ...]
           Returns information on all current channels, the logical containers executing most AMQP commands. This includes channels that are part of ordinary AMQP connections, and channels created by
           various plug-ins and other extensions.

           The channelinfoitem parameter is used to indicate which channel information items to include in the results. The column order in the results will match the order of the parameters.
           channelinfoitem can take any value from the list that follows:

           pid
               Id of the Erlang process associated with the connection.

           connection
               Id of the Erlang process associated with the connection to which the channel belongs.

           name
               Readable name for the channel.

           number
               The number of the channel, which uniquely identifies it within a connection.

           user
               Username associated with the channel.

           vhost
               Virtual host in which the channel operates.

           transactional
               True if the channel is in transactional mode, false otherwise.

           confirm
               True if the channel is in confirm mode, false otherwise.

           consumer_count
               Number of logical AMQP consumers retrieving messages via the channel.

           messages_unacknowledged
               Number of messages delivered via this channel but not yet acknowledged.

           messages_uncommitted
               Number of messages received in an as yet uncommitted transaction.

           acks_uncommitted
               Number of acknowledgements received in an as yet uncommitted transaction.

           messages_unconfirmed
               Number of published messages not yet confirmed. On channels not in confirm mode, this remains 0.

           prefetch_count
               QoS prefetch limit for new consumers, 0 if unlimited.

           global_prefetch_count
               QoS prefetch limit for the entire channel, 0 if unlimited.

           If no channelinfoitems are specified then pid, user, consumer_count, and messages_unacknowledged are assumed.

           For example:

           rabbitmqctl list_channels connection messages_unacknowledged

           This command displays the connection process and count of unacknowledged messages for each channel.

       list_consumers [-p vhost]
           List consumers, i.e. subscriptions to a queue's message stream. Each line printed shows, separated by tab characters, the name of the queue subscribed to, the id of the channel process via which
           the subscription was created and is managed, the consumer tag which uniquely identifies the subscription within a channel, a boolean indicating whether acknowledgements are expected for messages
           delivered to this consumer, an integer indicating the prefetch limit (with 0 meaning 'none'), and any arguments for this consumer.

       status
           Displays broker status information such as the running applications on the current Erlang node, RabbitMQ and Erlang versions, OS name, memory and file descriptor statistics. (See the
           cluster_status command to find out which nodes are clustered and running.)

           For example:

           rabbitmqctl status

           This command displays information about the RabbitMQ broker.

       node_health_check
           Health check of the RabbitMQ node. Verifies the rabbit application is running, list_queues and list_channels return, and alarms are not set.

           For example:

           rabbitmqctl node_health_check -n rabbit@stringer

           This command performs a health check on the RabbitMQ node.

       environment
           Display the name and value of each variable in the application environment for each running application.

       report
           Generate a server status report containing a concatenation of all server status information for support purposes. The output should be redirected to a file when accompanying a support request.

           For example:

           rabbitmqctl report > server_report.txt

           This command creates a server report which may be attached to a support request email.

       eval {expr}
           Evaluate an arbitrary Erlang expression.

           For example:

           rabbitmqctl eval 'node().'

           This command returns the name of the node to which rabbitmqctl has connected.

   Miscellaneous
       close_connection {connectionpid} {explanation}

           connectionpid
               Id of the Erlang process associated with the connection to close.

           explanation
               Explanation string.

           Instruct the broker to close the connection associated with the Erlang process id connectionpid (see also the list_connections command), passing the explanation string to the connected client as
           part of the AMQP connection shutdown protocol.

           For example:

           rabbitmqctl close_connection "<rabbit@tanto.4262.0>" "go away"

           This command instructs the RabbitMQ broker to close the connection associated with the Erlang process id <rabbit@tanto.4262.0>, passing the explanation go away to the connected client.

       trace_on [-p vhost]

           vhost
               The name of the virtual host for which to start tracing.

           Starts tracing. Note that the trace state is not persistent; it will revert to being off if the server is restarted.

       trace_off [-p vhost]

           vhost
               The name of the virtual host for which to stop tracing.

           Stops tracing.

       set_vm_memory_high_watermark {fraction}

           fraction
               The new memory threshold fraction at which flow control is triggered, as a floating point number greater than or equal to 0.

       set_vm_memory_high_watermark absolute {memory_limit}

           memory_limit
               The new memory limit at which flow control is triggered, expressed in bytes as an integer number greater than or equal to 0 or as a string with memory units (e.g. 512M or 1G). Available
               units are: k, kiB: kibibytes (2^10 bytes) M, MiB: mebibytes (2^20) G, GiB: gibibytes (2^30) kB: kilobytes (10^3) MB: megabytes (10^6) GB: gigabytes (10^9)

       set_disk_free_limit {disk_limit}

           disk_limit
               Lower bound limit as an integer in bytes or a string with memory units (see vm_memory_high_watermark), e.g. 512M or 1G. Once free disk space reaches the limit, a disk alarm will be set.

       set_disk_free_limit mem_relative {fraction}

           fraction
               Limit relative to the total amount available RAM as a non-negative floating point number. Values lower than 1.0 can be dangerous and should be used carefully.

       encode [--decode] [value] [passphrase] [--list-ciphers] [--list-hashes] [--cipher cipher] [--hash hash] [--iterations iterations]

           [--decode]
               Flag to decrypt the input value.

               For example:

               rabbitmqctl encode --decode '{encrypted, <<"...">>}' mypassphrase

           [value] [passphrase]
               Value to encrypt/decrypt and passphrase.

               For example:

               rabbitmqctl encode '<<"guest">>' mypassphrase

               rabbitmqctl encode --decode '{encrypted, <<"...">>}' mypassphrase

           [--list-ciphers]
               Flag to list the supported ciphers.

               For example:

               rabbitmqctl encode --list-ciphers

           [--list-hashes]
               Flag to list the supported hash algorithms.

               For example:

               rabbitmqctl encode --list-hashes

           [--cipher cipher] [--hash hash] [--iterations iterations]
               Options to specify the encryption settings. They can be used independently.

               For example:

               rabbitmqctl encode --cipher blowfish_cfb64 --hash sha256 --iterations 10000 \
                                  '<<"guest">>' mypassphrase

       decode [value] [passphrase] [--cipher cipher] [--hash hash] [--iterations iterations]

           [value] [passphrase]
               Value to decrypt (as produced by the encode command) and passphrase.

               For example:

               rabbitmqctl decode '{encrypted, <<"...">>}' mypassphrase

           [--cipher cipher] [--hash hash] [--iterations iterations]
               Options to specify the decryption settings. They can be used independently.

               For example:

               rabbitmqctl decode --cipher blowfish_cfb64 --hash sha256 --iterations 10000 \
               '{encrypted,<<"cU4kaour6KG8n/rC4IZT4MfKsS/th9gdAMWjcY9ygUPIwiW4BJmVyg==">>}' mypassphrase

       list_hashes
           Lists hash functions supported by encoding commands.

           For example:

           rabbitmqctl list_hashes

           This command instructs the RabbitMQ broker to list all hash functions supported by encoding commands.

       list_ciphers
           Lists cipher suites supported by encoding commands.

           For example:

           rabbitmqctl list_ciphers

           This command instructs the RabbitMQ broker to list all cipher suites supported by encoding commands.

AUTHOR
       The RabbitMQ Team <<info@rabbitmq.com>>

NOTES
        1. installation guide
           http://www.rabbitmq.com/install.html

        2. clustering guide
           http://www.rabbitmq.com/clustering.html



RabbitMQ Server                                                                                   08/02/2018                                                                                   RABBITMQCTL(1)
