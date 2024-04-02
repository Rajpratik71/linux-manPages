HESINFO(1)                                                                                 General Commands Manual                                                                                 HESINFO(1)



NAME
       hesinfo - find out what is stored in the Hesiod database

SYNOPSIS
       hesinfo [-bl] HesiodName HesiodNameType

DESCRIPTION
       hesinfo takes two arguments, a name to be resolved and a string, known as a HesiodNameType.  It then prints the information returned by the Hesiod nameserver.

       The value returned by hesinfo is of the type HesiodNameType.

       hesinfo understands the following options:

       -l     Selects long format.

       -b     Prints the fully-qualified string passed to the nameserver.


   VALID Hesiod_Names
       The following types of identifiers may be used in the HesiodName argument to hesinfo.  These values will be resolved by accessing the hesiod database.


       <username>
              the 8-character-or-less string used to identify users or classes (e.g. joeuser, root, 1.00, etc).  Used with the Hesiod_Name_Types passwd, pobox, and filsys.



       <uid>  the id number assigned to a user.


       <groupid>
              the id number assigned to a group.


       <groupname>
              a name identifying a unique group.


       <file-system-name>
              the name of an athena file system.


       <rvd server>:<pack>
              the name of an rvd's server and pack  seperated by a colon.


       <nfs server>:<partition>
              the name of an nfs server and its partition seperated by a colon.


       <workstation-name>
              the machine name of an Athena workstation (e.g. E40-343-3).


       <service-name>
              name of an Athena service (e.g. Zephyr).


       <service-type>
              name of Unix service (valid entries are defined in /etc/services).


       <printer-name>
              name of a printer.


       <printer-cluster-name>
              name of an Athena print cluster.


       <foo>  some hesinfo calls (e.g.  prclusterlist ) do not require a specific HesiodName argument.  However, you must include a dummy string (e.g. 'foo') for hesinfo
               to work properly.





   VALID Hesiod_Name_Types
       The following symbols are valid substitutions for the HesiodNameType argument to hesinfo.


        passwd
              returns string suitable for inclusion in /etc/passwd, searching with <username>.


        pobox returns information on the pobox assigned to the user specified by HesiodName, searching with <username>.



        uid   returns string suitable for inclusion in /etc/passwd, searching with <uid>.


        gid   returns string suitable for inclusion in /etc/group, searching with <groupid>.


        group returns string suitable for inclusion in /etc/group, searching with <groupname>.


        grplist
              returns subgroups included in superset defined by <groupname>.


        filsys
              returns  file  system  type, export point, server, mount mode, and import point for the following valid HesiodNames (see above) - <file system name>, <username>, <rvd server>:<pack>, and <nfs
              server>:<partition>


        cluster
              returns information about the local cluster the workstation, specified by <workstation name>.  Included is information about the local file and print servers.  This information is accesses by
              clusterinfo at boot time.


        sloc  returns network name of service host for <service-name>.


        service
              returns Internet protocol type and protocol service port for <service-type>.


        pcap  returns a valid entry for /etc/printcap for <printer-name>.


        prcluserlist
              returns a list of print clusters.


        prcluster
              returns a list of printers in a cluster specified by <printer-cluster-name>.


FILES
       /etc/athena/hesiod.conf

SEE ALSO
       `Hesiod - Project Athena Technical Plan -- Name Service', named(8), hesiod(3)

AUTHOR
       Steve Dyer, IBM/Project Athena
       Copyright 1987, 1988, 1996 by the Massachusetts Institute of Technology.



                                                                                               27 October 1996                                                                                     HESINFO(1)
