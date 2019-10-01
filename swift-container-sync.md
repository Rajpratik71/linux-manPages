swift-container-sync(1)                                                                        OpenStack Swift                                                                        swift-container-sync(1)



NAME
       swift-container-sync - OpenStack Swift container sync


SYNOPSIS
       swift-container-sync [CONFIG] [-h|--help] [-v|--verbose] [-o|--once]


DESCRIPTION
       Swift  has  a  feature  where all the contents of a container can be mirrored to another container through background synchronization. Swift cluster operators configure their cluster to allow/accept
       sync requests to/from other clusters, and the user specifies where to sync their container to along with a secret synchronization key.

       The swift-container-sync does the job of sending updates to the remote container.  This is done by scanning the local devices for container databases and checking for x-container-sync-to and  x-con‐
       tainer-sync-key metadata values. If they exist, newer rows since the last sync will trigger PUTs or DELETEs to the other container.


DOCUMENTATION
       More  in  depth  documentation  in  regards to swift-container-sync and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/overview_container_sync.html and
       https://docs.openstack.org


SEE ALSO
       container-server.conf(5)



Linux                                                                                             8/26/2011                                                                           swift-container-sync(1)
