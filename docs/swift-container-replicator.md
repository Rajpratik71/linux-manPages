swift-container-replicator(1)                                                                  OpenStack Swift                                                                  swift-container-replicator(1)



NAME
       swift-container-replicator - OpenStack Swift container replicator


SYNOPSIS
       swift-container-replicator [CONFIG] [-h|--help] [-v|--verbose] [-o|--once]


DESCRIPTION
       Replication  is  designed to keep the system in a consistent state in the face of temporary error conditions like network outages or drive failures. The replication processes compare local data with
       each remote copy to ensure they all contain the latest version. Container replication uses a combination of hashes and shared high water marks to quickly compare subsections of each partition.

       Replication updates are push based. Container replication push missing records over HTTP or rsync whole database files. The replicator also ensures that data is removed from the system. When an con‐
       tainer item is deleted a tombstone is set as the latest version of the item. The replicator will see the tombstone and ensure that the item is removed from the entire system.

       The options are as follows:

           -v
           --verbose
               log to console
           -o
           --once
               only run one pass of daemon



DOCUMENTATION
       More in depth documentation in regards to swift-container-replicator and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/



SEE ALSO
       container-server.conf(5)



Linux                                                                                             8/26/2011                                                                     swift-container-replicator(1)
