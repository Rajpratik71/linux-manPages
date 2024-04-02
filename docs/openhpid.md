openhpid(8)                                                           OpenHPI                                                          openhpid(8)

NAME
       openhpid - HPI instance to which multiple clients can connect.

SYNOPSIS
       openhpid -c config_file [OPTION]

DESCRIPTION
       The OpenHPI daemon runs as a background process and accepts connections from remote clients that invoke HPI function calls. The daemon
       wraps the OpenHPI library with a sockets-based API that is archicture neutral for all types of clients.

       When you run the daemon, the standard method for locating the OpenHPI configuration file is used. However, the daemon will accept a
       configuration file as a command line option (-c) to override the default file.

       A command option (-p)  or environment variable determines the port number the daemon will listen on for client connections. The default
       port is 4743.

       The daemon creates a PID file in the /var/run subdirectory. This directory is only writable by the root user. Thus the daemon will fail
       when run as a normal user if the PID file location is not overridden.  To override the PID file location you can use the -f command line
       option.

       The client and the daemon do not have to be on the same hardware architecture.  The daemon could be running on a P-series processor and the
       client running on an x86-series processor. The client library and daemon use a marshaling technique to resolve architecture and structure
       padding conflicts. The user does not need to concern themselves with architectureal differences between the client and daemon. The one
       exception to this rule is 64-bit architectures.  The client and daemon currently cannot resolve differences between 32-bit and 64-bit
       architectures.

OPTIONS
       -f pidfile
           This overrides the default location of the pidfile.

       -n  This forces the daemon to run in the foreground.

       -p port
           This is used to override the port to listen on by the daemon.

       -s seconds
           Read timeout used by the daemon sockets. Default is unlimited.

       -t threads
           Sets the maximum number of connection threads. Default is unlimited.

       -v  Display verbose messages

ENVIRONMENTAL VARIABLES
       All of these environment variables can instead be set in the openhpi.conf configuration file, except for OPENHPI_DAEMON_PORT and
       OPENHPI_CONF.

       OPENHPI_DAEMON_PORT=PORT_NUMBER
           The port number the host will listen on for clent connections.  Default port is 4743.

       OPENHPI_LOG_ON_SEV
           Valus can be one of: CRITICAL,MAJOR,MINOR,INFORMATIONAL,OK,DEBUG.  Events of this severity or higher will be logged to the domain event
           log.  The default is MINOR.

       OPENHPI_ON_EP=ENTITY_PATH
           Entity path returned (e.g. {SYSTEM_CHASSIS,1}) when saHpiResourceIdGet() is called.

       OPENHPI_EVT_QUEUE_LIMIT=NUMBER
           Maximum number of events allowed in a subscribed session's queue.  Default is 10000.

       OPENHPI_DEL_SIZE_LIMIT=NUMBER
           Maximum number of events allowed in the domain event log.  Default is 10000

       OPENHPI_DEL_SAVE
           Set to YES to persist the domain event logs to disk. They will be loaded in case the daemon restarts. Default is NO.

       OPENHPI_DAT_SIZE_LIMIT=NUMBER
           Maximum number of alarms allowed in the domain alarm table.  Default is unlimited.

       OPENHPI_DAT_USER_LIMIT=NUMBER
           Maximum number of user alarms allowed in the domain alarm table.  Default is unlimited.

       OPENHPI_DAT_SAVE
           Set to YES to persist the domain alarm tables to disk. They will be loaded in case the daemon restarts. Default is NO.

       OPENHPI_PATH="/path/to/plugins:/another/path/to/plugins"
           This is a colon delimited list of directories used when searching for an OpenHPI plugin to load. The default is $prefix/lib/openhpi.

       OPENHPI_VARPATH="/path/to/dir"
           This sets the directory used to store openhpi internal data. The domain event logs and alarm tables are saved there (if configured to)
           along with resource ID to entity path mappings.  Default is $prefix/var/lib/openhpi.

       OPENHPI_CONF="/path/to/configurationg/file"
           This is another way of telling the daemon where to find the configuration file.

SEE ALSO
       The following man pages may also be of interest

       openhpi
           General information about OpenHPI

AUTHORS
       Authors of this man page:

        Renier Morales (renier@openhpi.org)

2.14.1                                                              2009-11-23                                                         openhpid(8)
