
sfcbd(1)                                                                                   General Commands Manual                                                                                   sfcbd(1)



NAME
       sfcbd - Small-Footprint CIM Broker (sfcb)

SYNOPSIS
       sfcbd [options]

DESCRIPTION
       sfcb  is a lightweight CIM daemon (aka CIMOM) that responds to CIM client requests for system management data and/or performs system management tasks. sfcb supports most of the standard CIM XML over
       http/https protocol.  It is highly modular, allowing functionality to be easily added, removed or customized for different management applications. sfcb is specifically targetted for small  embedded
       system  that  do not have the available CPU, memory or disk resources to support a full-blown enterprise-level CIMOM.  That said, sfcb runs very well on a regular Linux/Unix system and supports most
       of the functions required by CIM clients to manage such the system.  Supported CIM operations include:

              GetClass
              EnumerateClasses
              EnumerateClassNames
              GetInstance
              DeleteInstance
              CreateInstance
              ModifyInstance
              EnumerateInstances
              EnumerateInstanceNames
              InvokeMethod (MethodCall)
              ExecQuery
              Associators
              AssociatorNames
              References
              ReferenceNames

       CIM process and lifecycle indications (aka 'events') are also supported.

OPTIONS
       Supported command line options are:

       -c, --config-file=FILE
              Specify an alternative configuration file.  Default=/etc/sfcb/sfcb.cfg

       -d, --daemon
              Run sfcbd (and child processes) in the background.

       -h, --help
              Print help message and exit.

       -k, --color-trace
              -k, --color-trace Color the trace output of each process

       -s, --collect-stats
              Turn on runtime statistics collecting. If enabled then various sfcbd runtime statistics will be written to ./sfcbStat.  Default is no statistics are collected.

       -t, --trace-components=NUM
              Activate component-level tracing messages, where NUM is an OR-ed bitmask integer defining which component to trace.  Specifying "-t ?" will list all the components and their associated  inte-
              ger bitmask.

       -v, --version
              Prints version information and exits.

CONFIGURATION FILE
       sfcbd  reads the configuration file /etc/sfcb/sfcb.cfg (or the file specified with the -c option) at start up. The configuration file contains option : value pairs, one per line. For a complete list
       of options, see the default configuration file included with the sfcb package.

       httpPort
              Local port that sfcbd should listen to receive HTTP (i.e. insecure) requests from CIM clients. Default=5988

       enableHttp
              Whether sfcb should accept HTTP client connections. Default=true.

       httpProcs
              Maximum number of simultaneous HTTP client connections before blocking new incoming HTTP requests. Default=8

       httpsPort
              Local port that sfcbd should listen to receive HTTPS (i.e. secure) requests from CIM clients. Default=5989

       enableHttps
              Whether sfcb should accept HTTPS client connections. Default=false.

       httpsProcs
              Maximum number of simultaneous HTTPS client connections before blocking new incoming HTTPS requests. Default=8

       enableInterOp
              Whether sfcb should provide the interop namespace for indication support.  Default=true

       provProcs
              Maximum number of simultaneous provider processes. After this point if a new incoming request requires loading a new provider, then one of the existing providers will first  be  automatically
              unloaded. Default=32

       doBasicAuth
              Perform basic authentication on the client userid (obtained from the HTTP/HTTPS header) before allowing the request. Default=false (i.e. no client authentication performed).

       basicAuthLib
              Name of the local library to call to authenticate the client userid.  Default=sfcBasicAuthentication

       useChunking
              Tell sfcbd to use HTTP/HTTPS 'chunking' to return large volumes of response data to the client in 'chunks', rather than buffering the data and sending it back all at once. Default=true

       keepaliveTimeout
              Specify the maximum time in seconds an sfcb HTTP process will wait between two requests on one connection before terminating. Setting it to 0 will disable HTTP keep-alive. Default=0

       keepaliveMaxRequest
              Specify the maximum number of consecutive request on one connection.  Setting it to 0 will effectively disable HTTP keep-alive. Default=10

       registrationDir
              Specify the registration directory, which contains the provider registration data, the staging area and the static repository.  Default=/var/lib/sfcb/registration

       providerDirs
              A space separated list of directories where sfcb is looking for provider libraries. Default=/usr/lib64 /usr/lib64/cmpi

       providerSampleInterval
              The interval in seconds at which the provider manager is checking for idle providers. Default: 30

       providerTimeoutInterval
              The interval in seconds before an idle provider gets unloaded by the provider manager. Default: 60

       providerAutoGroup
              If set to true, all providers residing in the same shared library will be executed in the same process unless another group has been specified in the provider registration file. Default: true

       sslCertificateFilePath
              Specify the name of the file containing the server's certificate.  The file must be in PEM format. This file is only required if enableHttps is set to true. Default= /etc/sfcb/server.pem

       sslKeyFilePath
              Specify the name of the file containing the private key for the server's certificate. The file must be in PEM format and may not be passphrase-protected. This file is only required if enable-
              Https is set to true. Default=/etc/sfcb/file.pem

       sslClientTrustStore
              Specify the name of the file or directory containing either the CA certificate issuing client certificates or self-signed certificates of the  clients.   This  setting  is  only  required  if
              sslClientCertificate is set to accept or require.

              If a file, it must be in PEM format.

              If  a  directory,  it must be in "hash format": each file in the directory should be named hash.0, where hash is the output of openssl x509 -hash. See the -CApath option in verify(1) from the
              openssl package for more information about the hash format.

              Default=/etc/sfcb/client.pem

       sslClientCertificate
              Specify the way sfcb handles client certificate based authentication. If set to ignore it will not request a certificate from the client. If set to accept it will request a  certificate  from
              the client but not fail if the client doesn't present one. If set to require it will refuse the client connection if the client doesn't present a certificate. Default=ignore

       certificateAuthLib
              Name of the local library to call for client-certificate based user authentication. Called only if sslClientCertificate is not set to ignore. Default=sfcCertificateAuthentication

       traceLevel
              Specify the trace level for sfcb. Can be overriden by setting environment variable SFCB_TRACE_LEVEL. Default:0.

       traceMask
              Specify the trace mask for sfcb. Can be overriden by the command line option --trace-components. Default: 0.

       traceFile
              Specify the trace file for sfcb. Can be overriden by setting environment variable SFCB_TRACE_FILE. Default: stderr.

