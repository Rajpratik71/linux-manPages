RCOPY(1)                                                                                          librdmacm                                                                                          RCOPY(1)



NAME
       rcopy - simple file copy over RDMA.

SYNOPSIS
       rcopy source server[:destination] [-p port]
       rcopy [-p port]

DESCRIPTION
       Uses sockets over RDMA interface to copy a source file to the specified destination.

OPTIONS
       source The name and path of the source file to copy.

       server The name or address of the destination server.

       :destination
              An optional destination filename and path.  If not given, the destination filename will match that of the source.

       -p server_port
              The server's port number.


       NOTES  Basic usage is to start rcopy on a server system, then run rcopy sourcefile servername.  The server application will continue to run after copying the file, but is currently single-threaded.

       Because this test maps RDMA resources to userspace, users must ensure that they have available system resources and permissions.  See the libibverbs README file for additional details.

SEE ALSO
       rdma_cm(7)



librdmacm                                                                                         2011-12-2                                                                                          RCOPY(1)
