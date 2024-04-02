
opafabricanalysis(8)                                                                        IFSFFCLIRG (Man Page)                                                                        opafabricanalysis(8)



NAME
       opafabricanalysis



       (All) Performs analysis of the fabric.

Syntax
       opafabricanalysis [-b|-e] [-s] [-d dir] [-c file] [-t portsfile]
       [-p ports] [-T topology_input]

Options
       --help    Produces full help text.

       -b        Specifies the baseline mode. Default is compare/check mode.

       -e        Evaluates health only. Default is compare/check mode.

       -s        Saves history of failures (errors/differences).

       -d dir    Specifies the top-level directory for saving baseline and history of failed checks. Default is /var/usr/lib/opa/analysis

       -c file   Specifies the error thresholds config file.Default is /etc/opa/opamon.conf

       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabric(s) for analysis. Default is /etc/opa/ports

       -p ports  Specifies the list of local HFI ports used to access fabrics for analysis.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0       First active port on HFI x.





                 x:y       HFI x, port y.



       -T topology_input
                 Specifies  the  name  of  topology  input  file  to  use.  Any %P markers in this filename are replaced with the HFI:port being operated on (such as 0:0 or 1:2). Default is /etc/opa/topol‐
                 ogy.%P.xml. If -T NONE is specified, no topology input file is used. See Details and opareport for more information.

Example
       opafabricanalysis
       opafabricanalysis -p '1:1 1:2 2:1 2:2'

       The fabric analysis tool checks the following:

       ·      Fabric links (both internal to switch chassis and external cables)

       ·      Fabric components (nodes, links, SMs, systems, and their SMA configuration)

       ·      Fabric PMA error counters and link speed mismatches

       NOTE: The comparison includes components on the fabric. Therefore, operations such as shutting down a server cause the server to no longer appear on the fabric and are flagged as a fabric change  or
       failure by opafabricanalysis.


Environment Variables
       The following environment variables are also used by this command:

       PORTS     List of ports, used in absence of -t and -p.

       PORTS_FILE
                 File containing list of ports, used in absence of -t and -p.

       FF_TOPOLOGY_FILE
                 File containing topology_input (may have %P marker in filename), used in absence of -T.

       FF_ANALYSIS_DIR
                 Top-level directory for baselines and failed health checks.

