
opaextractperf(8)                                                                           IFSFFCLIRG (Man Page)                                                                           opaextractperf(8)



NAME
       opaextractperf



       Provides  a  report of all performance counters in a CVS format suitable for importing into a spreadsheet or parsed by other scripts for further analysis. It generates a detailed opareport component
       summary report and pipes the result to opaxmlextract, extracting element values for NodeDesc, SystemImageGUID, PortNum, and all the performance counters. Extraction is performed only from  the  Sys‐
       tems portion of the report, which does not contain Neighbor information (the Neighbor and SMs portions are suppressed).

Syntax
       opaextractperf [opareport options]

Options
       --help    Produces full help text.


       opareport options
                 The following options are passed to opareport. This subset is considered typical and useful for this command. By design, the tool ignores -o/--output report option.




                 -h/--hfi hfi
                           Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.





                 -p/--port port
                           Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.





                 -X/--infile snapshot_input
                           Generates a report using the data in the snapshot_input file. snapshot_input must have been generated during a previous -o snapshot run. When used, the -s, -i, -C, and -a options
                           are ignored. '-' may be used as the snapshot_input to specify stdin.





                 -T/--topology topology_input
                           Uses topology_input file to augment and verify fabric information. When used, various reports can be augmented with  information  not  available  electronically  (such  as  cable
                           labels). '-' may be used to specify stdin.





                 -i/--interval seconds
                           Obtains performance statistics over interval seconds. Clears all statistics, waits interval seconds, then generates report. Implies -s option.





                 -b / --begin date_time
                           Obtains  past performance stats over an interval beginning at date_time. Implies -s option. date_time may be a time entered as HH:MM[:SS] or date as mm/dd/YYYY, dd.mm.YYYY, YYYY-
                           mm-dd or date followed by time; for example, "2016-07-04 14:40". Relative times are taken as "x [second|minute|hour|day](s) ago.





                 -e / --end date_time
                           Obtains past performance stats over an interval ending at date_time. Implies -s option.


                           date_time may be a time entered as HH:MM[:SS] or date as mm/dd/YYYY, dd.mm.YYYY, YYYY-mm-dd or date followed by time; for example, "2016-07-04 14:40". Relative times are taken as
                           "x [second|minute|hour|day](s) ago.




                 -C/--clear
                           Clears performance statistics for all ports. Only statistics with error thresholds are cleared. A clear occurs after generating the report.





                 -a/--clearall
                           Clears all performance statistics for all ports.





                 -M/--pmadirect
                           Accesses performance statistics using direct PMA.





                 -A/--allports
                           Gets PortInfo for down switch ports. Uses direct SMA to get this data. If used with -M, also gets PMA stats for down switch ports.





                 -F/--focus point
                           Specifies the focus area for report. Used for all reports except route to limit scope of report. Refer to Point Syntax for details.




-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.



Point Syntax
       gid:value value is numeric port GID of form: subnet:guid.


       lid:value value is numeric LID.


       lid:value:node
                 value is numeric LID, selects entire node with given LID.


       lid:value:port:value2
                 value is numeric LID of node, value2 is port number.


       portguid:value
                 value is numeric port GUID.


       nodeguid:value
                 value is numeric node GUID.


       nodeguid:value1:port:value2
                 value1 is numeric node GUID, value2 is port number.


       iocguid:value
                 value is numeric IOC GUID.


       iocguid:value1:port:value2
                 value1 is numeric IOC GUID, value2 is port number.


       systemguid:value
                 value is numeric system image GUID.


       systemguid:value1:port:value2
                 value1 is the numeric system image GUID, value2 is port number.


       ioc:value value is IOC Profile ID String (IOC Name).


       ioc:value1:port:value2
                 value1 is IOC Profile ID String (IOC Name), value2 is port number.


       iocpat:value
                 value is glob pattern for IOC Profile ID String (IOC Name).


       iocpat:value1:port:value2
                 value1 is glob pattern for IOC Profile ID String (IOC Name), value2 is port number.


       ioctype:value
                 value is IOC type (SRP or OTHER).


       ioctype:value1:port:value2
                 value1 is IOC type (SRP or OTHER); value2 is port number.


       node:value
                 value is node description (node name).


       node:value1:port:value2
                 value1 is node description (node name), value2 is port number.


       nodepat:value
                 value is glob pattern for node description (node name).


       nodepat:value1:port:value2
                 value1 is the glob pattern for the node description (node name), value2 is port number.


       nodedetpat:value
                 value is glob pattern for node details.


       nodedetpat:value1:port:value2
                 value1 is the glob pattern for the node details, value2 is port number.


       nodetype:value
                 value is node type (SW or FI).


       nodetype:value1:port:value2
                 value1 is node type (SW or FI), value2 is port number.


       rate:value
                 value is string for rate (25g, 50g, 75g, 100g), omits switch mgmt port 0.


       portstate:value
                 value is a string for state (down, init, armed, active, notactive, initarmed).


       portphysstate:value
                 value is a string for PHYs state (polling, disabled, training, linkup, recovery, offline, test)


       mtucap:value
                 value is MTU size (2048, 4096, 8192, 10240), omits switch mgmt port 0.


       labelpat:value
                 value is glob pattern for cable label.


       lengthpat:value
                 value is glob pattern for cable length.


       cabledetpat:value
                 value is glob pattern for cable details.


       cabinflenpat:value
                 value is glob pattern for cable info length.


       cabinfvendnamepat:value
                 value is glob pattern for cable info vendor name.


       cabinfvendpnpat:value
                 value is glob pattern for cable info vendor part number.


       cabinfvendrevpat:value
                 value is glob pattern for cable info vendor revision.


       cabinfvendsnpat:value
                 value is glob pattern for cable info vendor serial number.


       cabinftype:value
                 value is either optical, passive_copper, active_copper, or unknown.


       linkdetpat:value
                 value is glob pattern for link details.


       portdetpat:value
                 value is glob pattern for port details.


       sm        Specifies the master subnet manager (SM).


       smdetpat:value
                 value is glob pattern for SM details.


       route:point1:point2
                 Specifies all ports along the routes between the two given points.


       led:value value is either on or off for LED port beacon.


       linkqual:value
                 Specifies the ports with a link quality equal to value.


       linkqualLE:value
                 Specifies the ports with a link quality less than or equal to value.


       linkqualGE:value
                 Specifies the ports with a link quality greater than or equal to value.



       The portion of the script that calls opareport and opaxmlextract follows:

       opareport -o comps -s -x -d 10 $@ | opaxmlextract -d ;
       -e NodeDesc -e SystemImageGUID -e PortNum -e XmitDataMB
       -e XmitData -e XmitPkts -e RcvDataMB -e RcvData -e RcvPkts
       -e SymbolErrors -e LinkErrorRecovery -e LinkDowned -e PortRcvErrors
       -e PortRcvRemotePhysicalErrors -e PortRcvSwitchRelayErrors
       -e PortXmitDiscards -e PortXmitConstraintErrors
       -e PortRcvConstraintErrors -e LocalLinkIntegrityErrors
       -e ExcessiveBufferOverrunErrors -e VL15Dropped -s Neighbor -s SMs



Example
       opaextractperf
       opaextractperf -h 1 -p 2



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                             opaextractperf(8)
