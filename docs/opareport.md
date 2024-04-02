
opareport(8)                                                                                IFSFFCLIRG (Man Page)                                                                                opareport(8)



NAME
       opareport



       (All)  Provides  powerful  fabric  analysis  and  reporting capabilities. Must be run on a host connected to the Intel(R) Omni-Path Fabric with the Intel(R) Omni-Path Fabric Suite FastFabric Toolset
       installed.

Syntax
       opareport [-v][-q] [-h hfi] [-p port] [--timeout] [-o report]
       [-d detail] [-P|-H] [-N] [-x] [-X snapshot_input] [-T topology_input]
       [-s] [-r] [-V] [-i seconds] [-b date_time] [-e date_time] [-C] [-a] [-m]
       [-M] [-A] [-c file] [-L] [-F point] [-S point] [-D point] [-Q]

Options
       --help    Produces full help text.


       -v/--verbose
                 Returns verbose output.


       -q/--quiet
                 Disables progress reports.


       -h/--hfi hfi
                 Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       -p/--port port
                 Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.


       --timeout Specifies the timeout (wait time for response) in ms. Default is 1000 ms.


       -o/--output report
                 Specifies the report type for output. Refer to Report Types for details.


       -d/--detail level
                 Specifies the level of detail 0-n for output. Default is 2.


       -P/--persist
                 Only includes data persistent across reboots.


       -H/--hard Only includes permanent hardware data.


       -N/--noname
                 Omits node and IOC names.


       -x/--xml  Produces output in XML.


       -X/--infile snapshot_input
                 Generates a report using the data in the snapshot_input file. snapshot_input must have been generated during a previous -o snapshot run. When used, the -s,  -i,  -C,  and  -a  options  are
                 ignored. '-' may be used as the snapshot_input to specify stdin.


       -T/--topology topology_input
                 Uses topology_input file to augment and verify fabric information. When used, various reports can be augmented with information not available electronically (such as cable labels). '-' may
                 be used to specify stdin.


       -s/--stats
                 Gets performance statistics for all ports.


       -i/--interval seconds
                 Obtains performance statistics over interval seconds. Clears all statistics, waits interval seconds, then generates report. Implies -s option.


       -b/--begin date_time
                 Obtains past performance stats over an interval beginning at date_time. Implies -s option. date_time may be a time entered as HH:MM[:SS] or date as mm/dd/YYYY,  dd.mm.YYYY,  YYYY-mm-dd  or
                 date followed by time; for example, "2016-07-04 14:40". Relative times are taken as "x [second|minute|hour|day](s) ago.


       -e/--end date_time
                 Obtains past performance stats over an interval ending at date_time. Implies -s option.


                 date_time  may be a time entered as HH:MM[:SS] or date as mm/dd/YYYY, dd.mm.YYYY, YYYY-mm-dd or date followed by time; for example, "2016-07-04 14:40". Relative times are taken as "x [sec‐
                 ond|minute|hour|day](s) ago.

       -C/--clear
                 Clears performance statistics for all ports. Only statistics with error thresholds are cleared. A clear occurs after generating the report.


       -a/--clearall
                 Clears all performance statistics for all ports.


       -m/--smadirect
                 Accesses fabric information directly from SMA.


       -M/--pmadirect
                 Accesses performance statistics using direct PMA.


       -A/--allports
                 Gets PortInfo for down switch ports. Uses direct SMA to get this data. If used with -M, also gets PMA stats for down switch ports.


       -c/--config file
                 Specifies the error thresholds configuration file. Default is /etc/opa/opamon.conf file.


       -L/--limit
                 Limits operation to exact specified focus with -F for port error counters check (-o errors) and port counters clear (-C or -i). Normally,  the  neighbor  of  each  selected  port  is  also
                 checked/cleared. Does not affect other reports.


       -F/--focus point
                 Specifies the focus area for report.


                 Limits  output  to  reflect  a  subsection of the fabric. May not work with all reports. (For example, route, mcgroups, and the verify* reports may ignore the option or not generate useful
                 results.)

       -S/--src point
                 Specifies the source for trace route. Default is local port.


       -D/--dest point
                 Specifies the destination for trace route.


       -Q/--quietfocus
                 Excludes focus description from report.



-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.



Snapshot-Specific Options
       -r/--routes
                 Gets routing tables for all switches.


       -V/--vltables
                 Gets the P-Key tables for all nodes and the QoS VL-related tables for all ports.



