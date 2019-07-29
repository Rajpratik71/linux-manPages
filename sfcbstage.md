
sfcbstage(1)                                                                               General Commands Manual                                                                               sfcbstage(1)



NAME
       sfcbstage - Script to copy provider MOF and registration files to the Small-Footprint CIM Broker (sfcb) staging area

SYNOPSIS
       sfcbstage [options] [mof...]

DESCRIPTION
       sfcbstage  copies provider mof and registration files to the sfcb staging area.  Used to add classes to sfcb offline. The class repository must be rebuilt with sfcbrepos and the sfcb CIMOM restarted
       before changes take effect.

OPTIONS
       -n namespace
              Namespace for which the class MOFs are to be registered.  Default is root/cimv2

       -s stagingdir
              Path to sfcb staging area containing class MOFs and registration files Default is /var/lib/sfcb/stage

       -r registrationfile
              Path to the provider registration file.

       -h     Display usage information and exit.

       mof    Path(s) to one or more class MOF files containing the CIM class definitions for the class(es) implemented by the provider.

ENVIRONMENT
       DESTDIR
              If set, the value of this variable is prepended to the registration directory names. This can be useful to store the repository in a different location, i.e.  when cross-compiling providers.

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
       sfcbd(1), sfcbrepos(1), sfcbunstage(1)



sfcbstage Version 1.4.8                                                                          August 2005                                                                                     sfcbstage(1)
