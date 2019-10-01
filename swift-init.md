swift-init(1)                                                                                  OpenStack Swift                                                                                  swift-init(1)



NAME
       swift-init - OpenStack Swift swift-init tool


SYNOPSIS
       swift-init
        <server> [<server> ...] <command> [options]


DESCRIPTION
       The  swift-init  tool can be used to initialize all swift daemons available as part of OpenStack Swift. Instead of calling individual init scripts for each swift daemon, one can just use swift-init.
       With swift-init you can initialize just one swift service, such as the "proxy", or a combination of them. The tool also allows one to use the keywords such  as  "all",  "main"  and  "rest"  for  the
       <server> argument.


       Servers:

           proxy
               - Initializes the swift proxy daemon

           object, object-replicator, object-auditor, object-updater
               - Initializes the swift object daemons above

           container, container-update, container-replicator, container-auditor
               - Initializes the swift container daemons above

           account, account-auditor, account-reaper, account-replicator
               - Initializes the swift account daemons above

           all
               - Initializes all the swift daemons

           main
               - Initializes all the main swift daemons
                 (proxy, container, account and object servers)

           rest
               - Initializes all the other swift background daemons
                 (updater, replicator, auditor, reaper, etc)


       Commands:

           force-reload:        alias for reload
           no-daemon:           start a server interactively
           no-wait:             spawn server and return immediately
           once:                start server and run one pass on supporting daemons
           reload:              graceful shutdown then restart on supporting servers
           restart:             stops then restarts server
           shutdown:            allow current requests to finish on supporting servers
           start:               starts a server
           status:              display status of tracked pids for server
           stop:                stops a server



       Options:
           -h, --help                show this help message and exit
           -v, --verbose             display verbose output
           -w, --no-wait             won't wait for server to start before returning
           -o, --once                only run one pass of daemon
           -n, --no-daemon           start server interactively
           -g, --graceful            send SIGHUP to supporting servers
           -c N, --config-num=N      send command to the Nth server only
           -k N, --kill-wait=N       wait N seconds for processes to die (default 15)
           -r RUN_DIR, --run-dir=RUN_DIR directory where the pids will be stored (default /var/run/swift)
           --strict return non-zero status code if some config is missing. Default mode if server is explicitly named.
           --non-strict return zero status code even if some config is missing. Default mode if server is one of aliases `all`, `main` or `rest`.
           --kill-after-timeout kill daemon and all children after kill-wait period.




DOCUMENTATION
       More documentation about OpenStack Swift can be found at https://docs.openstack.org/swift/latest/



Linux                                                                                             8/26/2011                                                                                     swift-init(1)
