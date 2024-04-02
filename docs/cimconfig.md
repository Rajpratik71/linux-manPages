cimconfig(8)                                                                                                                                                                                     cimconfig(8)



NAME
       cimconfig - get, set, unset, or list CIM Server configuration properties

SYNOPSIS
       cimconfig -g name [ -c ] [ -d ] [ -p ]

       cimconfig -s name=value [ -c ] [ -p ]

       cimconfig -u name [ -c ] [ -p ]

       cimconfig -l [ -c | -p ]

       cimconfig -h

       cimconfig --help

       cimconfig --H name | "All"

       cimconfig --version


DESCRIPTION
       The  cimconfig  command  manages CIM Server configuration properties. The operations are executed on the local host by submitting requests to the CIM Server.  An operation on a current configuration
       property takes effect immediately, and an operation on a planned configuration property takes effect the next time the CIM Server is started with cimserver (8) .  Modifications  to  a  configuration
       property via cimconfig remain in effect until changed via another cimconfig command.  Configuration properties may also be modified temporarily via the cimserver (8) command, in which case, the mod‐
       ification of the configuration property remains in effect for that execution of the cimserver (8) command only. A default value is associated with each configuration  property.   Each  configuration
       property  is  initially  assigned its default value, until modified by a cimconfig command or cimserver (8) command.  Dynamic configuration properties are those whose current values may be set while
       the CIM server is running.

       The following configuration properties are available:

       authorizedUserGroups

              Description: If set, the value is interpreted as a list of comma-separated user groups whose members may issue CIM requests.  A user who is not a member of any of these groups  is  restricted
              from  issuing CIM requests, with the exception of privileged users (superuser). If unset, any user may issue CIM requests. Note: This configuration property operates in conjunction with other
              CIM request authorization conditions rather than overriding them.
              Default Value: (None)
              Dynamic: No

       enableAssociationTraversal

              Description: If True, the CIM Server will support the four association traversal operators: Associators, AssociatorNames, References, and ReferenceNames.
              Default Value: True
              Dynamic: No

       enableAuditLog

              Description: If True, audit log entries for certain types of CIM Server activities will be written to the system log.  Examples of  audited  activities  include  a  CIM  Server  configuration
              change, a Provider registration change, an authentication attempt and a modification to the CIM Schema or a CIM Instance.  An audit log entry describes the who, what, and when associated with
              an audited activity.
              Default Value: False
              Dynamic: Yes

       enableIndicationService

              Description: If True, the CIM Server will support CIM Indications.
              Default Value: True
              Dynamic: No

       enableHttpConnection

              Description: If True, allows connections to the CIM Server using the HTTP protocol
              Default Value: False
              Dynamic: No

       enableHttpsConnection

              Description: If True, allows connections to the CIM Server using the HTTPS protocol (HTTP using Secure Socket Layer encryption)
              Default Value: True
              Dynamic: No

       enableNamespaceAuthorization

              Description: If True, the CIM Server restricts access to namespaces based on configured user authorizations [user authorizations may be configured using cimauth (8) ]
              Default Value: False
              Dynamic: No

       enableRemotePrivilegedUserAccess

              Description: If True, the CIM Server allows access by a privileged user from a remote system. Many management operations require privileged user access. Disabling remote access by  privileged
              user could significantly affect functionality
              Default Value: True
              Dynamic: No

       enableSubscriptionsForNonprivilegedUsers

              Description:  If  True,  nonprivileged  user  of the system will be allowed to manipulate indication subscriptions, indication filters, and listener destination instances otherwise privileged
              access is required.
              Default Value: True
              Dynamic: No

       forceProviderProcesses

              Description: If true, the CIM Server runs Providers in separate processes rather than loading and calling Provider libraries directly within the CIM Server process.
              Default Value: True
              Dynamic: No

       hostname

              Description: Can be used to override the local system supplied hostname (without domain) the CIM Server uses to build objects.  If not set, querying this configuration option will report  the
              system  supplied hostname and behavior is not changed.  Setting this value to a valid hostname on CIM Server startup or as planned value will force the server to assume the configured name as
              the local hosts name. Setting this allows the administrator to set the name that operations such as associator, reference etc. return with object paths.  When setting this option, fullyQuali‐
              fiedHostName should be set also.

              In common setups it is not recommended to explicitly set this value.  Some scenarios scenarios in which changing the default value makes sense include:

              -  The case where what the CIM Server shall return to clients for host name is NOT the name of the current host but some administrator defined name (ex. system behind a firewall or some redi‐
              rector).

              - Embedded systems that have a system set hostname which is not valid and needs to be overridden by CIM administrator without changing the actual IP configuration.
              Default Value: (blank)
              Dynamic: No

       fullyQualifiedHostName

              Description: Can be used to override the local system supplied fully qualified hostname (with domain) the CIM Server is using to build objects.  If not set, querying this configuration option
              will  report  the system supplied fully qualified hostname and behavior is not changed.  Setting this value to a valid hostname on CIM Server startup or as planned value will force the server
              to assume the configured name as the local hosts name with domain. Setting this allows the administrator to set the name that indication operations and the CIM_ObjectManager assume  for  Sys‐
              temName returned as instance and key properties.

              In common setups it is not recommended to explicitly set this value.  Some scenarios scenarios in which changing the default value makes sense include:

              -  The case where what the CIM Server shall return to clients for host name is NOT the name of the current host but some administrator defined name (ex. system behind a firewall or some redi‐
              rector).

              - Embedded systems that have a system set hostname which is not valid and needs to be overridden by CIM administrator without changing the actual IP configuration.
              Default Value: (blank)
              Dynamic: No

       idleConnectionTimeout

              Description: If set to a positive integer, this value specifies a minimum timeout value for idle client connections.  If set to zero, idle client connections do not time out.

              A client connection is considered idle when it is not in the process of sending a request and the CIM Server is not processing a request from that  connection.   An  idle  connection  timeout
              allows  reclamation  of  the  system  resources allocated for idle CIM Server connections.  Note that the CIM Server may allow an idle connection to persist longer than the configured timeout
              value based on server activity.

              Some client applications may not behave correctly if a connection timeout is introduced.  Client compatibility should be considered when configuring an idle  connection  timeout  value.   The
              idle connection time is computed using the system clock.  Thus, resetting the system clock may cause unexpected timeout behavior.
              Default Value: 0
              Dynamic: No

       listenAddress

              Description:  Network  interfaces,  if  specified, cimserver(8) should listen to for connection requests. It accepts a comma seperated list(without space) of network interfaces. Both ipv4 and
              ipv6 addresses is accepted. Default value of "All" make cimserver to listen to all the available network interfaces. Examples include:
              -listenAddress=All
              -listenAddress=121.12.33.112
              -listenAddress=121.33.21.26,127.0.0.1,fe80::fe62:9346%eth0
              Default Value: All
              Dynamic: No


       maxFailedProviderModuleRestarts

              Description: If set to a positive integer, this value specifies the number of times a failed provider module with indications  enabled  are  restarted  automatically  before  being  moved  to
              Degraded state. If set to zero, failed provider module is not restarted with indications enabled automatically and will be moved to Degraded state immediately.

              This  option  controls  the automatic re-enabling of the failed provider module with indications enabled. If the provider module with indications enabled fails very frequently, it affects the
              CIMServer normal operations because CIMServer would be busy reloading the provider module every time it fails. This option would be helpful if a long running indication provider  crashes  and
              the management application wants to receive the indications from the provider while provider fix is being delivered.

              In case of provider module grouping, if one of the indication provider crashes, it affects all indication providers in the provider modules of the group.

              Note that this is the facility provided by the CIMServer for temporary recovery of the provider and the ultimate goal SHALL be to fix the faulty provider.
              Default Value: 3
              Dynamic: Yes

       maxIndicationDeliveryRetryAttempts

              Description:If set to a positive integer, value defines the number of times indication service will enable the reliableIndication feature and try to deliver an indication to a particular lis‐
              tener destination.This does not effect the original delivery attempt. A value of 0 disables reliable indication feature completely, and cimserver will deliver the indication once.

              This value is used to set the CIM_IndicationService.DeliveryRetryAttempts property. See CIM_IndicationService.DeliveryRetryAttempts property for more details.
              Default Value: 3
              Dynamic: No

       minIndicationDeliveryRetryInterval

              Description:If set to a positive integer, this value defines the minimal time interval in seconds for the indication service to wait before retrying to deliver an  indication  to  a  listener
              destination that previously failed. Cimserver may take longer due to QoS or other processing.

              This value is used to initialize the property CIM_IndicationService.DeliveryRetryInterval. See CIM_IndicationService.DeliveryRetryInterval property for more details.
              Default Value: 30
              Dynamic: No

       shutdownTimeout

              Description:  When  a cimserver -s shutdown command is issued, specifies the maximum time in seconds for the CIM Server to complete outstanding CIM operation requests before shutting down; if
              the specified timeout period expires, the CIM Server will shut down, even if there are still CIM operations in progress.  Minimum value is 2 seconds.
              Default Value: 30
              Dynamic: Yes

       slpProviderStartupTimeout

              Description: Timeout value in milli seconds used to specify how long the registration with an SLP SA may take. Registration will be retried three times.

              This value only needs to be increased in case that the loading of a set of providers whose implementation of a registered profile takes very long.
              Default Value: 300000
              Dynamic: No

       socketWriteTimeout

              Description: Specifies the number of seconds the CIM Server will wait for a client connection to be ready to receive data.  If the CIM Server is unable to write to a connection in this  time,
              the connection is closed.

              A  client connection can become unable to receive data if the client fails to read the data that has already been sent.  This timeout allows the CIM Server to reclaim resources that are allo‐
              cated to a malfunctioning client.

              One might consider increasing this timeout value if the CIM Server prematurely closes connections with well-behaved clients.
              Default Value: 20
              Dynamic: Yes

       sslClientVerificationMode

              Description: Defines the desired level of support for certificate-based authentication. It can be set to required, optional or disabled.  If set to required, the CIM Server will  require  all
              clients  connecting  over HTTPS to authenticate using a certificate.  If the client certificate is not sent or not trusted the connection will be rejected.  If set to optional, the CIM Server
              will allow, but not require, HTTPS clients to authenticate using a certificate. If the client does not send a certificate, the CIM Server will attempt to authenticate the  client  using  HTTP
              basic  authentication.   If  set  to  disabled,  the  CIM  Server will not allow HTTPS clients to authenticate using a certificate. Basic authentication will be used to authenticate all HTTPS
              clients. This property is only used if enableHttpsConnection is true.
              Default Value: disabled
              Dynamic: No

       traceFileSizeKBytes

              Description:Defines the size of the tracefile in Kilo bytes.  The trace file will be rolled once its size exceeds the specified size."
              Default Value: 1048576
              Dynamic: Yes

       numberOfTraceFiles

              Description:Specifies the number of the tracefiles for rolling.
              Default Value: 3
              Dynamic: Yes

       sslCipherSuite

              Description: String containing OpenSSL cipher specifications to configure the cipher suite the client is permitted to negotiate with the server during  the  SSL  handshake  phase.  The  value
              should be mentioned between single quotes since it can contain special characters like .+, !, -.
              Default Value: DEFAULT (The default cipher list of OpenSSL)
              Dynamic: No

       sslBackwardCompatibility

              Description:This setting specifies whether the ssl supports SSLv3.  Ideally for security Compilance purposes it is by default set to false.
              Default Value: false
              Dynamic: No

       webRoot

              Description:Points to a location where the static web pages to be served by the pegasus webserver are stored.
              Default Value: /var/tog-pegasus/www
              Dynamic: No

       indexFile

              Description:Specifies the name of index file used by pegasus webserver, default to index.html, This file should be available at the webRoot path.
              Default Value: index.html
              Dynamic: No

       mimeTypesFile

              Description: Refers to the file which holds the mime types being served by the pegasus webserver.
              Default Value: /var/tog-pegasus/www/mimeTypes.txt
              Dynamic: No

       httpSessionTimeout

              Description:  If  set  to  a  positive  integer,  this value specifies a HTTP session lifetime in seconds. After initial authentication using standard HTTP mechanisms (HTTP Basic or Negotiate
              authentication), the server generates a cookie and sends it back to the client, as described in RFC 6265. The client can then use the cookie in subsequent requests  to  skip  the  usual  HTTP
              authentication.  The  cookie  is valid only for period of time specified by this configuration option.  If set to zero, session management is turned off and CIM server will not issue cookies.
              This option is available only when Pegasus was compiled with PEGASUS_ENABLE_SESSION_COOKIES set to 'true'.
              Default Value: 0
              Dynamic: Yes

       If both the enableHttpsConnection and enableHttpConnection properties are set to False , neither HTTP nor HTTPS connections will be allowed. On some platforms, the OpenPegasus CIM  Server  has  been
       enhanced  to include support for a local (single system), non-standard protocol. This allows the OpenPegasus CIM Server to continue to receive and process requests from local OpenPegasus CIM Clients
       even if both HTTP ports are disabled. If a local protocol is not supported, the CIM Server will be shut down and  disabled  from  automatically  being re-started.

       The current and planned values of the configuration properties are stored in the files /var/opt/tog-pegasus/cimserver_current.conf  and  /var/opt/tog-pegasus/cimserver_planned.conf  ,  respectively.
       The configuration properties may only be modified via the cimconfig and cimserver (8) commands; the files must not be edited directly.

   Options
       The cimconfig command recognizes the following options:

              -g configuration_property
                             Gets the specified value (current, planned and/or default) of the specified configuration property.  By default, gets the current value.

              -s configuration_property = value
                             Sets the specified value (current and/or planned) of the specified configuration property to R value .  By default, sets the current value.

              -u configuration_property
                             Unsets  the  specified  value  (current  and/or  planned) of the specified configuration property, and resets it to its default value.  By default, unsets the current value and
                             resets it to its default value.

              -l             Lists all the specified (current or planned) configuration property name and value pairs in the CIM Server.  By default, lists only the names of all the  current  configuration
                             properties.

              -c             Specifies that the operation (get, set, unset, or list) be performed on the current configuration properties.  For set or unset operations, returns an error when the CIM Server
                             is not running or the specified property is not a dynamic property.

              -p             Specifies that the operation (get, set, unset, or list) be performed on the planned configuration properties.  For set and unset operations, operates on the value of the speci‐
                             fied property in the planned configuration file if the CIM Server is not running.

              -d             Specifies that the get operation be performed on the default configuration properties.  Returns an error when the CIM Server is not running.

              -h, --help     Display the command usage message.

              -H name|"All"  Display detailed help information on the configuraton property defined by the name parameter or on all properties if the keyword "All" is used.

