
opaextractmissinglinks(8)                                                                   IFSFFCLIRG (Man Page)                                                                   opaextractmissinglinks(8)



NAME
       opaextractmissinglinks



       Produces  a  CSV  file  listing  all or some of the links in the fabric. opaextractmissinglinks is a front end to the opareport tool that generates a report listing all or some of the links that are
       present in the supplied topology file, but are missing in the fabric. The output from this tool can be imported into a spreadsheet or parsed by other scripts.

Syntax
       opaextractmissinglinks [-T topology_input] [-o report]
       [opareport options]

Options
       --help    Produces full help text.


       -T/--topology topology_input
                 Uses topology_input file to augment and verify fabric information. When used, various reports can be augmented with information not available electronically (such as cable labels). '-' may
                 be used to specify stdin.


       -o/--output report
                 Specifies the report type for output. Refer to Report Types for details.


       opareport options
                 The following options are passed to opareport. This subset is considered typical and useful for this command.




                 -h/--hfi hfi
                           Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.





                 -p/--port port
                           Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.





                 -X/--infile snapshot_input
                           Generates a report using the data in the snapshot_input file. snapshot_input must have been generated during a previous -o snapshot run. When used, the -s, -i, -C, and -a options
                           are ignored. '-' may be used as the snapshot_input to specify stdin.





                 -F/--focus point
                           Specifies the focus area for report. Used for all reports except route to limit scope of report. Refer to Point Syntax for details.




-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.



Report Types
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
       List all the missing links in the fabric:
       opaextractmissinglinks

       List all the missing links to a switch named "coresw1":
       opaextractmissinglinks -T topology.0:0.xml -F "node:coresw1"

       List all the missing connections to end-nodes:
       opaextractmissinglinks -o verifyfilinks

       List all the missing links on the 2nd HFI's fabric of a multi-plane fabric:
       opaextractmissinglinks -h 2 -T /etc/opa/topology.2:1.xml

       List all the missing links between two switches:
       opaextractmissinglinks -o verifyislinks -T topology.0:0.xml



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                     opaextractmissinglinks(8)
