
opagenswitches(8)                                                                           IFSFFCLIRG (Man Page)                                                                           opagenswitches(8)



NAME
       opagenswitches



       Analyzes the present fabric and produces a list of Externally Managed switches in the required format for the /etc/opa/switches file.

Syntax
       opagenswitches [-t portsfile] [-p ports] [-R] [-L switches_file]
       [-o output_file] [-T topology_file] [-X snapshot_file] [-s] [-v level] [-K]

Options
       --help    Produces full help text.

       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabric(s) for analysis.
                 Default is /etc/opa/ports file.

       -p ports  Specifies the list of local HFI ports used to access fabrics for counter clear.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0       First active port on HFI x.





                 x:y       HFI x, port y.



       -R        Does not attempt to get routes for computation of distance.

       -s        Updates/resolves switch names using topology XML data.

       -L switches_file
                 Specifies  the  name  of  a  pre-existing switches_file to be used as input in conjunction with a topology file. When specified, the file is used instead of switches data obtained from the
                 actual fabric. The updated switches data is output to stdout (common to all opagenswitches operations). Does not generate switches data. Must also use -s option.


       -o output_file
                 Writes switches data to output_file. Default is stdout.

       -T topology_file
                 Specifies topology_file to use. May contain '%P' . Must also use -s.


                 Link data in the topology file is compared to actual fabric link data (obtained by opareport -o links or opareport -X snapshot -o links). The data is also matched to a list of switch  node
                 GUIDs  and  the  switch  NodeDesc values are generated. This list is then applied to the switches data to update NodeDesc values. The comparison of topology link data to actual fabric link
                 data starts with the host names. The host names in the actual fabric must match those in the topology file for the comparison to succeed. However, the comparison logic allows for some mis‐
                 matches, which could be due to swapped or missing cables. Switch NodeDesc values are matched to GUIDs based on which switch has the greater number of matching links.

       -X snapshot_file
                 Uses snapshot_file XML for fabric link information.
                 May contain '%P' . Must also use -s.

       -v level  Specifies the verbose level. Default is 0. Values include:



                 0         No output.




                 1         Progress output.




                 2         Reserved.




                 4         Time stamps.




                 8         Reserved.


       -K        Does  not  clean temporary files. Temporary files are CSV format and contain lists of links used during script operation. The files are not normally needed after execution, but they can be
                 retained for subsequent inspection or processing.


Environment Variables
       The following environment variables are also used by this command:

       PORTS     List of ports, used in absence of -t and -p.

       PORTS_FILE
                 File containing list of ports, used in absence of -t and -p.

       FF_TOPOLOGY_FILE
                 File containing topology XML data, used in absence of -T.

Examples
       opagenswitches
       opagenswitches -p '1:1 2:1'
       opagenswitches -o switches
       opagenswitches -s -o switches
       opagenswitches -L switches -s -o switches
       opagenswitches -s -T topology.%P.xml
       opagenswitches -L switches -s -T topology.%P.xml -X snapshot.%P.xml



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                             opagenswitches(8)
