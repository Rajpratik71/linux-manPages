RPCCLIENT(1)                                                       User Commands                                                      RPCCLIENT(1)

NAME
       rpcclient - tool for executing client side MS-RPC functions

SYNOPSIS
       rpcclient [-A authfile] [-c <command string>] [-d debuglevel] [-l logdir] [-N] [-s <smb config file>] [-U username[%password]]
        [-W workgroup] [-I destinationIP] {server}

DESCRIPTION
       This tool is part of the samba(7) suite.

       rpcclient is a utility initially developed to test MS-RPC functionality in Samba itself. It has undergone several stages of development and
       stability. Many system administrators have now written scripts around it to manage Windows NT clients from their UNIX workstation.

OPTIONS
       server
           NetBIOS name of Server to which to connect. The server can be any SMB/CIFS server. The name is resolved using the name resolve order
           line from smb.conf(5).

       -c|--command=<command string>
           Execute semicolon separated commands (listed below)

       -I|--dest-ip IP-address
           IP address is the address of the server to connect to. It should be specified in standard "a.b.c.d" notation.

           Normally the client would attempt to locate a named SMB/CIFS server by looking it up via the NetBIOS name resolution mechanism
           described above in the name resolve order parameter above. Using this parameter will force the client to assume that the server is on
           the machine with the specified IP address and the NetBIOS name component of the resource being connected to will be ignored.

           There is no default for this parameter. If not supplied, it will be determined automatically by the client as described above.

       -p|--port port
           This number is the TCP port number that will be used when making connections to the server. The standard (well-known) TCP port number
           for an SMB/CIFS server is 139, which is the default.

       -d|--debuglevel=level
           level is an integer from 0 to 10. The default value if this parameter is not specified is 0.

           The higher this value, the more detail will be logged to the log files about the activities of the server. At level 0, only critical
           errors and serious warnings will be logged. Level 1 is a reasonable level for day-to-day running - it generates a small amount of
           information about operations carried out.

           Levels above 1 will generate considerable amounts of log data, and should only be used when investigating a problem. Levels above 3 are
           designed for use only by developers and generate HUGE amounts of log data, most of which is extremely cryptic.

           Note that specifying this parameter here will override the log level parameter in the smb.conf file.

       -V|--version
           Prints the program version number.

       -s|--configfile=<configuration file>
           The file specified contains the configuration details required by the server. The information in this file includes server-specific
           information such as what printcap file to use, as well as descriptions of all the services that the server is to provide. See smb.conf
           for more information. The default configuration file name is determined at compile time.

       -l|--log-basename=logdirectory
           Base directory name for log/debug files. The extension ".progname" will be appended (e.g. log.smbclient, log.smbd, etc...). The log
           file is never removed by the client.

       --option=<name>=<value>
           Set the smb.conf(5) option "<name>" to value "<value>" from the command line. This overrides compiled-in defaults and options read from
           the configuration file.

       -N|--no-pass
           If specified, this parameter suppresses the normal password prompt from the client to the user. This is useful when accessing a service
           that does not require a password.

           Unless a password is specified on the command line or this parameter is specified, the client will request a password.

           If a password is specified on the command line and this option is also defined the password on the command line will be silently
           ingnored and no password will be used.

       -k|--kerberos
           Try to authenticate with kerberos. Only useful in an Active Directory environment.

       -C|--use-ccache
           Try to use the credentials cached by winbind.

       -A|--authentication-file=filename
           This option allows you to specify a file from which to read the username and password used in the connection. The format of the file is

               username = <value>
               password = <value>
               domain   = <value>

           Make certain that the permissions on the file restrict access from unwanted users.

       -U|--user=username[%password]
           Sets the SMB username or username and password.

           If %password is not specified, the user will be prompted. The client will first check the USER environment variable, then the LOGNAME
           variable and if either exists, the string is uppercased. If these environmental variables are not found, the username GUEST is used.

           A third option is to use a credentials file which contains the plaintext of the username and password. This option is mainly provided
           for scripts where the admin does not wish to pass the credentials on the command line or via environment variables. If this method is
           used, make certain that the permissions on the file restrict access from unwanted users. See the -A for more details.

           Be cautious about including passwords in scripts. Also, on many systems the command line of a running process may be seen via the ps
           command. To be safe always allow rpcclient to prompt for a password and type it in directly.

       -S|--signing on|off|required
           Set the client signing state.

       -P|--machine-pass
           Use stored machine account password.

       -e|--encrypt
           This command line parameter requires the remote server support the UNIX extensions or that the SMB3 protocol has been selected.
           Requests that the connection be encrypted. Negotiates SMB encryption using either SMB3 or POSIX extensions via GSSAPI. Uses the given
           credentials for the encryption negotiation (either kerberos or NTLMv1/v2 if given domain/username/password triple. Fails the connection
           if encryption cannot be negotiated.

       --pw-nt-hash
           The supplied password is the NT hash.

       -n|--netbiosname <primary NetBIOS name>
           This option allows you to override the NetBIOS name that Samba uses for itself. This is identical to setting the netbios name parameter
           in the smb.conf file. However, a command line setting will take precedence over settings in smb.conf.

       -i|--scope <scope>
           This specifies a NetBIOS scope that nmblookup will use to communicate with when generating NetBIOS names. For details on the use of
           NetBIOS scopes, see rfc1001.txt and rfc1002.txt. NetBIOS scopes are very rarely used, only set this parameter if you are the system
           administrator in charge of all the NetBIOS systems you communicate with.

       -W|--workgroup=domain
           Set the SMB domain of the username. This overrides the default domain which is the domain defined in smb.conf. If the domain specified
           is the same as the servers NetBIOS name, it causes the client to log on using the servers local SAM (as opposed to the Domain SAM).

       -O|--socket-options socket options
           TCP socket options to set on the client socket. See the socket options parameter in the smb.conf manual page for the list of valid
           options.

       -?|--help
           Print a summary of command line options.

       --usage
           Display brief usage message.

COMMANDS
   LSARPC
       lsaquery
           Query info policy

       lookupsids
           Resolve a list of SIDs to usernames.

       lookupnames
           Resolve a list of usernames to SIDs.

       enumtrust
           Enumerate trusted domains

       enumprivs
           Enumerate privileges

       getdispname
           Get the privilege name

       lsaenumsid
           Enumerate the LSA SIDS

       lsaenumprivsaccount
           Enumerate the privileges of an SID

       lsaenumacctrights
           Enumerate the rights of an SID

       lsaenumacctwithright
           Enumerate accounts with a right

       lsaaddacctrights
           Add rights to an account

       lsaremoveacctrights
           Remove rights from an account

       lsalookupprivvalue
           Get a privilege value given its name

       lsaquerysecobj
           Query LSA security object

   LSARPC-DS
       dsroledominfo
           Get Primary Domain Information

       DFS

       dfsexist
           Query DFS support

       dfsadd
           Add a DFS share

       dfsremove
           Remove a DFS share

       dfsgetinfo
           Query DFS share info

       dfsenum
           Enumerate dfs shares

   REG
       shutdown
           Remote Shutdown

       abortshutdown
           Abort Shutdown

   SRVSVC
       srvinfo
           Server query info

       netshareenum
           Enumerate shares

       netshareenumall
           Enumerate all shares

       netsharegetinfo
           Get Share Info

       netsharesetinfo
           Set Share Info

       netsharesetdfsflags
           Set DFS flags

       netfileenum
           Enumerate open files

       netremotetod
           Fetch remote time of day

       netnamevalidate
           Validate sharename

       netfilegetsec
           Get File security

       netsessdel
           Delete Session

       netsessenum
           Enumerate Sessions

       netdiskenum
           Enumerate Disks

       netconnenum
           Enumerate Connections

       netshareadd
           Add share

       netsharedel
           Delete share

   SAMR
       queryuser
           Query user info

       querygroup
           Query group info

       queryusergroups
           Query user groups

       querygroupmem
           Query group membership

       queryaliasmem
           Query alias membership

       querydispinfo
           Query display info

       querydominfo
           Query domain info

       enumdomusers
           Enumerate domain users

       enumdomgroups
           Enumerate domain groups

       enumalsgroups
           Enumerate alias groups

       createdomuser
           Create domain user

       samlookupnames
           Look up names

       samlookuprids
           Look up names

       deletedomuser
           Delete domain user

       samquerysecobj
           Query SAMR security object

       getdompwinfo
           Retrieve domain password info

       lookupdomain
           Look up domain

   SPOOLSS
       adddriver <arch> <config> [<version>]
           Execute an AddPrinterDriver() RPC to install the printer driver information on the server. Note that the driver files should already
           exist in the directory returned by getdriverdir. Possible values for arch are the same as those for the getdriverdir command. The
           config parameter is defined as follows:

               Long Driver Name:\
               Driver File Name:\
               Data File Name:\
               Config File Name:\
               Help File Name:\
               Language Monitor Name:\
               Default Data Type:\
               Comma Separated list of Files

           Any empty fields should be enter as the string "NULL".

           Samba does not need to support the concept of Print Monitors since these only apply to local printers whose driver can make use of a
           bi-directional link for communication. This field should be "NULL". On a remote NT print server, the Print Monitor for a driver must
           already be installed prior to adding the driver or else the RPC will fail.

           The version parameter lets you specify the printer driver version number. If omitted, the default driver version for the specified
           architecture will be used. This option can be used to upload Windows 2000 (version 3) printer drivers.

       addprinter <printername> <sharename> <drivername> <port>
           Add a printer on the remote server. This printer will be automatically shared. Be aware that the printer driver must already be
           installed on the server (see adddriver) and the portmust be a valid port name (see enumports.

       deldriver <driver>
           Delete the specified printer driver for all architectures. This does not delete the actual driver files from the server, only the entry
           from the server's list of drivers.

       deldriverex <driver> [architecture] [version] [flags]
           Delete the specified printer driver and optionally files associated with the driver. You can limit this action to a specific
           architecture and a specific version. If no architecture is given, all driver files of that driver will be deleted.  flags correspond to
           numeric DPD_* values, i.e. a value of 3 requests (DPD_DELETE_UNUSED_FILES | DPD_DELETE_SPECIFIC_VERSION).

       enumdata
           Enumerate all printer setting data stored on the server. On Windows NT clients, these values are stored in the registry, while Samba
           servers store them in the printers TDB. This command corresponds to the MS Platform SDK GetPrinterData() function (* This command is
           currently unimplemented).

       enumdataex
           Enumerate printer data for a key

       enumjobs <printer>
           List the jobs and status of a given printer. This command corresponds to the MS Platform SDK EnumJobs() function

       enumkey
           Enumerate printer keys

       enumports [level]
           Executes an EnumPorts() call using the specified info level. Currently only info levels 1 and 2 are supported.

       enumdrivers [level]
           Execute an EnumPrinterDrivers() call. This lists the various installed printer drivers for all architectures. Refer to the MS Platform
           SDK documentation for more details of the various flags and calling options. Currently supported info levels are 1, 2, and 3.

       enumprinters [level]
           Execute an EnumPrinters() call. This lists the various installed and share printers. Refer to the MS Platform SDK documentation for
           more details of the various flags and calling options. Currently supported info levels are 1, 2 and 5.

       getdata <printername> <valuename;>
           Retrieve the data for a given printer setting. See the enumdata command for more information. This command corresponds to the
           GetPrinterData() MS Platform SDK function.

       getdataex
           Get printer driver data with keyname

       getdriver <printername>
           Retrieve the printer driver information (such as driver file, config file, dependent files, etc...) for the given printer. This command
           corresponds to the GetPrinterDriver() MS Platform SDK function. Currently info level 1, 2, and 3 are supported.

       getdriverdir <arch>
           Execute a GetPrinterDriverDirectory() RPC to retrieve the SMB share name and subdirectory for storing printer driver files for a given
           architecture. Possible values for arch are "Windows 4.0" (for Windows 95/98), "Windows NT x86", "Windows NT PowerPC", "Windows
           Alpha_AXP", and "Windows NT R4000".

       getprinter <printername>
           Retrieve the current printer information. This command corresponds to the GetPrinter() MS Platform SDK function.

       getprintprocdir
           Get print processor directory

       openprinter <printername>
           Execute an OpenPrinterEx() and ClosePrinter() RPC against a given printer.

       setdriver <printername> <drivername>
           Execute a SetPrinter() command to update the printer driver associated with an installed printer. The printer driver must already be
           correctly installed on the print server.

           See also the enumprinters and enumdrivers commands for obtaining a list of of installed printers and drivers.

       addform
           Add form

       setform
           Set form

       getform
           Get form

       deleteform
           Delete form

       enumforms
           Enumerate form

       setprinter
           Set printer comment

       setprinterdata
           Set REG_SZ printer data

       setprintername <printername> <newprintername>
           Set printer name

       rffpcnex
           Rffpcnex test

   NETLOGON
       logonctrl2
           Logon Control 2

       logonctrl
           Logon Control

       samsync
           Sam Synchronisation

       samdeltas
           Query Sam Deltas

       samlogon
           Sam Logon

   FSRVP
       fss_is_path_sup <share>
           Check whether a share supports shadow-copy requests

       fss_get_sup_version
           Get supported FSRVP version from server

       fss_create_expose <context> <[ro|rw]> <share1> [share2] ... [shareN]
           Request shadow-copy creation and exposure as a new share

       fss_delete <base_share> <shadow_copy_set_id> <shadow_copy_id>
           Request shadow-copy share deletion

       fss_has_shadow_copy <base_share>
           Check for an associated share shadow-copy

       fss_get_mapping <base_share> <shadow_copy_set_id> <shadow_copy_id>
           Get shadow-copy share mapping information

       fss_recovery_complete <shadow_copy_set_id>
           Flag read-write shadow-copy as recovery complete, allowing further shadow-copy requests

   GENERAL COMMANDS
       debuglevel
           Set the current debug level used to log information.

       help (?)
           Print a listing of all known commands or extended help on a particular command.

       quit (exit)
           Exit rpcclient.

BUGS
       rpcclient is designed as a developer testing tool and may not be robust in certain areas (such as command line parsing). It has been known
       to generate a core dump upon failures when invalid parameters where passed to the interpreter.

       From Luke Leighton's original rpcclient man page:

       WARNING!  The MSRPC over SMB code has been developed from examining Network traces. No documentation is available from the original
       creators (Microsoft) on how MSRPC over SMB works, or how the individual MSRPC services work. Microsoft's implementation of these services
       has been demonstrated (and reported) to be... a bit flaky in places.

       The development of Samba's implementation is also a bit rough, and as more of the services are understood, it can even result in versions
       of smbd(8) and rpcclient(1) that are incompatible for some commands or services. Additionally, the developers are sending reports to
       Microsoft, and problems found or reported to Microsoft are fixed in Service Packs, which may result in incompatibilities.

VERSION
       This man page is correct for version 3 of the Samba suite.

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open
       Source project similar to the way the Linux kernel is developed.

       The original rpcclient man page was written by Matthew Geddes, Luke Kenneth Casson Leighton, and rewritten by Gerald Carter. The conversion
       to DocBook for Samba 2.2 was done by Gerald Carter. The conversion to DocBook XML 4.2 for Samba 3.0 was done by Alexander Bokovoy.

Samba 4.3                                                           05/23/2019                                                        RPCCLIENT(1)
