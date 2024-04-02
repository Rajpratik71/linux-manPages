DBMON.SH(8)                                                                                System Manager's Manual                                                                                DBMON.SH(8)



NAME
       dbmon.sh - Directory Server script for monitoring database and entry cache usage

SYNOPSIS
       [INCR=num] [SERVID=server_id][BINDDN=binddn] [BINDPW=password] [DBLIST=databases] [INDEXLIST=indexes] [VERBOSE=num] dbmon.sh

DESCRIPTION
       dbmon.sh is a tool used to monitor database and entry cache usage. It is especially useful for database cache and entry/dn cache tuning - how much space is left, is the cache full, how much space on
       average do I need per entry/dn.

OPTIONS
       It doesn't take any command line arguments, so all options must be passed in as environment variables.

       dbmon.sh will loop repeatedly showing the db information until it is killed or Ctrl-C

       All arguments are optional, but you will most likely have to provide BINDPW


       INCR - show results every INCR seconds - default is 1 second

       SERVID - Name of the server instance

       BINDDN - DN to use to bind - must have permission to read everything under cn=config - default is cn=Directory Manager

       BINDPW - password for BINDDN - default is secret

       DBLIST - a list of databases you want to check - default is all ; for more than one, delimit with spaces e.g. DBLIST="one two three"

       INDEXLIST - a list of indexes to show for each named database - default is none; specify all for all indexes, or named e.g. INDEXLIST="id2entry entryrdn"

       VERBOSE - output level - 0 == suitable for parsing by a script - 1 == has column headings - 2 == provides detailed descriptions of the data - default is 0


EXAMPLE
       INCR=1 SERVID=slapd-localhost BINDDN="cn=directory manager" BINDPW="secret" VERBOSE=2 dbmon.sh


AUTHOR
       dbmon.sh was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2017 Red Hat, Inc.



                                                                                                 Mar 20, 2017                                                                                     DBMON.SH(8)
