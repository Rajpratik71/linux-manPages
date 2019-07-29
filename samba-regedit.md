SAMBA-REGEDIT(8)                                                                         System Administration tools                                                                         SAMBA-REGEDIT(8)



NAME
       samba-regedit - ncurses based tool to manage the Samba registry

SYNOPSIS
       samba-regedit [--help] [--usage] [-d <debug level>] [-s <configuration file>] [-l <log directory>] [-V] [--option=<parameter>=<value>] [--socket-options=<SOCKETOPTIONS>]
        [--netbiosname=<NETBIOSNAME>] [--workgroup=<WORKGROUP>] [--scope=<SCOPE>] [--user=<USERNAME>] [-N] [-k] [--authentication-file=<FILE>] [--signing=[on|off|required]] [-P] [-e] [-C] [--pw-nt-hash]

DESCRIPTION
       This tool is part of the samba(7) suite.

       samba-regedit is a ncurses based tool to manage the Samba registry. It can be used to show/edit registry keys/subkeys and their values.

OPTIONS
       -?|--help
           Print a summary of command line options.

       -d|--debuglevel=level
           level is an integer from 0 to 10. The default value if this parameter is not specified is 1.

           The higher this value, the more detail will be logged to the log files about the activities of the server. At level 0, only critical errors and serious warnings will be logged. Level 1 is a
           reasonable level for day-to-day running - it generates a small amount of information about operations carried out.

           Levels above 1 will generate considerable amounts of log data, and should only be used when investigating a problem. Levels above 3 are designed for use only by developers and generate HUGE
           amounts of log data, most of which is extremely cryptic.

           Note that specifying this parameter here will override the log level parameter in the smb.conf file.

       --usage
           Display brief usage message.

       -V|--version
           Prints the program version number.

       -s|--configfile=<configuration file>
           The file specified contains the configuration details required by the server. The information in this file includes server-specific information such as what printcap file to use, as well as
           descriptions of all the services that the server is to provide. See smb.conf for more information. The default configuration file name is determined at compile time.

       -l|--log-basename=logdirectory
           Base directory name for log/debug files. The extension ".progname" will be appended (e.g. log.smbclient, log.smbd, etc...). The log file is never removed by the client.

       --option=<name>=<value>
           Set the smb.conf(5) option "<name>" to value "<value>" from the command line. This overrides compiled-in defaults and options read from the configuration file.

       -n|--netbiosname <primary NetBIOS name>
           This option allows you to override the NetBIOS name that Samba uses for itself. This is identical to setting the netbios name parameter in the smb.conf file. However, a command line setting will
           take precedence over settings in smb.conf.

       -i|--scope <scope>
           This specifies a NetBIOS scope that nmblookup will use to communicate with when generating NetBIOS names. For details on the use of NetBIOS scopes, see rfc1001.txt and rfc1002.txt. NetBIOS
           scopes are very rarely used, only set this parameter if you are the system administrator in charge of all the NetBIOS systems you communicate with.

       -W|--workgroup=domain
           Set the SMB domain of the username. This overrides the default domain which is the domain defined in smb.conf. If the domain specified is the same as the servers NetBIOS name, it causes the
           client to log on using the servers local SAM (as opposed to the Domain SAM).

       -O|--socket-options socket options
           TCP socket options to set on the client socket. See the socket options parameter in the smb.conf manual page for the list of valid options.

       -N|--no-pass
           If specified, this parameter suppresses the normal password prompt from the client to the user. This is useful when accessing a service that does not require a password.

           Unless a password is specified on the command line or this parameter is specified, the client will request a password.

           If a password is specified on the command line and this option is also defined the password on the command line will be silently ingnored and no password will be used.

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

           If %password is not specified, the user will be prompted. The client will first check the USER environment variable, then the LOGNAME variable and if either exists, the string is uppercased. If
           these environmental variables are not found, the username GUEST is used.

           A third option is to use a credentials file which contains the plaintext of the username and password. This option is mainly provided for scripts where the admin does not wish to pass the
           credentials on the command line or via environment variables. If this method is used, make certain that the permissions on the file restrict access from unwanted users. See the -A for more
           details.

           Be cautious about including passwords in scripts. Also, on many systems the command line of a running process may be seen via the ps command. To be safe always allow rpcclient to prompt for a
           password and type it in directly.

       -S|--signing on|off|required
           Set the client signing state.

       -P|--machine-pass
           Use stored machine account password.

       -e|--encrypt
           This command line parameter requires the remote server support the UNIX extensions or that the SMB3 protocol has been selected. Requests that the connection be encrypted. Negotiates SMB
           encryption using either SMB3 or POSIX extensions via GSSAPI. Uses the given credentials for the encryption negotiation (either kerberos or NTLMv1/v2 if given domain/username/password triple.
           Fails the connection if encryption cannot be negotiated.

       --pw-nt-hash
           The supplied password is the NT hash.

VERSION
       This man page is correct for version 4 of the Samba suite.

SEE ALSO
       smbd(8), samba(7) and net(8).

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open Source project similar to the way the Linux kernel is
       developed.

       The samba-regedit man page was written by Karolin Seeger.



Samba 4.6                                                                                         07/12/2017                                                                                 SAMBA-REGEDIT(8)
