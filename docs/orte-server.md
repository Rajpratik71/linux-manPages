OMPI-SERVER(1)                                                       Open MPI                                                       OMPI-SERVER(1)

NAME
       ompi-server - Server for supporting name publish/lookup operations.

SYNOPSIS
       ompi-server [ options ]

Options
       ompi-server  acts  as  a  data  server for Open MPI jobs to exchange contact information in support of MPI-2's Publish_name and Lookup_name
       functions.

       -h | --help
                 Display help for this command

       -d | --debug
                 Enable verbose output for debugging

       -r | --report-uri <value>
                 Report the Open MPI contact information for the server. This information is required for MPI jobs to use the data  server.  Three
                 parameter  values are supported: (a) '-', indicating that the uri is to be printed to stdout; (b) '+', indicating that the uri is
                 to be printed to stderr; and (c) "file:path-to-file", indicating that the uri is to be printed to the specified file. The  "path-
                 to-file" can be either absolute or relative, but must be in a location where the user has write permissions. Please note that the
                 resulting file must be read-accessible to expected users of the server.

DESCRIPTION
       ompi-server acts as a data server for Open MPI jobs to exchange contact information in support  of  MPI-2's  Publish_name  and  Lookup_name
       functions.

SEE ALSO
1.10.2                                                             Jan 21, 2016                                                     OMPI-SERVER(1)
