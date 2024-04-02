
sfcbmof(1)                                                                                 General Commands Manual                                                                                 sfcbmof(1)



NAME
       sfcbmof - MOF compile for the Small-Footprint CIM Broker (sfcb)

SYNOPSIS
       sfcbmof [options] infile...

DESCRIPTION
       The MOF compiler for sfcb generates binary class data from plaintext MOF class definitions.

OPTIONS
       -h     Display help message and exit.

       -v     Verbose mode.

       -V     Print version information and exit.

       -I includepath
              Directory to search for include files.

       -i extrafile
              File to load before parsing. This option can be used to preload the CIM schema or other pre-requisite classes.

       -o outfile
              Output file to generate. The default is mofc.out.

       -b backendopts
              Backend options. Refer to backend documentation.

LIBRARIES
       Requires libsfcBrokerCore.a

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
       sfcbd(1)



sfcbmof Version 0.7.3                                                                            August 2005                                                                                       sfcbmof(1)
