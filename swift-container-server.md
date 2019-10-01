swift-container-server(1)                                                                      OpenStack Swift                                                                      swift-container-server(1)



NAME
       swift-container-server - OpenStack Swift container server


SYNOPSIS
       swift-container-server [CONFIG] [-h|--help] [-v|--verbose]


DESCRIPTION
       The  Container  Server's primary job is to handle listings of objects. It doesn't know where those objects are, just what objects are in a specific container. The listings are stored as sqlite data‐
       base files, and replicated across the cluster similar to how objects are. Statistics are also tracked that include the total number of objects, and total storage usage for that container.


DOCUMENTATION
       More in depth documentation in regards to swift-container-server and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/ and https://docs.openstack.org


SEE ALSO
       container-server.conf(5)



Linux                                                                                             8/26/2011                                                                         swift-container-server(1)
