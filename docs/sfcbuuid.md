
sfcbuuid(1)                                                                                General Commands Manual                                                                                sfcbuuid(1)



NAME
       sfcbuuid - Script to create a universally unique identifier for the installed Small-Footprint CIM Broker (sfcb)

SYNOPSIS
       sfcbuuid [options]

DESCRIPTION
       sfcbuuid  can  be  used  to  create  a  universally  unique  identifier (uuid) for sfcb. The uuid will be stored in a file (usually /var/lib/sfcb/uuid).  Whenever sfcb needs to return it's uuid to a
       requestor it will read the uuid file from this file.

OPTIONS
       -u uuidfile
              Full path name of the sfcb uuid file.  Default is /var/lib/sfcb/uuid

       -f     Remove an existing uuid file without asking for permission.

       -h     Display usage information and exit.

AUTHOR
       Viktor Mihajlovski <MIHAJLOV@de.ibm.com>

BUGS
       The SBLIM project maintains a mailing list to which you should direct all questions regarding sfcb, sfcc, wbemcli, or any of the SBLIM providers.  To subscribe to this mailing list visit

              http://lists.sourceforge.net/lists/listinfo/sblim-issues

       The SBLIM Project Bug tracking page can be found at

              http://sourceforge.net/tracker/?group_id=128809&atid=712784

COPYRIGHT
       (C) Copyright IBM Corp. 2004, 2005

AVAILABILITY
       The Small-Footprint CIM Broker (sfcb) is a part of the SBLIM project.  The most recent version is available on the web at

              http://sblim.sourceforge.net/

SEE ALSO
       sfcbd(1),




sfcbuuid Version 1.4.8                                                                           August 2005                                                                                      sfcbuuid(1)