ENVIRONMENT
       SFCB_PAUSE_PROVIDER
              Specifies the name of the provider to pause after first being loaded to facilitate attaching a runtime debugger to the provider's process for debugging purposes.

       SFCB_PAUSE_CODEC
              Specifies the name of the sfcb codec (currently only "http") to pause after first being started to facilitate attaching a runtime debugger to the process.

       SFCB_TRACE
              Specifies  the  level  of  trace/debug messages for sfcb.  Valid values are 0 (no trace messages), or 1 (key trace messages only) to 4 (all messages). A default value of 1 will be assumed, if
              this variable is not set.
              [Note: SFCB_TRACE level is used in conjunction with sfcb's component-level tracing to control the level of detail of trace messages to display within each component]

       SFCB_TRACE_FILE
              By default sfcb trace messages are written to STDERR.  Setting this envorinment variable causes the trace messages to be written to a file instead.

       SFCB_TRAP
              If set this environment variable enables trap interrupts on x86 platforms to be generated by sfcb in special situations.
              [Note: not currently ever used]

       SFCB_LABELPROCS
              If set to a positive integer value, enable the process labeling feature.  This adds a description of each process' role to the process cmdline so that it appears in 'ps' output.  The  identi-
              fying info will be appended to the original arv data, following any passed arguments.  The number of bytes appended is limited by the value of SFCB_LABELPROCS.  A value of about 100 should be
              enough in most cases.  A smaller value may truncate the data, but this may be desired.  To disable, set the vaue to zero, or unset the env var.

       SBLIM_TRACE
              Specifies the level of trace/debug messages for SBLIM providers.  Valid values are 0 (no trace messages), or 1 (key trace messages only) to 4 (all messages).
              [Note: this only applies to SBLIM providers written with explicit trace messages in their source code.]

       SBLIM_TRACE_FILE
              By default SBLIM provider trace messages are written to STDERR.  Setting this envorinment variable causes the trace messages to be written to a file instead.

FILES
       /etc/sfcb/sfcb.cfg
              Default sfcb configuration file.

       /etc/sfcb/server.pem
              SSL server certificate for sfcb.

       /etc/sfcb/file.pem
              SSL private key file for sfcb.

       /etc/sfcb/client.pem
              SSL client certificate / trust store for sfcb.

LIBRARIES
       /usr/lib64/libsfc*
              Binaries for sfcb runtime libraries.

       /usr/lib64/cmpi/*
              Binaries for providers

AUTHOR
       Adrian Schuur <schuur@de.ibm.com>

CONRIBUTORS
       Dr. Gareth S. Bestor <bestor@us.ibm.com>,
       Viktor Mihajlovski <MIHAJLOV@de.ibm.com>,
       Chris Buccella <buccella@linux.vnet.ibm.com>

BUGS
       The SBLIM project maintains a mailing list to which you should direct all questions regarding sfcb, sfcc, wbemcli, or any of the SBLIM providers.  To subscribe to this mailing list visit

              http://lists.sourceforge.net/lists/listinfo/sblim-devel

       The SBLIM Project Bug tracking page can be found at

              http://sourceforge.net/tracker/?group_id=128809&atid=712784

COPYRIGHT
       (C) Copyright IBM Corp. 2004, 2005, 2009

AVAILABILITY
       The Small-Footprint CIM Broker (sfcb) is a part of the SBLIM project.  The most recent version is available on the web at

              http://sblim.sourceforge.net/

SEE ALSO
       sfcbmof(1), sfcbstage(1), sfcbunstage(1), sfcbrebos(1), genSslCert.sh(1), getSchema.sh(1), wbemcli(1)





sfcb Version 1.4.8                                                                                June 2009                                                                                          sfcbd(1)
