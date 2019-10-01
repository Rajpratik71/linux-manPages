NMBLOOKUP(1)                                                                                    User Commands                                                                                    NMBLOOKUP(1)



NAME
       nmblookup - NetBIOS over TCP/IP client used to lookup NetBIOS names

SYNOPSIS
       nmblookup [-M|--master-browser] [-R|--recursion] [-S|--status] [-r|--root-port] [-A|--lookup-by-ip] [-B|--broadcast <broadcast address>] [-U|--unicast <unicast address>] [-d <debug level>]
        [-s <smb config file>] [-i <NetBIOS scope>] [-T|--translate] [-f|--flags] {name}

DESCRIPTION
       This tool is part of the samba(7) suite.

       nmblookup is used to query NetBIOS names and map them to IP addresses in a network using NetBIOS over TCP/IP queries. The options allow the name queries to be directed at a particular IP broadcast
       area or to a particular machine. All queries are done over UDP.

OPTIONS
       -M|--master-browser
           Searches for a master browser by looking up the NetBIOS name with a type of 0x1d. If
            name is "-" then it does a lookup on the special name __MSBROWSE__. Please note that in order to use the name "-", you need to make sure "-" isn't parsed as an argument, e.g. use : nmblookup -M
           -- -.

       -R|--recursion
           Set the recursion desired bit in the packet to do a recursive lookup. This is used when sending a name query to a machine running a WINS server and the user wishes to query the names in the WINS
           server. If this bit is unset the normal (broadcast responding) NetBIOS processing code on a machine is used instead. See RFC1001, RFC1002 for details.

       -S|--status
           Once the name query has returned an IP address then do a node status query as well. A node status query returns the NetBIOS names registered by a host.

       -r|--root-port
           Try and bind to UDP port 137 to send and receive UDP datagrams. The reason for this option is a bug in Windows 95 where it ignores the source port of the requesting packet and only replies to
           UDP port 137. Unfortunately, on most UNIX systems root privilege is needed to bind to this port, and in addition, if the nmbd(8) daemon is running on this machine it also binds to this port.

       -A|--lookup-by-ip
           Interpret name as an IP Address and do a node status query on this address.

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

       -?|--help
           Print a summary of command line options.

       --usage
           Display brief usage message.

       -B|--broadcast <broadcast address>
           Send the query to the given broadcast address. Without this option the default behavior of nmblookup is to send the query to the broadcast address of the network interfaces as either
           auto-detected or defined in the interfaces parameter of the smb.conf(5) file.

       -U|--unicast <unicast address>
           Do a unicast query to the specified address or host unicast address. This option (along with the -R option) is needed to query a WINS server.

       -d|--debuglevel=level
           level is an integer from 0 to 10. The default value if this parameter is not specified is 0.

           The higher this value, the more detail will be logged to the log files about the activities of the server. At level 0, only critical errors and serious warnings will be logged. Level 1 is a
           reasonable level for day-to-day running - it generates a small amount of information about operations carried out.

           Levels above 1 will generate considerable amounts of log data, and should only be used when investigating a problem. Levels above 3 are designed for use only by developers and generate HUGE
           amounts of log data, most of which is extremely cryptic.

           Note that specifying this parameter here will override the log level parameter in the smb.conf file.

       -V|--version
           Prints the program version number.

       -s|--configfile=<configuration file>
           The file specified contains the configuration details required by the server. The information in this file includes server-specific information such as what printcap file to use, as well as
           descriptions of all the services that the server is to provide. See smb.conf for more information. The default configuration file name is determined at compile time.

       -l|--log-basename=logdirectory
           Base directory name for log/debug files. The extension ".progname" will be appended (e.g. log.smbclient, log.smbd, etc...). The log file is never removed by the client.

       --option=<name>=<value>
           Set the smb.conf(5) option "<name>" to value "<value>" from the command line. This overrides compiled-in defaults and options read from the configuration file.

       -T|--translate
           This causes any IP addresses found in the lookup to be looked up via a reverse DNS lookup into a DNS name, and printed out before each

           IP address .... NetBIOS name

           pair that is the normal output.

       -f|--flags
           Show which flags apply to the name that has been looked up. Possible answers are zero or more of: Response, Authoritative, Truncated, Recursion_Desired, Recursion_Available, Broadcast.

       name
           This is the NetBIOS name being queried. Depending upon the previous options this may be a NetBIOS name or IP address. If a NetBIOS name then the different name types may be specified by
           appending '#<type>' to the name. This name may also be '*', which will return all registered names within a broadcast area.

EXAMPLES
       nmblookup can be used to query a WINS server (in the same way nslookup is used to query DNS servers). To query a WINS server, nmblookup must be called like this:

       nmblookup -U server -R 'name'

       For example, running :

       nmblookup -U samba.org -R 'IRIX#1B'

       would query the WINS server samba.org for the domain master browser (1B name type) for the IRIX workgroup.

VERSION
       This man page is part of version 4.9.1 of the Samba suite.

SEE ALSO
       nmbd(8), samba(7), and smb.conf(5).

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open Source project similar to the way the Linux kernel is
       developed.



Samba 4.9.1                                                                                       08/09/2019                                                                                     NMBLOOKUP(1)
