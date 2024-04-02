swift-recon(1)                                                                                 OpenStack Swift                                                                                 swift-recon(1)



NAME
       swift-recon - OpenStack Swift recon middleware cli tool


SYNOPSIS
       swift-recon  <server_type> [-v] [--suppress] [-a] [-r] [-u] [-d] [-l] [-T] [--md5] [--auditor] [--updater] [--expirer] [--sockstat]


DESCRIPTION
       The swift-recon cli tool can be used to retrieve various metrics and telemetry information about a cluster that has been collected by the swift-recon middleware.

       In  order to make use of the swift-recon middleware, update the object-server.conf file and enable the recon middleware by adding a pipeline entry and setting its option(s). You can view more infor‐
       mation in the example section below.



OPTIONS
       <server_type>
              account|container|object - Defaults to object server.

       -h, --help
              show this help message and exit

       -v, --verbose
              Print verbose information

       --suppress
              Suppress most connection related errors

       -a, --async
              Get async stats

       --auditor
              Get auditor stats

       --updater
              Get updater stats

       --expirer
              Get expirer stats

       -r, --replication
              Get replication stats

       -u, --unmounted
              Check cluster for unmounted devices

       -d, --diskusage
              Get disk usage stats

       --top=COUNT
              Also show the top COUNT entries in rank order

       --lowest=COUNT
              Also show the lowest COUNT entries in rank order

       --human-readable
              Use human readable suffix for disk usage stats

       -l, --loadstats
              Get cluster load average stats

       -q, --quarantined
              Get cluster quarantine stats

       --validate-servers
              Validate servers on the ring

       --md5  Get md5sum of servers ring and compare to local copy

       --sockstat
              Get cluster socket usage stats

       --driveaudit
              Get drive audit error stats

       -T, --time
              Check time synchronization

       --swift-versions
              Check swift version

       --all  Perform all checks. Equivalent to -arudlqT --md5 --sockstat --auditor --updater --expirer --driveaudit --validate-servers --swift-versions

       --region=REGION
              Only query servers in specified region

       -z ZONE, --zone=ZONE
              Only query servers in specified zone

       -t SECONDS, --timeout=SECONDS
              Time to wait for a response from a server

       --swiftdir=PATH
              Default = /etc/swift




EXAMPLE
       ubuntu:~$ swift-recon -q --zone 3
       =================================================================
       [2011-10-18 19:36:00] Checking quarantine dirs on 1 hosts...
       [Quarantined objects] low: 4, high: 4, avg: 4, total: 4
       [Quarantined accounts] low: 0, high: 0, avg: 0, total: 0
       [Quarantined containers] low: 0, high: 0, avg: 0, total: 0
       =================================================================

       Finally if you also wish to track asynchronous pending's you will need to setup a cronjob to run the swift-recon-cron script periodically:

       */5 * * * * swift /usr/bin/swift-recon-cron /etc/swift/object-server.conf




DOCUMENTATION
       More documentation about OpenStack Swift can  be  found  at  https://docs.openstack.org/swift/latest/  Also  more  specific  documentation  about  swift-recon  can  be  found  at  https://docs.open‐
       stack.org/swift/latest/admin_guide.html


SEE ALSO
       object-server.conf(5),





Linux                                                                                             8/26/2011                                                                                    swift-recon(1)
