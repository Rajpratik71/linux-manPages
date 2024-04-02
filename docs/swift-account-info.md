swift-account-info(1)                                                                          OpenStack Swift                                                                          swift-account-info(1)



NAME
       swift-account-info - OpenStack Swift account-info tool


SYNOPSIS
       swift-account-info <account_db_file> [options]


DESCRIPTION
       This  is a very simple swift tool that allows a swiftop engineer to retrieve information about an account that is located on the storage node. One calls the tool with a given db file as it is stored
       on the storage node system.  It will then return several information about that account such as;

       - Account
       - Account hash
       - Created timestamp
       - Put timestamp
       - Delete timestamp
       - Container Count
       - Object count
       - Bytes used
       - Chexor
       - ID
       - User Metadata
       - Ring Location


OPTIONS
       -h, --help
              Shows the help message and exit

       -d SWIFT_DIR, --swift-dir=SWIFT_DIR
              Pass location of swift configuration file if different from the default location /etc/swift


DOCUMENTATION
       More documentation about OpenStack Swift can be found at https://docs.openstack.org/swift/latest/


SEE ALSO
       swift-container-info(1), swift-get-nodes(1), swift-object-info(1)



Linux                                                                                             10/25/2016                                                                            swift-account-info(1)