Report Types
       comps     Summary of all systems and SMs in fabric.


       brcomps   Brief summary of all systems and SMs in fabric.


       nodes     Summary of all node types and SMs in fabric.


       brnodes   Brief summary of all node types and SMs in fabric.


       ious      Summary of all IO units in the fabric.


       lids      Summary of all LIDs in the fabric.


       links     Summary of all links.


       extlinks  Summary of links external to systems.


       filinks   Summary of links to FIs.


       islinks   Summary of inter-switch links.


       extislinks
                 Summary of inter-switch links external to systems.


       slowlinks Summary of links running slower than expected.


       slowconfiglinks
                 Summary of links configured to run slower than supported, includes slowlinks.


       slowconnlinks
                 Summary of links connected with mismatched speed potential, includes slowconfiglinks.


       misconfiglinks
                 Summary of links configured to run slower than supported.


       misconnlinks
                 Summary of links connected with mismatched speed potential.


       errors    Summary of links whose errors exceed counts in the configuration file.


       otherports
                 Summary of ports not connected to the fabric.


       linear    Summary of linear forwarding data base (FDB) for each switch.


       mcast     Summary of multicast FDB for each switch in the fabric.


       mcgroups  Summary of multicast groups.


                 When used in conjunction with -d, the following report details are possible:


                 ·      -d0 : Shows the number of multicast groups

                 ·      -d1 : Shows a list of multicast groups

                 ·      -d2 : Shows a list of members per multicast group



                 This report can be used with option -X.

       portusage Summary of ports referenced in linear FDB for each switch, broken down by NodeType of DLID.


       pathusage Summary of number of FI to FI paths routed through each switch port.


       treepathusage
                 Analysis of number of FI to FI paths routed through each switch port for a FAT tree.


       portgroups
                 Summary of adaptive routing port groups for each switch.


       quarantinednodes
                 Summary of quarantined nodes.


       validateroutes
                 Validates all routes in the fabric.


       validatevlroutes
                 Validates all routes in the fabric using SLSC, SCSC, and SCVL tables.


       validatepgs
                 Validates all port groups in the fabric.


       validatecreditloops
                 Validates topology configuration of the fabric to identify any existing credit loops.


       validatevlcreditloops
                 Validates topology configuration of the fabric including SLSC, SCSC, and SCVL tables to identify any existing credit loops.


       validatemcroutes
                 Validates multicast routes of the fabric to identify loops in multicast forwarding tables and detect MFT-multicast membership inconsistencies.


       vfinfo    Summary of virtual fabric (vFabric) information.


       vfmember  Summary of vFabric membership information.


       dgmember  Summary of DeviceGroup membership information.


       verifyfis Compares fabric (or snapshot) FIs to supplied topology and identifies differences and omissions.


       verifysws Compares fabric (or snapshot) switches to supplied topology and identifies differences and omissions.


       verifynodes
                 Returns verifyfis and verifysws reports.


       verifysms Compares fabric (or snapshot) SMs to supplied topology and identifies differences and omissions.


       verifylinks
                 Compares fabric (or snapshot) links to supplied topology and identifies differences and omissions.


       verifyextlinks
                 Compares fabric (or snapshot) links to supplied topology and identifies differences and omissions. Limits analysis to links external to systems.


       verifyfilinks
                 Compares fabric (or snapshot) links to supplied topology and identify differences and omissions. Limits analysis to links to FIs.


       verifyislinks
                 Compares fabric (or snapshot) links to supplied topology and identify differences and omissions. Limits analysis to inter-switch links.


       verifyextislinks
                 Compares fabric (or snapshot) links to supplied topology and identify differences and omissions. Limits analysis to inter-switch links external to systems.


       verifyall Returns verifyfis, verifysws, verifysms, and verifylinks reports.


       all       Returns comps, nodes, ious, links, extlinks, slowconnlinks, and errors reports.


       route     Traces route between -S and -D points.


       bfrctrl   Reports Buffer Control Tables for all ports.


       snapshot  Outputs snapshot of the fabric state for later use as snapshot_input. This implies -x. May not be combined with other reports. When selected, -F, -P, -H, and -N options are ignored.


       topology  Outputs the topology of the fabric for later use as topology_input. This implies -x. May not be combined with other reports. Use with detail level 3 or more to get Port element under  Node
                 in output xml.


       none      No report, useful to clear statistics.



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