EXIT STATUS
       When an error occurs, an error message is written to stderr and an error value of 1 is returned. The following return values are returned:

              0      Successful completion
              1      Error

EXAMPLES
       Get the current value for the configuration property shutdownTimeout .

              cimconfig -g shutdownTimeout -c

       Get the planned value for the configuration property shutdownTimeout .

              cimconfig -g shutdownTimeout -p

       Get the default value for the configuration property shutdownTimeout .

              cimconfig -g shutdownTimeout -d

       Set the current value of the property shutdownTimeout to the new value 15.

              cimconfig -s shutdownTimeout=15 -c

       Set the planned value of the property shutdownTimeout , to the new value 5.

              cimconfig -s shutdownTimeout=5 -p

       Reset the current value of the property shutdownTimeout to its default value.

              cimconfig -u shutdownTimeout -c

       Reset the planned value of the property shutdownTimeout to its default value.

              cimconfig -u shutdownTimeout -p

       List all the current configuration property names.

              cimconfig -l

       List all the current configuration property names and their values.

              cimconfig -l -c

       List all the planned configuration property names and their values.

              cimconfig -l -p

FILES
       /var/opt/tog-pegasus/cimserver_current.conf
                                     Current configuration
       /var/opt/tog-pegasus/cimserver_planned.conf
                                     Planned configuration

SEE ALSO
       cimserver (8), cimauth (8).



                                                                                                                                                                                                 cimconfig(8)
