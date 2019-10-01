DBSCAN(1)                                                                                  General Commands Manual                                                                                  DBSCAN(1)



NAME
       dbscan - scans a Directory Server database index file and dumps the contents

SYNOPSIS
       dbscan -f <filename> [-R] [-t <size>] [-K <entry_id>] [-k <key>] [-l <size>] [-G <n>] [-n] [-r] [-s]

DESCRIPTION
       Scans a Directory Server database index file and dumps the contents.

OPTIONS
       A summary of options is included below:

       -f <filename>
              specify db file

       -R     dump as raw data

       -t <size>
              entry truncate size (bytes)

              entry file options:

       -K <entry_id>
              lookup only a specific entry id index file options:

       -k <key>
              lookup only a specific key

       -l <size>
              max length of dumped id list (default 4096; 40 bytes <= size <= 1048576 bytes)

       -G <n> only display index entries with more than <n> ids

       -n     display ID list lengths

       -r     display the conents of ID list

       -s     Summary of index counts

USAGE
       Sample usages:

       Dump the entry file:
              dbscan -f id2entry.db4

       Display index keys in cn.db4:
              dbscan -f cn.db4

       Display index keys and the count of entries having the key in mail.db4:
              dbscan -r -f mail.db4

       Display index keys and the IDs having more than 20 IDs in sn.db4:
              dbscan -r -G 20 -f sn.db4

       Display summary of objectclass.db4:
              dbscan -f objectclass.db4

AUTHOR
       dbscan was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This  is  free  software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license is essentially the
       GNU General Public License version 2 with an exception for plug-in distribution.



                                                                                                March 31, 2017                                                                                      DBSCAN(1)
