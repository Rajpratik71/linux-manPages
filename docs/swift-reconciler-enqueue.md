SWIFT-RECONCILER-ENQUEUE(1)                                                                General Commands Manual                                                                SWIFT-RECONCILER-ENQUEUE(1)



NAME
       swift-reconciler-enqueue - OpenStack Swift reconciler enqueue

SYNOPSIS
       swift-reconciler-enqueue policy_index /a/c/o timestamp [options]


DESCRIPTION
       This script enqueues an object to be evaluated by the reconciler.


OPTIONS
       policy_index
              The policy the object is currently stored in.

       /a/c/o The full path of the object - UTF-8

       timestamp
              The timestamp of the datafile/tombstone.


       -h, --help
              Show this help message and exit

       -X OP, --op=OP
              The method of the misplaced operation

       -f, --force
              Force an object to be re-enqueued

DOCUMENTATION
       More in depth documentation in regards to swift-reconciler-enqueue and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/ and https://docs.openstack.org



OpenStack Swift                                                                                  August 2016                                                                      SWIFT-RECONCILER-ENQUEUE(1)
