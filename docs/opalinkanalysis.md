
opalinkanalysis(8)                                                                          IFSFFCLIRG (Man Page)                                                                          opalinkanalysis(8)



NAME
       opalinkanalysis



       (Switch) Encapsulates the capabilities for link analysis. Additionally, this tool includes cable and fabric topology verification capabilities. This tool is built on top of opareport (and its analy‐
       sis capabilities), and accepts the same syntax for input topology and snapshot files.

       In addition to being able to run assorted opareport link analysis reports, and generate human-readable output, this tool additionally analyzes the results and appends a  concise  summary  of  issues
       found to the FF_RESULT_DIR/punchlist.csv file.

Syntax
       opalinkanalysis [-U] [-t portsfile] [-p ports] [-T topology_input]
       [-X snapshot_input] [-x snapshot_suffix] [-c file] reports ...

Options
       --help    Produces full help text.


       -U        Omits unexpected devices and links in punchlist file from verify reports.


       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabric(s) for analysis. Default is /etc/opa/ports.


       -p ports  Specifies the list of local HFI ports used to access fabrics for analysis.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0       First active port on HFI x.





                 x:y       HFI x, port y.



       -T topology_input
                 Specifies  the  name  of  a  topology  input file to use. Any  %P markers in this filename are replaced with the hfi:port being operated on (such as 0:0 or 1:2). Default is /etc/opa/topol‐
                 ogy.%P.xml. If NONE is specified, does not use any topology_input files. See opareport for more information on topology_input files.


       -X snapshot_input
                 Performs analysis using data in  snapshot_input.  snapshot_input must have been generated via a previous opareport -o snapshot run. If an errors report is  specified,  snapshot  must  have
                 been  generated  with  the  opareport  -s  option. When this option is used, only one port may be specified to select a topology_input file (unless -T specified). When this option is used,
                 clearerrors and clearhwerrors reports are not permitted.


       -x snapshot_suffix
                 Creates a snapshot file per selected port. The files are created in FF_RESULT_DIR with names of the form: snapshotSUFFIX. HFI:PORT.xml.


       -c file   Specifies the error thresholds configuration file. The default is /etc/opa/opamon.si.conf.


       reports   Supports the following reports:



                 errors    Specifies link error analysis.





                 slowlinks Specifies links running slower than expected.





                 misconfiglinks
                           Specifies links configured to run slower than supported.





                 misconnlinks
                           Specifies links connected with mismatched speed potential.





                 all       Includes all reports above. (errors, slowlinks, misconfiglinks, and misconnlinks)





                 verifylinks
                           Verifies links against topology input.





                 verifyextlinks
                           Verifies links against topology input. Limits analysis to links external to systems.





                 verifyfilinks
                           Verifies links against topology input. Limits analysis to FI links.





                 verifyislinks
                           Verifies links against topology input. Limits analysis to inter-switch links.





                 verifyextislinks
                           Verifies links against topology input. Limits analysis to inter-switch links external to systems.





                 verifyfis Verifies FIs against topology input.





                 verifysws Verifies switches against topology input.





                 verifynodes
                           Verifies FIs and switches against topology input.





                 verifysms Verifies SMs against topology input.





                 verifyall Verifies links, FIs, switches, and SMs against topology input.





                 clearerrors
                           Clears error counters, uses PM if available.





                 clearhwerrors
                           Clears hardware error counters, bypasses PM.





                 clear     Includes clearerrors and clearhwerrors.




       A punchlist of bad links is also appended to the file: FF_RESULT_DIR/punchlist.csv

Examples
       opalinkanalysis errors
       opalinkanalysis errors clearerrors
       opalinkanalysis -p '1:1 1:2 2:1 2:2'

Environment Variables
       The following environment variables are also used by this command:

       PORTS     List of ports, used in absence of -t and -p.


       PORTS_FILE
                 File containing list of ports, used in absence of -t and -p.


       FF_TOPOLOGY_FILE
                 File containing topology_input, used in absence of -T.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                            opalinkanalysis(8)
