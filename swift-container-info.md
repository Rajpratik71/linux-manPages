swift-container-info(1)                                                                        OpenStack Swift                                                                        swift-container-info(1)



NAME
       swift-container-info - OpenStack Swift container-info tool


SYNOPSIS
       swift-container-info <container_db_file> [options]


DESCRIPTION
       This  is  a very simple swift tool that allows a swiftop engineer to retrieve information about a container that is located on the storage node.  One calls the tool with a given container db file as
       it is stored on the storage node system.  It will then return several information about that container such as;

       - Account it belongs to
       - Container
       - Created timestamp
       - Put timestamp
       - Delete timestamp
       - Object count
       - Bytes used
       - Reported put timestamp
       - Reported delete timestamp
       - Reported object count
       - Reported bytes used
       - Hash
       - ID
       - User metadata
       - X-Container-Sync-Point 1
       - X-Container-Sync-Point 2
       - Location on the ring


OPTIONS
       -h, --help
              Shows the help message and exit

       -d SWIFT_DIR, --swift-dir=SWIFT_DIR
              Pass location of swift configuration  file if different from the default location /etc/swift


DOCUMENTATION
       More documentation about OpenStack Swift can be found at https://docs.openstack.org/swift/latest/


SEE ALSO
       swift-get-nodes(1), swift-object-info(1)



Linux                                                                                             10/25/2016                                                                          swift-container-info(1)
