wbemexec(1)                                                                                                                                                                                       wbemexec(1)



NAME
       wbemexec - submit a CIM operation request to a CIM Server

SYNOPSIS
       wbemexec [ -h hostname ] [ -p portnumber ] [ -v httpversion ]
                [ -m httpmethod ] [ -t timeout ] [ -u username ]
                [ -w password ] [ -s ] [ --help ] [ --version ]
                [ inputfilepath ]

DESCRIPTION
       The wbemexec command provides a command line interface to a CIM Server.  The input to the command consists of a CIM request encoded in XML.  The request is submitted to the CIM Server for execution.
       If the HTTP response from the CIM Server contains a status code of 200 (OK), the result returned to stdout is the CIM response encoded in XML.  Otherwise, the result returned to stdout is  the  HTTP
       response.   Some  types  of  invalid  XML  requests  (e.g. missing PROTOCOLVERSION attribute or missing NAME attribute) are detected by wbemexec, and result in an error message from wbemexec.  Other
       invalid XML requests (e.g. invalid CIMVERSION attribute value or missing XML version), are detected by the CIM Server, and result in an HTTP response, containing a non-Success status code,  such  as
       501 (Not Implemented) or 400 (Bad Request).

       By default, the request is sent as an HTTP/1.1 request, using the HTTP M-POST method, and wbemexec waits 20000 milliseconds (20 seconds), then times out if a response hasn't been received.  Input is
       read from stdin, if no input file is specified.

       By default, the operation is executed on the local host.  wbemexec first attempts to connect to the CIM Server on the default port for the wbem-http service, and if that fails,  another  attempt  is
       made on the default port for the wbem-https service.

   Options
       wbemexec recognizes the following options:

              -h hostname    Connect to the CIM Server on the specified host.  If this option is not specified, wbemexec connects to the local host.

              --help         Display command usage information.

              -m httpmethod  Use the specified HTTP method for the request.  The method must be "POST" or "M-POST".

              -p portnumber  Connect  to  the CIM Server on the specified port number.  If this option is not specified, wbemexec connects to the default port for the wbem-http service, or if the -s option
                             is specified, to the default port for the wbem-https service.

              -s             Enable the use of the SSL protocol between and the CIM server.  The -s option should be specified if the CIM Server on the specified hostname/portnumber expects clients to con‐
                             nect using HTTPS.

              -t timeout     Wait the specified number of milliseconds on sending a request, before timing out if no response has been received.  The timeout value must be an integer value greater than 0.

              -u username    Connect  as  the  specified  R  username .  If username is not specified, the current logged in user is used for authentication.  This option is ignored if neither hostname nor
                             portnumber is specified.

              -v httpversion Use the specified HTTP version for the request.  The version must be "1.0" or "1.1".  The 1.0 version may not be specified if the M-POST method is specified.

              --version      Display CIM Server version.

              -w password    Authenticate the connection using the specified password .  This option is ignored if neither hostname nor portnumber is specified.  WARNING: A password should not be specified
                             on  the command line on a multi-user system, since command-line options are typically world-readable for a short window of time.  If the remote host requests authentication and
                             this option is not specified, wbemexec will prompt for the password.  (See cimconfig (1) for information on configuring the CIM Server.)


EXIT STATUS
       When an error occurs, an explanatory error message is written to stderr and an appropriate value is returned.  The following exit values are returned:

              0      Success
              1      Error

USAGE NOTE
       The wbemexec command requires that the CIM Server is running.

EXAMPLES
       Submit an XML request contained in the file cimrequest.xml to the CIM Server running on the local host on the default port:

              wbemexec cimrequest.xml

       Submit an XML request contained in the file cimrequest.xml to the CIM Server running on the host hpserver on port 49152, using the username guest and password guest for authentication:

              wbemexec -h hpserver -p 49152 -u guest -w guest cimrequest.xml

SEE ALSO
       cimserver(1), cimconfig(1).

STANDARDS CONFORMANCE
       wbemexec: CIM Operations over HTTP 1.0, Representation of CIM in XML 2.0



                                                                                                                                                                                                  wbemexec(1)
