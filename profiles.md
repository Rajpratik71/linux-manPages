PROFILES(1)                                                                                     User Commands                                                                                     PROFILES(1)



NAME
       profiles - A utility to report and change SIDs in registry files

SYNOPSIS
       profiles [-v] [-c|--change-sid SID] [-n|--new-sid SID] {file}

DESCRIPTION
       This tool is part of the samba(7) suite.

       profiles is a utility that reports and changes SIDs in windows registry files. It currently only supports NT.

OPTIONS
       file
           Registry file to view or edit.

       -v,--verbose
           Increases verbosity of messages.

       -c SID1 -n SID2, --change-sid SID1 --new-sid SID2
           Change all occurrences of SID1 in file by SID2.

       -d|--debuglevel=level
           level is an integer from 0 to 10. The default value if this parameter is not specified is 1.

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

       -?|--help
           Print a summary of command line options.

       --usage
           Display brief usage message.

VERSION
       This man page is part of version 4.9.1 of the Samba suite.

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open Source project similar to the way the Linux kernel is
       developed.

       The profiles man page was written by Jelmer Vernooij.



Samba 4.9.1                                                                                       08/09/2019                                                                                      PROFILES(1)
