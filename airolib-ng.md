AIROLIB-NG(1)                                                 General Commands Manual                                                AIROLIB-NG(1)

NAME
       airolib-ng - manage and create a WPA/WPA2 pre-computed hashes tables

SYNOPSIS
       airolib-ng <database> <operation> [options]

DESCRIPTION
       airolib-ng  is a tool for the aircrack-ng suite to store and manage essid and password lists, compute their Pairwise Master Keys (PMKs) and
       use them in WPA/WPA2 cracking. The program uses the lightweight SQLite3 database as the storage mechanism which is available on most  plat‐
       forms. The SQLite3 database was selected taking in consideration platform availability plus management, memory and disk overhead.

DATABASE
       database
              It is name of the database file. Optionally specify the full path.

OPERATION
       --stats
              Output information about the database.

       --sql <sql>
              Execute specified SQL statement.

       --clean [all]
              Clean the database from old junk. When specifying 'all', it will also reduce filesize if possible and run an integrity check.

       --batch
              Start batch-processing all combinations of ESSIDs and passwords.

       --verify [all]
              Verify a set of randomly chosen PMKs. If 'all' is given, all invalid PMK in the database will be deleted.

       --import [essid|passwd] <file>
              Import a flat file as a list of ESSIDs or passwords.

       import cowpatty <file>
              Import a coWPAtty file.

       --export cowpatty <essid> <file>
              Export to a cowpatty file.

AUTHOR
       This manual page was written by Thomas d'Otreppe.  Permission is granted to copy, distribute and/or modify this document under the terms of
       the GNU General Public License, Version 2 or any later version published by the Free Software Foundation On Debian  systems,  the  complete
       text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

SEE ALSO
       airbase-ng(8)
       aireplay-ng(8)
       airmon-ng(8)
       airodump-ng(8)
       airodump-ng-oui-update(8)
       airserv-ng(8)
       airtun-ng(8)
       besside-ng(8)
       easside-ng(8)
       tkiptun-ng(8)
       wesside-ng(8)
       aircrack-ng(1)
       airdecap-ng(1)
       airdecloak-ng(1)
       besside-ng-crawler(1)
       buddy-ng(1)
       ivstools(1)
       kstats(1)
       makeivs-ng(1)
       packetforge-ng(1)
       wpaclean(1)
       airventriloquist(8)

Version 1.5.2                                                      December 2018                                                     AIROLIB-NG(1)
