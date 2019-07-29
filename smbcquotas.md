SMBCQUOTAS(1)                                                      User Commands                                                     SMBCQUOTAS(1)

NAME
       smbcquotas - Set or get QUOTAs of NTFS 5 shares

SYNOPSIS
       smbcquotas {//server/share} [-u|--user user] [-L|--list] [-F|--fs] [-S|--set QUOTA_SET_COMMAND] [-n|--numeric] [-t|--test-args]
        [-v|--verbose] [-d debuglevel] [-s configfile] [-l logdir] [-V] [-U username] [-N] [-k] [-A]

DESCRIPTION
       This tool is part of the samba(7) suite.

       The smbcquotas program manipulates NT Quotas on SMB file shares.

OPTIONS
       The following options are available to the smbcquotas program.

       -u|--user user
           Specifies the user of whom the quotas are get or set. By default the current user's username will be used.

       -L|--list
           Lists all quota records of the share.

       -F|--fs
           Show the share quota status and default limits.

       -S|--set QUOTA_SET_COMMAND
           This command sets/modifies quotas for a user or on the share, depending on the QUOTA_SET_COMMAND parameter which is described later.

       -n|--numeric
           This option displays all QUOTA information in numeric format. The default is to convert SIDs to names and QUOTA limits to a readable
           string format.

       -t|--test-args
           Don't actually do anything, only validate the correctness of the arguments.

       -v|--verbose
           Be verbose.

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

       -?|--help
           Print a summary of command line options.

       --usage
           Display brief usage message.

QUOTA_SET_COMMAND
       The format of an the QUOTA_SET_COMMAND is an operation name followed by a set of parameters specific to that operation.

       To set user quotas for the user specified by -u or for the current username:

        UQLIM:<username>:<softlimit>/<hardlimit>

       To set the default quotas for a share:

        FSQLIM:<softlimit>/<hardlimit>

       To change the share quota settings:

        FSQFLAGS:QUOTA_ENABLED/DENY_DISK/LOG_SOFTLIMIT/LOG_HARD_LIMIT

       All limits are specified as a number of bytes.

EXIT STATUS
       The smbcquotas program sets the exit status depending on the success or otherwise of the operations performed. The exit status may be one
       of the following values.

       If the operation succeeded, smbcquotas returns an exit status of 0. If smbcquotas couldn't connect to the specified server, or when there
       was an error getting or setting the quota(s), an exit status of 1 is returned. If there was an error parsing any command line arguments, an
       exit status of 2 is returned.

VERSION
       This man page is correct for version 3 of the Samba suite.

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open
       Source project similar to the way the Linux kernel is developed.

       smbcquotas was written by Stefan Metzmacher.

Samba 4.3                                                           05/23/2019                                                       SMBCQUOTAS(1)