Examples
       opareport can generate hundreds of different reports. Commonly generated reports include the following:

       opareport -o comps -d 3
       opareport -o errors -o slowlinks
       opareport -o nodes -F portguid:0x00117500a000447b
       opareport -o nodes -F nodeguid:0x001175009800447b:port:1
       opareport -o nodes -F nodeguid:0x001175009800447b
       opareport -o nodes -F 'node:duster hfi1_0'
       opareport -o nodes -F 'node:duster hfi1_0:port:1'
       opareport -o nodes -F 'nodepat:d*'
       opareport -o nodes -F 'nodepat:d*:port:1'
       opareport -o nodes -F 'nodedetpat:compute*'
       opareport -o nodes -F 'nodedetpat:compute*:port:1'
       opareport -o nodes -F nodetype:FI
       opareport -o nodes -F nodetype:FI:port:1
       opareport -o nodes -F lid:1
       opareport -o nodes -F led:on opareport -o nodes -F led:off opareport -o nodes -F lid:1:node
       opareport -o nodes -F lid:1:port:2
       opareport -o nodes -F gid:0xfe80000000000000:0x00117500a000447b
       opareport -o nodes -F systemguid:0x001175009800447b
       opareport -o nodes -F systemguid:0x001175009800447b:port:1
       opareport -o nodes -F iocguid:0x00117501300001e0
       opareport -o nodes -F iocguid:0x00117501300001e0:port:2
       opareport -o nodes -F 'ioc:Chassis 0x001175005000010C, Slot 2, IOC 1'
       opareport -o nodes -F 'ioc:Chassis 0x001175005000010C, Slot 2, IOC 1:port:2'
       opareport -o nodes -F 'iocpat:*Slot 2*'
       opareport -o nodes -F 'iocpat:*Slot 2*:port:2'
       opareport -o nodes -F ioctype:SRP opareport -o nodes -F ioctype:SRP:port:2
       opareport -o extlinks -F rate:100g
       opareport -o extlinks -F portstate:armed
       opareport -o extlinks -F portphysstate:linkup
       opareport -o extlinks -F 'labelpat:S1345*'
       opareport -o extlinks -F 'lengthpat:11m'
       opareport -o extlinks -F 'cabledetpat:*hitachi*'
       opareport -o extlinks -F 'linkdetpat:*core ISL*'
       opareport -o extlinks -F 'portdetpat:*mgmt*'
       opareport -o links -F mtucap:2048
       opareport -o nodes -F sm
       opareport -o nodes -F 'smdetpat:primary*'
       opareport -o nodes -F 'route:node:duster hfi1_0:node:cuda hfi1_0'
       opareport -o nodes -F 'route:node:duster hfi1_0:port:1:node:cuda hfi1_0:port:2'
       opareport -s -o snapshot > file
       opareport -o topology > topology.xml
       opareport -o errors -X file
       opareport -s --begin "2 days ago"
       opareport -s --begin "12:30" --end "14:00"




Other Information
       opareport  also supports operation with the Fabric Manager Performance Manager (PM)/Performance Manager Agent (PMA). When opareport detects the presence of a PM, it automatically issues any required
       PortCounter queries and clears to the PM to access the PMs running totals. If a PM is not detected, then opareport directly accesses the PMAs on all the nodes. The -M option can force access to  the
       PMA even if a PM is present.

       opareport takes advantage of these interfaces to obtain extensive information about the fabric from the subnet manager and the end nodes. Using this information, opareport is able to cross-reference
       it and produce analysis greatly beyond what any single subnet manager request could provide. As such, it exceeds the capabilities previously available in tools such as opasaquery and opafabricinfo.

       opareport obtains and displays counters from the Fabric Manager PM/PA or directly from the fabric PMAs using the -M option.

       opareport internally cross-references all this information so its output can be in user-friendly form. Reports include GUIDs, LIDs, and names for components. Obviously, these reports are easiest  to
       read  if  the  end  user has taken the time to provide unique names for all the components in the fabric (node names and IOC names). All Intel components support this capability. For hosts, the node
       names are automatically assigned based on the network host name of the server. For switches and line cards, the names can be assigned using the element managers for each component.

       Each run of opareport obtains up-to-date information from the fabric. At the start of the run opareport takes a few seconds to obtain all the fabric data, then it is output to  stdout.  The  reports
       are sorted by GUIDs and other permanent information so they can be rerun in the future and produce output in the same order even if components have been rebooted. This is useful for comparison using
       simple tools like diff. opareport permits multiple reports to be requested for a single run (for example, one of each report type).

       By default, opareport uses the first active port on the local system. However, if the Management Node is connected to more than one fabric (for example, a subnet), the Intel(R) Omni-Path Host Fabric
       Interface (HFI) and port may be specified to select the fabric to analyze.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                  opareport(8)
