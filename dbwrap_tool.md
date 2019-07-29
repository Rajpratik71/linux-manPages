DBWRAP_TOOL(1)                                                                           System Administration tools                                                                           DBWRAP_TOOL(1)



NAME
       dbwrap_tool - low level TDB/CTDB manipulation tool using the dbwrap interface

SYNOPSIS
       dbwrap_tool [--persistent] [--non-persistent] [-d <debug level>] [-s <config file>] [-l <log file base>] [-V] [--option=<name>=<value>] {<database>} {<operation>} [<key> [<type> [<value>]]]

DESCRIPTION
       This tool is part of the samba(7) suite.

       The dbwrap_tool program is used to read and manipulate TDB/CTDB databases using the dbwrap interface.

       The following database operations are available:

       ·   fetch: fetch a record

       ·   store: create or modify a record

       ·   delete: remove a record

       ·   exists: test for existence of a record

       ·   erase: remove all records

       ·   listkeys: list all available records

       ·   listwatchers: list processes, which are waiting for changes in a record


       The following types are available:

       ·   int32: signed 32bit integer

       ·   uint32: unsigned 32bit integer

       ·   string: "hello world"

       ·   hex: hex strings like "68656C6C6F20776F726C6400" ("hello world")


OPTIONS
       --persistent
           Open the database as a persistent database.

           Exactly one of --persistent and --non-persistent must be specified.

       --non-persistent
           Open the database as a non-persistent database.

           Caveat: opening a database as non-persistent when there is currently no other opener will wipe the database.

           Exactly one of --persistent and --non-persistent must be specified.

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

COMMANDS
   fetch
       dbwrap_tool <database> fetch <key> <type>

   store
       dbwrap_tool <database> store <key> <type> <value>

   delete
       dbwrap_tool <database> delete <key>

   exists
       dbwrap_tool <database> exists <key>

   erase
       dbwrap_tool <database> erase

   listkeys
       dbwrap_tool <database> listkeys

   listwatchers
       dbwrap_tool <database> listwatchers

EXAMPLES
       List all keys from winbindd_idmap.tdb
           dbwrap_tool --persistent winbindd_idmap.tdb listkeys

       Fetch record with key "USER HWM" as uint32
           dbwrap_tool --persistent winbindd_idmap.tdb fetch "USER HWM" uint32

       Remove record with key "USER HWM"
           dbwrap_tool --persistent winbindd_idmap.tdb remove "USER HWM"

       Store and overwrite record "USER HWM" with value 214
           uint32: dbwrap_tool --persistent winbindd_idmap.tdb store "USER HWM" uint32 214 hex: dbwrap_tool --persistent winbindd_idmap.tdb store "USER HWM" hex D6000000

NOTES
       Use with caution!

VERSION
       This man page is correct for version 3 of the Samba suite.

SEE ALSO
       smbd(8), samba(7)

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open Source project similar to the way the Linux kernel is
       developed.

       The dbwrap_tool manpage was written by Bjoern Baumbach.



Samba 4.6                                                                                         07/12/2017                                                                                   DBWRAP_TOOL(1)
