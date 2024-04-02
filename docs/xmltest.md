
xmltest(1)                                                                                 General Commands Manual                                                                                 xmltest(1)



NAME
       xmltest - Test script to send CIM-XML (via wbemcat) to CIMOM and compare to known results

SYNOPSIS
       xmltest [FILE]

DESCRIPTION
       xmltest  is a script that is used to send a raw CIM-XML test file to the sfcb CIMOM (using wbemcat) and then compares the returned CIM-XML results against a previously determined 'OK' result file to
       check whether the returned results match the expected results. If there does not yet exist an 'OK' corresponding to the XML file then xmltest will save the returned results as the new  OK  file  for
       later use. If the returned CIM-XML results don't match the existing 'OK' file a new 'result' file will be generated containing the erroneous results.

       If no FILE is specified xmltest will use all files with a .xml extension in the current directory path.

EXAMPLE
       If there is no 'OK' file to compare returned CIM-XML results against xmltest will generate one.

              # xmltest test/getclass.Linux_OperatingSystem.xml

              Running test test/getclass.Linux_OperatingSystem.xml ... OK
              Saving response as test/getclass.Linux_OperatingSystem.OK

       If the returned CIM-XML results match the existing 'OK' file xmltest will signal that the test passed.

              # xmltest test/getclass.Linux_OperatingSystem.xml

              Running test test/getclass.Linux_OperatingSystem.xml ... Passed

       If the returned CIM-XML results don't match the existing 'OK' file xmltest will signal that the tes failed and generate a 'result' file containing the erroneous results.

              # xmltest test/getclass.Linux_OperatingSystem.xml

              Running test test/getclass.Linux_OperatingSystem.xml ... FAILED
              Check test/getclass.Linux_OperatingSystem.result for errors

PREREQUISITES
       Requires wbemcat on search path.

AUTHOR
       Dr. Gareth S. Bestor <bestor@us.ibm.com>

CONTRIBUTORS
       Adrian Schuur <schuur@de.ibm.com>

BUGS
       Does not adequately deal with additional http headers/footers caused by chunking responses, which will result in false failures when comparing results to existing "x.OK" files.

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
       wbemcat(1)



xmltest Version 1.4.8                                                                            August 2005                                                                                       xmltest(1)
