
wbemcat(1)                                                                                 General Commands Manual                                                                                 wbemcat(1)



NAME
       wbemcat - a multi-protocol CIM-XML client


SYNOPSIS
       wbemcatX [options] [FILE]

DESCRIPTION
       Utility  to  send raw CIM-XML request FILE to the a CIMOM and display the response/results. Default CIMOM is http://localhost:5988.  If no input file is specified then get XML data from stdin.  This
       used to be the wbemcatX utility before it officially replaced the original.

OPTIONS
       -t, --protocol=PROTOCOL
              Protocol with which to connect. Default=http

       -h, --host=HOSTNAME
              Name of host running the CIMOM. Default=localhost

       -p, --port=PORT
              Port that the CIMOM is listening on. Default=5988

       -?, --help
              Display help message and exit.

PREREQUISITES
AUTHOR
       Sean Swehla <smswehla@linux.vnet.ibm.com>

CONTRIBUTORS
BUGS
       The SBLIM project maintains a mailing list to which you should direct all questions regarding sfcb, sfcc, wbemcli, or any of the SBLIM providers.  To subscribe to this mailing list visit

              http://lists.sourceforge.net/lists/listinfo/sblim-issues

       The SBLIM Project Bug tracking page can be found at

              http://sourceforge.net/tracker/?group_id=128809&atid=712784

COPYRIGHT
       (C) Copyright IBM Corp. 2009

AVAILABILITY
       The Small-Footprint CIM Broker (sfcb) is a part of the SBLIM project.  The most recent version is available on the web at

              http://sblim.sourceforge.net/

SEE ALSO
       xmltest(1) wbemcat(1)






wbemcatX Version 1.4.8                                                                            April 2009                                                                                       wbemcat(1)