Details
       For  simple  fabrics, the Intel(R) Omni-Path Fabric Suite FastFabric Toolset host is connected to a single fabric. By default, the first active port on the FastFabric Toolset host is used to analyze
       the fabric. However, in more complex fabrics, the FastFabric Toolset host may be connected to more than one fabric or subnet. In this case, you can specify the ports or HFIs to use with one  of  the
       following methods:

       ·      On the command line using the -p option.

       ·      In a file specified using the -t option.

       ·      Through the environment variables PORTS or PORTS_FILE.

       ·      Using the PORTS_FILE configuration option in opafastfabric.conf.

       If  the  specified  port  does not exist or is empty, the first active port on the local system is used. In more complex configurations, you must specify the exact ports to use for all fabrics to be
       analyzed.

       You can specify the topology_input file to be used with one of the following methods:

       ·      On the command line using the -T option.

       ·      In a file specified through the environment variable FF_TOPOLOGY_FILE.

       ·      Using the ff_topology_file configuration option in opafastfabric.conf.

       If the specified file does not exist, no topology_input file is used. Alternately the filename can be specified as NONE to prevent use of an input file.

       For more information on topology_input, refer to opareport

       By default, the error analysis includes PMA counters and slow links (that is, links running below enabled speeds). You can change this using the FF_FABRIC_HEALTH configuration parameter in  opafast‐
       fabric.conf. This parameter specifies the opareport options and reports to be used for the health analysis. It also can specify the PMA counter clearing behavior (-I seconds, -C, or none at all).

       When a topology_input file is used, it can also be useful to extend FF_FABRIC_HEALTH to include fabric topology verification options such as -o verifylinks.

       The thresholds for PMA counter analysis default to /etc/opa/opamon.conf. However, you can specify an alternate configuration file for thresholds using the -c option. The opamon.si.conf file can also
       be used to check for any non-zero values for signal integrity (SI) counters.

       All files generated by opafabricanalysis start with fabric in their file name. This is followed by the port selection option identifying the port used for the analysis. Default is 0:0.

       The opafabricanalysis tool generates files such as the following within FF_ANALYSIS_DIR :

       Health Check


       ·      latest/fabric.0:0.errors stdout of opareport for errors encountered during fabric error analysis.


       ·      latest/fabric.0.0.errors.stderr stderr of opareport during fabric error analysis.


       Baseline


       During a baseline run, the following files are also created in FF_ANALYSIS_DIR/latest.

       ·      baseline/fabric.0:0.snapshot.xml opareport snapshot of complete fabric components and SMA configuration.


       ·      baseline/fabric.0:0.comps opareport summary of fabric components and basic SMA configuration.


       ·      baseline/fabric.0.0.links opareport summary of internal and external links.


       Full Analysis


       ·      latest/fabric.0:0.snapshot.xml opareport snapshot of complete fabric components and SMA configuration.


       ·      latest/fabric.0:0.snapshot.stderr stderr of opareport during snapshot.


       ·      latest/fabric.0:0.errors stdout of opareport for errors encountered during fabric error analysis.


       ·      latest/fabric.0.0.errors.stderr stderr of opareport during fabric error analysis.


       ·      latest/fabric.0:0.comps stdout of opareport for fabric components and SMA configuration.


       ·      latest/fabric.0:0.comps.stderr stderr of opareport for fabric components.


       ·      latest/fabric.0:0.comps.diff diff of baseline and latest fabric components.


       ·      latest/fabric.0:0.links stdout of opareport summary of internal and external links.


       ·      latest/fabric.0:0.links.stderr stderr of opareport summary of internal and external links.


       ·      latest/fabric.0:0.links.diff diff of baseline and latest fabric internal and external links.


       ·      latest/fabric.0:0.links.changes.stderr stderr of opareport comparison of links.


       ·      latest/fabric.0:0.links.changes opareport comparison of links against baseline. This is typically easier to read than the links.diff file and contains the same information.


       ·      latest/fabric.0:0.comps.changes.stderr stderr of opareport comparison of components.


       ·      latest/fabric.0:0.comps.changes opareport comparison of components against baseline. This is typically easier to read than the comps.diff file and contains the same information.


       The .diff and .changes files are only created if differences are detected.

       If the -s option is used and failures are detected, files related to the checks that failed are also copied to the time-stamped directory name under FF_ANALYSIS_DIR.

Fabric Items Checked Against the Baseline
       Based on opareport -o links:

       ·      Unconnected/down/missing cables

       ·      Added/moved cables

       ·      Changes in link width and speed

       ·      Changes to Node GUIDs in fabric (replacement of HFI or Switch hardware)

       ·      Adding/Removing Nodes [FI, Virtual FIs, Virtual Switches, Physical Switches, Physical Switch internal switching cards (leaf/spine)]

       ·      Changes to server or switch names

       Based on opareport -o comps:

       ·      Overlap with items from links report

       ·      Changes in port MTU, LMC, number of VLs

       ·      Changes in port speed/width enabled or supported

       ·      Changes in HFI or switch device IDs/revisions/VendorID (for example, ASIC hardware changes)

       ·      Changes in port Capability mask (which features/agents run on port/server)

       ·      Changes to ErrorLimits and PKey enforcement per port

       ·      Changes to IOUs/IOCs/IOC Services provided



       Location (port, node) and number of SMs in fabric. Includes:

       ·      Primary and backups

       ·      Configured priority for SM

Fabric Items Also Checked During Health Check
       Based on opareport -s -C -o errors -o slowlinks:

       ·      PMA error counters on all Intel(R) Omni-Path Fabric ports (HFI, switch external and switch internal) checked against configurable thresholds.

       ·      Counters are cleared each time a health check is run. Each health check reflects a counter delta since last health check.

       ·      Typically identifies potential fabric errors, such as symbol errors.

       ·      May also identify transient congestion, depending on the counters that are monitored.

       ·      Link active speed/width as compared to Enabled speed.

       ·      Identifies links whose active speed/width is < min (enabled speed/width on each side of link).

       ·      This typically reflects bad cables or bad ports or poor connections.

       ·      Side effect is the verification of SA health.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                          opafabricanalysis(8)
