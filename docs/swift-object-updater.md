swift-object-updater(1)                                                                        OpenStack Swift                                                                        swift-object-updater(1)



NAME
       swift-object-updater - OpenStack Swift object updater


SYNOPSIS
       swift-object-updater [CONFIG] [-h|--help] [-v|--verbose] [-o|--once]


DESCRIPTION
       The object updater is responsible for updating object information in container listings.  It will check to see if there are any locally queued updates on the filesystem of each devices, what is also
       known as async pending file(s), walk each one and update the container listing.

       For example, suppose a container server is under load and a new object is put into the system. The object will be immediately available for reads as soon as the proxy server responds to  the  client
       with  success.  However,  the object server has not been able to update the object listing in the container server.  Therefore, the update would be queued locally for a later update. Container list‐
       ings, therefore, may not immediately contain the object. This is where an eventual consistency window will most likely come in to play.

       In practice, the consistency window is only as large as the frequency at which the updater runs and may not even be noticed as the proxy server will route listing requests  to  the  first  container
       server which responds. The server under load may not be the one that serves subsequent listing requests – one of the other two replicas may handle the listing.

       The options are as follows:

           -v
           --verbose
               log to console
           -o
           --once
               only run one pass of daemon



DOCUMENTATION
       More in depth documentation in regards to swift-object-updater and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/



SEE ALSO
       object-server.conf(5)



Linux                                                                                             8/26/2011                                                                           swift-object-updater(1)
