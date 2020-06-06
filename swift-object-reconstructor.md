SWIFT-OBJECT-RECONSTRUCTOR(1)                                                              General Commands Manual                                                              SWIFT-OBJECT-RECONSTRUCTOR(1)



NAME
       swift-object-reconstructor - OpenStack Swift EC object reconstructor


SYNOPSIS
       swift-object-reconstructor CONFIG [options]


DESCRIPTION
       Daemon  for reconstruction of EC objects. Once a pair of nodes has determined the need to replace a missing object fragment, instead of pushing over a copy like replication would do, the reconstruc‐
       tor has to read in enough surviving fragments from other nodes and perform a local reconstruction before it has the correct data to push to the other node.


OPTIONS
       -h, --help
              Show this help message and exit

       -d DEVICES, --devices=DEVICES
              Reconstruct only given devices. Comma-separated list. Only has effect if --once is used.

       -p PARTITIONS, --partitions=PARTITIONS
              Reconstruct only given partitions. Comma-separated list. Only has effect if --once is used.

       -v, --verbose
              Log to console

       -o, --once
              Only run one pass of daemon

DOCUMENTATION
       More in depth documentation in regards to swift-object-reconstructor and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/ and https://docs.openstack.org



OpenStack Swift                                                                                  August 2016                                                                    SWIFT-OBJECT-RECONSTRUCTOR(1)
