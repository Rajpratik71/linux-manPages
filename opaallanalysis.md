
opaallanalysis(8)                                                                           IFSFFCLIRG (Man Page)                                                                           opaallanalysis(8)



NAME
       opaallanalysis



       (All) opaallanalysis command performs the set of analysis specified in FF_ALL_ANALYSIS and can be specified for fabric, chassis, esm, or hostsm.

Syntax
       opaallanalysis [-b|-e] [-s] [-d dir] [-c file] [-t portsfile]
       [-p ports] [-F chassisfile] [-H 'chassis'] [-G esmchassisfile]
       [-E esmchassis] [-T topology_input]

Options
       --help    Produces full help text.

       -b        Sets the baseline mode. Default is compare/check mode.

       -e        Evaluates health only. Default is compare/check mode.

       -s        Saves history of failures (errors/differences).

       -d dir    Identifies the top-level directory for saving baseline and history of failed checks. Default is /var/usr/lib/opa/analysis

       -c file   Specifies the error thresholds configuration file. Default is /etc/opa/opamon.conf

       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabric(s) for analysis. Default is /etc/opa/ports

       -p ports  Specifies the list of local HFI ports used to access fabric(s) for analysis. Default is the first active port. Specified as HFI:port as follows:



                 0:0       First active port in system.




                 0:y       Port y within system.




                 x:0       First active port on HFI x.




                 x:y       HFI x, port y.


       -F chassisfile
                 Specifies the file with a chassis in a cluster. Default is /etc/opa/chassis

       -H 'chassis'
                 Specifies the list of chassis on which to execute the command.

       -G esmchassisfile
                 Specifies the file with embedded SM chassis in the cluster. Default is /etc/opa/esm_chassis

       -E esmchassis
                 Specifies the list of embedded SM chassis to analyze.

       -T topology_input
                 Specifies the name of topology input file to use. Any %P markers in this filename are replaced with the HFI:port being operated on, such as 0:0 or 1:2. Default is /etc/opa/topology.%P.xml.
                 If -T NONE is specified, no topology input file is used. See opareport for more information.

Example
       opaallanalysis
       opaallanalysis -p '1:1 2:1'

Environment Variables
       The following environment variables are also used by this command:

       PORTS     List of ports, used in absence of -t and -p.

       PORTS_FILE
                 File containing list of ports, used in absence of -t and -p.

       FF_TOPOLOGY_FILE
                 File containing topology_input (may have %P marker in filename), used in absence of -T.

       CHASSIS   List of chassis, used if -F and -H options are not supplied.

       CHASSIS_FILE
                 File containing list of chassis, used if -F and -H options are not supplied.

       ESM_CHASSIS
                 List of SM chassis, used if -G and -E options are not supplied.

       ESM_CHASSIS_FILE
                 File containing list of SM chassis, used if -G and -E options are not supplied.

       FF_ANALYSIS_DIR
                 Top level directory for baselines and failed health checks.

       FF_CHASSIS_CMDS
                 List of commands to issue during analysis, unused if -e option supplied.

       FF_CHASSIS_HEALTH
                 Single command to issue to check overall health during analysis, unused if -b option supplied

Details
       The opaallanalysis command performs the set of analysis specified in FF_ALL_ANALYSIS, which must be a space-separated list. This can be provided by  the  environment  or  using  /etc/opa/opafastfab‐
       ric.conf. The analysis set includes the options: fabric, chassis, esm, or hostsm. For a fabric with only externally managed switches, FF_ALL_ANALYSIS should be set to -fabric in opafastfabric.conf.

       Note  that  the  opaallanalysis command has options which are a super-set of the options for all other analysis commands. The options are passed along to the respective tools as needed. For example,
       the -c file option is passed on to opafabricanalysis if it is specified in FF_ALL_ANALYSIS.

       The output files are all the output files for the FF_ALL_ANALYSIS selected set of analysis. See the previous sections for the specific output files.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                             opaallanalysis(8)
