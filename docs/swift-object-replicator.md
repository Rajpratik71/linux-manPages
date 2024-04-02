swift-object-replicator(1)                                                                     OpenStack Swift                                                                     swift-object-replicator(1)



NAME
       swift-object-replicator - OpenStack Swift object replicator


SYNOPSIS
       swift-object-replicator [CONFIG] [-h|--help] [-v|--verbose] [-o|--once]


DESCRIPTION
       Replication  is  designed to keep the system in a consistent state in the face of temporary error conditions like network outages or drive failures. The replication processes compare local data with
       each remote copy to ensure they all contain the latest version. Object replication uses a hash list to quickly compare subsections of each partition.

       Replication updates are push based. For object replication, updating is just a matter of rsyncing files to the peer. The replicator also ensures that data is removed from the system. When an  object
       item is deleted a tombstone is set as the latest version of the item. The replicator will see the tombstone and ensure that the item is removed from the entire system.


OPTIONS
       -h, --help
              Show this help message and exit

       -d DEVICES, --devices=DEVICES
              Replicate only given devices. Comma-separated list. Only has effect if --once is used.

       -p PARTITIONS, --partitions=PARTITIONS
              Replicate only given partitions. Comma-separated list. Only has effect if --once is used.

       -i POLICIES, --policies=POLICIES
              Replicate only given policy indices. Comma-separated list. Only has effect if --once is used.

       -v, --verbose
              Log to console

       -o, --once
              Only run one pass of daemon

DOCUMENTATION
       More in depth documentation in regards to swift-object-replicator and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/



SEE ALSO
       object-server.conf(5)



Linux                                                                                             8/26/2011                                                                        swift-object-replicator(1)
