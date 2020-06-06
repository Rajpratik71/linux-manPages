swift-object-server(1)                                                                         OpenStack Swift                                                                         swift-object-server(1)



NAME
       swift-object-server - OpenStack Swift object server.


SYNOPSIS
       swift-object-server [CONFIG] [-h|--help] [-v|--verbose]


DESCRIPTION
       The  Object Server is a very simple blob storage server that can store, retrieve and delete objects stored on local devices. Objects are stored as binary files on the filesystem with metadata stored
       in the file's extended attributes (xattrs).  This requires that the underlying filesystem choice for object servers support xattrs on files. Some filesystems, like ext3, have xattrs  turned  off  by
       default.   Each  object is stored using a path derived from the object name's hash and the operation's timestamp. Last write always wins, and ensures that the latest object version will be served. A
       deletion is also treated as a version of the file (a 0 byte file ending with ".ts", which stands for tombstone). This ensures that deleted files are replicated correctly  and  older  versions  don't
       magically reappear due to failure scenarios.


DOCUMENTATION
       More in depth documentation in regards to swift-object-server and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/ and https://docs.openstack.org



SEE ALSO
       object-server.conf(5)



Linux                                                                                             8/26/2011                                                                            swift-object-server(1)
