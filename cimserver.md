cimserver(8)                                                                               System Manager's Manual                                                                               cimserver(8)



NAME
       cimserver - start or stop the CIM Server; display the version number or running status of the CIM Server

SYNOPSIS
       cimserver [configProperty=value] ...

       cimserver -s [ shutdownTimeout = value ]

       cimserver -v

       cimserver -h

       cimserver --help

       cimserver --version

       cimserver --status

   Remarks
       This command can only be executed by a privileged user.

DESCRIPTION
       The cimserver command provides a command line interface to stop and start the CIM Server, as well as to display the version number or running status of the CIM Server.

       After  installation,  the  CIM Server must be started using the cimserver command.  If the system is rebooted, the CIM Server will automatically restart, with the exception of the case where the CIM
       Server was shutdown prior to the reboot. Generally, once the CIM Server is started, it is expected to be always running and ready to serve CIM requests.  However, if the CIM Server must  be  stopped
       and restarted, the cimserver command can be used to shutdown the CIM Server gracefully and restart it at a later time.

   Starting the CIM Server
       Issuing the cimserver command without any options starts the CIM Server process.

       When  starting  the  CIM  Server using the cimserver command, the <configProperty=value> syntax can be used to set the configuration properties to be used by the CIM Server.  It is important to know
       that the values specified in the cimserver command apply only to the current CIM Server process that gets started.  The default values for the configuration properties do not change.  For a list  of
       the CIM Server configuration properties, see the man page for the cimconfig command.

   Shutting down the CIM Server
       Issuing the cimserver command with the -s option stops the CIM Server.  Optionally, a timeout value can be specified by setting the shutdownTimeout configuration property.

       Under  normal  operation,  CIM Server should be able to be shutdown fairly quickly without problem.  There are, however, situations that may prevent CIM Server from shutting down within a reasonable
       amount of time.  For example, a provider that is not responding to requests, or a provider that is servicing a long-running CIM request.  To handle such situations and to ensure that the CIM  Server
       can be shutdown without having the user wait a long period of time (or indefinitely), a shutdown timeout value is used.

       The  shutdown  timeout value is the maximum amount of time (in seconds) the user is willing to wait for the CIM Server to complete all the outstanding CIM operation requests before shutting down the
       CIM Server.  If the specified shutdown timeout period expires, the CIM Server will be shutdown even if there are CIM operations in progress.  The shutdown timeout value is a CIM Server configuration
       property (shutdownTimeout ) that can be changed using the command.  The default shutdown timeout value is 10 seconds.

       A  timeout  value (in seconds) can be specified in the cimserver command to shutdown the CIM Server using the =value> syntax.  This overrides the default shutdown timeout value.  The minimum timeout
       value is 2 seconds.

       While CIM Server is shutting down, a client connection request will result in a connection error (the same as if the CIM Server were not running).  For clients who have already established a connec‐
       tion to the CIM Server, new CIM requests will be rejected with a CIM error indicating that the CIM Server is shutting down.

       When a client receives a response containing a CIM error indicating that the CIM Server is shutting down, it should close the connection and reconnect to CIM Server at a later time.

   Options
       The cimserver command recognizes the following options:

              -v, --version  Display the version number or running status of the CIM Server.

              -h, --help     Display the command usage.

              --status       Display the running status of the CIM Server.

              -s             Stop the CIM Server.

              Specify the timeout value for shutting down the CIM Server.
                             This  can  only  be  used  in conjunction with the -s option.  The minimum timeout value is 2 seconds.  If this is not specified, the default configurable timeout value will be
                             used.

              configProperty=value
                             Set the value for the specified configuration property to be used in starting the CIM Server.

EXIT STATUS
       The cimserver command returns one of the following values:

              0      Success
              1      Error

       The cimserver --status command returns one of the following values:

              0      The CIM Server is running
              1      Error
              2      The CIM Server is not running

       When an error occurs, an error message is written to stderr and an error value of 1 is returned.

DIAGNOSTICS
       unable to connect to CIM Server.  CIM Server may not be running.

              The cimserver command was issued to stop the CIM Server when CIM Server was not running.  An exit status value of 1 is returned.

       Error: Bind failed: Failed to bind socket.

              The cimserver command was issued to start the CIM Server and the CIM Server was already running.  An exit status value of 1 is returned.

EXAMPLES
       Stop the CIM Server with the default timeout value of 10 seconds.

              cimserver -s

       Stop the CIM Server with a timeout value of 5 seconds.

              cimserver -s shutdownTimeout=5

       Start the CIM Server.

              cimserver

       Start the CIM Server with the configuration property enableNamespaceAuthorization set to true.

              cimserver enableNamespaceAuthorization=true

       Display the version number of the CIM Server.  This version number is used to identify the release version of the CIM Server in the OpenPegasus release.

              cimserver -v

       Display the command usage.

              cimserver -h

SEE ALSO
       cimconfig(8).



                                                                                                                                                                                                 cimserver(8)
