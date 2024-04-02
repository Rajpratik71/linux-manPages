SMBSTATUS(1)                                                                                    User Commands                                                                                    SMBSTATUS(1)



NAME
       smbstatus - report on current Samba connections

SYNOPSIS
       smbstatus [-P] [-b] [-d <debug level>] [-v] [-L] [-B] [-p] [-S] [-N] [-f] [-s <configuration file>] [-u <username>] [-n|--numeric] [-R|--profile-rates]

DESCRIPTION
       This tool is part of the samba(7) suite.

       smbstatus is a very simple program to list the current Samba connections.

OPTIONS
       -P|--profile
           If samba has been compiled with the profiling option, print only the contents of the profiling shared memory area.

       -R|--profile-rates
           If samba has been compiled with the profiling option, print the contents of the profiling shared memory area and the call rates.

       -b|--brief
           gives brief output.

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

       -v|--verbose
           gives verbose output.

       -L|--locks
           causes smbstatus to only list locks.

       -B|--byterange
           causes smbstatus to include byte range locks.

       -p|--processes
           print a list of smbd(8) processes and exit. Useful for scripting.

       -S|--shares
           causes smbstatus to only list shares.

       -N|--notify
           causes smbstatus to display registered file notifications

       -f|--fast
           causes smbstatus to not check if the status data is valid by checking if the processes that the status data refer to all still exist. This speeds up execution on busy systems and clusters but
           might display stale data of processes that died without cleaning up properly.

       -?|--help
           Print a summary of command line options.

       -u|--user=<username>
           selects information relevant to username only.

       -n|--numeric
           causes smbstatus to display numeric UIDs and GIDs instead of resolving them to names.

VERSION
       This man page is correct for version 3 of the Samba suite.

SEE ALSO
       smbd(8) and smb.conf(5).

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open Source project similar to the way the Linux kernel is
       developed.

       The original Samba man pages were written by Karl Auer. The man page sources were converted to YODL format (another excellent piece of Open Source software, available at
       ftp://ftp.icce.rug.nl/pub/unix/) and updated for the Samba 2.0 release by Jeremy Allison. The conversion to DocBook for Samba 2.2 was done by Gerald Carter. The conversion to DocBook XML 4.2 for
       Samba 3.0 was done by Alexander Bokovoy.



Samba 4.6                                                                                         07/12/2017                                                                                     SMBSTATUS(1)
