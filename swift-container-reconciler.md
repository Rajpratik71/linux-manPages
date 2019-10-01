SWIFT-CONTAINER-RECONCILER(1)                                                              General Commands Manual                                                              SWIFT-CONTAINER-RECONCILER(1)



NAME
       swift-container-reconciler - OpenStack Swift container reconciler


SYNOPSIS
       swift-container-reconciler CONFIG [options]


DESCRIPTION
       This  daemon  will  take  objects  that are in the wrong storage policy and move them to the right ones, or delete requests that went to the wrong storage policy and apply them to the right ones. It
       operates on a queue similar to the object-expirer's queue.

       Discovering that the object is in the wrong policy is done in the container replicator; the container reconciler is the daemon that handles them once they happen.

       Like the object expirer, you only need to run one of these per cluster


OPTIONS
       -h, --help
              Show this help message and exit

       -v, --verbose
              Log to console

       -o, --once
              Only run one pass of daemon

DOCUMENTATION
       More in depth documentation in regards to swift-container-reconciler and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/ and https://docs.openstack.org



OpenStack Swift                                                                                  August 2016                                                                    SWIFT-CONTAINER-RECONCILER(1)
