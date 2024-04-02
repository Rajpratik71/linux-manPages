swift-object-info(1)                                                                           OpenStack Swift                                                                           swift-object-info(1)



NAME
       swift-object-info - OpenStack Swift object-info tool


SYNOPSIS
       swift-object-info <object_file> [options]


DESCRIPTION
       This  is  a  very  simple  swift tool that allows a swiftop engineer to retrieve information about an object that is located on the storage node. One calls the tool with a given object file as it is
       stored on the storage node system.  It will then return several information about that object such as;

       - Account it belongs to
       - Container
       - Object hash
       - Content Type
       - timestamp
       - Etag
       - Content Length
       - User Metadata
       - Location on the ring


OPTIONS
       -h --help
              Shows the help message and exit

       -n, --no-check-etag
              Don't verify file contents against stored etag

       -d SWIFT_DIR, --swift-dir=SWIFT_DIR
              Pass location of swift configuration file if different from the default location /etc/swift

       -P POLICY_NAME, --policy-name=POLICY_NAME
              Specify storage policy name


DOCUMENTATION
       More documentation about OpenStack Swift can be found at https://docs.openstack.org/swift/latest/


SEE ALSO
       swift-account-info(1), swift-container-info(1), swift-get-nodes(1)



Linux                                                                                             10/25/2016                                                                             swift-object-info(1)
