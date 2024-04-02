
opafabricinfo(1)                                                                            IFSFFCLIRG (Man Page)                                                                            opafabricinfo(1)



NAME
       opafabricinfo



       Provides a brief summary of the components in the fabric, using the first active port on the given local host to perform its analysis. opafabricinfo is supplied in both:

       ·      Intel(R) Omni-Path Fabric Suite FastFabric Toolset In this situation, the command can manage more than one fabric (subnet).


       ·      FastFabric Tools In this situation, the command performs analysis against the first active port on the system only. It takes no options and uses no environment variables.


       opafabricinfo  can  be  very  useful as a quick assessment of the fabric state. It can be run against a known good fabric to identify its components and then later run to see if anything has changed
       about the fabric configuration or state.

       For more extensive fabric analysis, use opareport, opareports, and opatop. These tools can be found in the Intel(R) Omni-Path Fabric Suite FastFabric User Guide


Syntax
       opafabricinfo [-t portsfile] [-p ports]

Options
       --help    Produces full help text.

       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabric(s) for analysis. Default is /etc/opa/ports file.

       -p ports  Specifies the list of local HFI ports used to access fabrics for analysis.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0       First active port on HFI x.





                 x:y       HFI x, port y.



Environment Variables
       The following environment variables are also used by this command:

       PORTS     List of ports, used in absence of -t and -p.

       PORTS_FILE
                 File containing list of ports, used in absence of -t and -p.


                 For simple fabrics, the Intel(R) Omni-Path Fabric Suite FastFabric Toolset host is connected to a single fabric. By default, the first active port on the FastFabric Toolset host is used to
                 analyze the fabric. However, in more complex fabrics, the FastFabric Toolset host may be connected to more than one fabric or subnet. In this case, you can specify the ports or HFIs to use
                 with one of the following methods:


                 ·      On the command line using the -p option.

                 ·      In a file specified using the -t option.

                 ·      Through the environment variables PORTS or PORTS_FILE.

                 ·      Using the ports_file configuration option in opafastfabric.conf.



                 If the specified port does not exist or is empty, the first active port on the local system is used. In more complex configurations, you must specify the exact ports to use for all fabrics
                 to be analyzed.

Example
       opafabricinfo
       opafabricinfo -p '1:1 1:2 2:1 2:2'

       Output example

       # opafabricinfo
       Fabric 0:0 Information:
       SM: hds1fnb6241 hfi1_0 Guid: 0x0011750101575ffe State: Master
       Number of HFIs: 8
       Number of Switches: 1
       Number of Links: 8
       Number of HFI Links: 8 (Internal: 0 External: 8)
       Number of ISLs: 0 (Internal: 0 External: 0)
       Number of Degraded Links: 0 (HFI Links: 0 ISLs: 0)
       Number of Omitted Links: 0 (HFI Links: 0 ISLs: 0)

Output Definitions
       SM        Each subnet manger (SM) running in the fabric is listed along with its node name, port GUID, and present SM state (Master, Standby, etc.).

       Number of HFIs
                 Number of unique host fabric interfaces (HFIs) in the fabric. An FI with two connected ports is counted as a single FI.




       NOTE: Fabric Interfaces include HFIs in servers as well as HFIs within I/O Modules, Native Storage, etc.



       Number of Switches
                 Number of connected switches in the fabric.

       Number of Links
                 Number of links in the fabric. Note that a large switch may have internal links.

       Number of HFI Links
                 Number of HFI links (Internal and External) in the fabric.

       Number of ISLs
                 Number of Interswitch Links (Internal and External) in the fabric.

       Number of Degraded Links
                 Number of degraded links (HSI and ISL) in the fabric.

       Number of Omitted Links
                 Number of omitted links (HSI and ISL) in the fabric.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                              opafabricinfo(1)
