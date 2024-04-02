
opasaquery(1)                                                                               IFSFFCLIRG (Man Page)                                                                               opasaquery(1)



NAME
       opasaquery



       (All) Performs various queries of the subnet manager/subnet agent and provides detailed fabric information.

       opareport  and  opareports  from  the  Intel(R) Omni-Path Fabric Suite can provide a more powerful tool. In some cases, opasaquery is preferred, especially when dealing with virtual fabrics, service
       records, and multicast.

       By default, opasaquery uses the first active port on the local system. However, if the node is connected to more than one fabric (for example, a subnet), the Intel(R) Omni-Path Host Fabric Interface
       (HFI) and port may be specified to select the fabric whose SA is to be queried.

Syntax
       opasaquery [-v [-v] [-v]] [-I] [-h hfi|-b addr] [-p port] [--timeout]
       [-x gid] [-E] [-T ssl_params] [-o type] [-l lid] [-t type] [-s guid]
       [-n guid] [-g guid] [-k pkey] [-i vfIndex] [-S serviceId] [-L sl]
       [-u gid] [-m gid] [-d nodeDescription] [-D dg_name] [-P 'guid guid']
       [-G 'gid gid'] [-H mask]

Options
       --help    Produces full help text.


       -v/--verbose
                 Returns verbose output. A second invocation activates openib debugging, a third invocation activates libibumad debugging.


       -I/--IB   Issues query in legacy InfiniBand* format.


       -h/--hfi hfi
                 Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       -b/--oob address
                 Specifies Out-of-Band address of node running the FE. Can be either hostname, IPv4, or IPv6 address. Default is "127.0.0.1".


       -p/--port port
                 Specifies the port.


                 ·      In-band: numbered 1..n. Using 0 specifies first active port. Default is 0.

                 ·      Out-of-band: Port FE is listening on. Default is 3245.




       --timeout Specifies the timeout (wait time for response) in ms. Default is 1000 ms.


       -x/--source-gid src_gid
                 Specifies the source GID of the local GID (This is required for most Path and Trace Record Queries when Out-of-Band.)


       -E/--feEsm
                 Specifies the ESM FE.


       -T/--ssl-params file
                 Specifies the SSL/TLS parameters XML file. Default is /etc/opa/opamgt_tls.xml.


       -o type   Output type for query. Default is node. See Output Types for details.


       -l/--lid lid
                 Query a specific LID.


       -t/--type node_type
                 Queries by node type. See Node Types for details.


       -s/--sysguid system_image_guid
                 Queries by system image GUID.


       -n/--nodeguid node_guid
                 Queries by node GUID.


       -g/--portguid port_guid
                 Queries by port GUID.


       -k/--pkey pkey
                 Queries a specific PKey.


       -i/--vfindex vfIndex
                 Queries a specific vfindex.


       -S/--serviceId serviceId
                 Queries a specific service ID.


       -L/--SL SL
                 Queries by service level.


       -u/--portgid port_gid
                 Queries by port GID. See GIDs for details.


       -m/--mcgid multicast_gid
                 Queries by multicast GID. See GIDs for details.


       -d/--desc node_description
                 Queries by node name/description.


       -D/--dgname dg_name
                 Queries by device group name/description


       -P/--guidpair guid guid
                 Queries by a pair of port GUIDs.


       -G/--gidpair gid gid
                 Queries by a pair of GIDs. See GIDs for details.



-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.


Node Types
       fi        Fabric Interface


       sw        Switch


GIDs
       Specifies a 64-bit subnet and 64-bit interface ID in the form:

       subnet:interface

       NOTE:  In  the following example, the GID corresponds to a PortGID. In this case, the interface ID coincides with the lower 64-bits of the GUID of the card. The interface ID will be different if the
       GID is a MGID (that is, multicast GID). See opafm.xml for MGID examples.


       0xfe80000000000000:0x00117500a0000380



Output Types
       Default is node.

       classportinfo
                 Specifies the classportinfo of the SA.


       systemguid
                 Lists the system image GUIDs.


       nodeguid  Lists the node GUIDs.


       portguid  Lists the port GUIDs.


       lid       Lists the LIDs.


       desc      Lists the node descriptions/names.


       path      Lists the path records.


       node      Lists the node records.


       portinfo  Lists the port info records.


       sminfo    Lists the SM info records.


       swinfo    Lists the switch info records.


       link      Lists the link records.


       scsc      Lists the SC to SC mapping table records.


       slsc      Lists the SL to SC mapping table records.


       scsl      Lists the SC to SL mapping table records.


       scvlt     Lists the SC to VLt table records.


       scvlr     Lists the SC to VLr table records.


       scvlnt    Lists the SC to VLnt table records.


       vlarb     Lists the VL arbitration table records.


       pkey      Lists the PKey table records.


       service   Lists the service records.


       mcmember  Lists the multicast member records.


       inform    Lists the inform info records.


       linfdb    Lists the switch linear forwarding database (FDB) records.


       mcfdb     Lists the switch multicast FDB records.


       trace     Lists the trace records.


       vfinfo    Lists the vFabrics.


       vfinfocsv Lists the vFabrics in CSV format.


       vfinfocsv2
                 Lists the vFabrics in CSV format with enums.


       fabricinfo
                 Specifies the summary of fabric devices.


       quarantine
                 Lists the quarantined nodes.


       conginfo  Lists the Congestion Info Records.


       swcongset Lists the Switch Congestion Settings.


       swportcong
                 Lists the Switch Port Congestion Settings.


       hficongset
                 Lists the HFI Congestion Settings.


       hficongcon
                 Lists the HFI Congestion Control Settings.


       bfrctrl   Lists the buffer control tables.


       cableinfo Lists the Cable Info records.


       portgroup Lists the AR Port Group records.


       portgroupfdb
                 Lists the AR Port Group FWD records.


       dglist    Lists the Device Group Names.


       dgmember  Lists the Device Group records.


       dtree     Lists the Device Tree records.


       swcost    Lists the switch cost records.


       The vfinfocsv and vfinfocsv2 output formats are designed to make it easier to script vfinfo queries. One line is output per vFabric of the form:

       name:index:pkey:sl:mtu:rate:optionflag::mcastSl



       The only difference between these two formats is how the MTU and rate are output. vfinfocsv outputs MTU and rate in human/text readable format.  vfinfocsv2  outputs  MTU  and  rate  as  enumerations
       defined for the SMA protocol. The opagetvf command is based on this capability of opasaquery. For more information, see opagetvf

Example
       opasaquery -o desc -t fi

Input Options vs. Output Permitted
       The following list shows the input (assorted query by options) and outputs (-o) that are permitted.

       None




                 -o output permitted
                           systemguid, nodeguid, portguid, lid, desc, path, node, portinfo, sminfo, swinfo, link, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, vfinfo, vfinfocsv, vfinfocsv2, scsc,
                           slsc, scvlt, scnlmt, linfdb, classportinfo, fabricinfo, quarantine, conginfo, swcongset, swportcong, hficongset, hficongcon, bfrctl, cableinfo, portgroup,  portgroupfdb,  dglist,
                           dgmember, dtree





                 -o output not permitted
                           trace




       -t node_type




                 -o output permitted
                           systemguid, nodeguid, portguid, lid, desc, node, dglist, dgmember, dtree





                 -o output not permitted
                           portinfo, sminfo, swinfo, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, trace, vfinfo, vfinfocsv, vfinfocsv2




       -l lid




                 -o output permitted
                           systemguid, nodeguid, portguid, lid, desc, path, node, portinfo, swinfo, slvl, vlarb, pkey, mcmember, linfdb, mcfdb, dgmember, dtree





                 -o output not permitted
                           sminfo, link, inform, service, trace, vfinfo, vfinfocsv, vfinfocsv2, dglist




       -k pkey




                 -o output permitted
                           mcmember, path, vfinfo, vfinfocsv, vfinfocsv2





                 -o output not permitted
                           systemimageguid, nodeguid, portguid, lid, desc, node, portinfo, sminfo, swinfo, link, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, dglist, dgmember, dtree




       -i        vfindex






                 -o output permitted
                           vfinfo, vfinfocsv, vfinfocsv2





                 -o output not permitted
                           systemimageguid, nodeguid, portguid, lid, desc, node, portinfo, sminfo, swinfo, link, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, dglist, dgmember, dtree




       -s system_image_guid




                 -o output permitted
                           systemguid, nodeguid, portguid, lid, desc, node





                 -o output not permitted
                           portinfo, sminfo, swinfo, link, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, trace, vfinfo, vfinfocsv, vfinfocsv2, dglist, dgmember, dtree




       -n node_guid




                 -o output permitted
                           systemguid, nodeguid, portguid, lid, desc, node





                 -o output not permitted
                           portinfo, sminfo, swinfo, link, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, trace, vfinfo, vfinfocsv, vfinfocsv2, dglist, dgmember, dtree




       -g port_guid




                 -o output permitted
                           systemguid, nodeguid, portguid, lid, desc, path, node, service, mcmember, inform, trace, dgmember





                 -o output not permitted
                           portinfo, sminfo, swinfo, link, vlarb, pkey, linfdb, mcfdb, vfinfo, vfinfocsv, vfinfocsv2, dglist, dtree




       -u port_gid




                 -o output permitted
                           path, service, mcmember, inform, trace





                 -o output not permitted
                           systemguid, nodeguid, portguid, lid, desc, node, portinfo, sminfo, swinfo, link, vlarb, pkey, linfdb, mcfdb, vfinfo, vfinfocsv, vfinfocsv2, dglist, dgmember, dtree




       -m multicast_gid




                 -o output permitted
                           mcmember, vfinfo, vfinfocsv, vfinfocsv2





                 -o output not permitted
                           systemguid, nodeguid, portguid, lid, desc, path, node, portinfo, sminfo, swinfo, link, vlarb, pkey, service, inform, linfdb, mcfdb, trace, dglist, dgmember, dtree




       -d node_description




                 -o output permitted
                           systemguid, nodeguid, portguid, lid, desc, node, dgmember





                 -o output not permitted
                           trace, dglist, dtree




       -D dg_name




                 -o output permitted
                           dgmember





                 -o output not permitted
                           systemguid, nodeguid, portguid, lid, desc, path, node, portinfo, sminfo, swinfo, link, vlarb, pkey, service, inform, linfdb, mcfdb, trace, dglist, dtree




       -P port_guid_pair




                 -o output permitted
                           path, trace





                 -o output not permitted
                           systemguid, nodeguid, portguid, lid, desc, node, portinfo, sminfo, swinfo, link, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, dglist, dgmember, dtree




       -S serviceId




                 -o output permitted
                           path, vfinfo, vfinfocsv, vfinfocsv2, service





                 -o output not permitted
                           systemimageguid, nodeguid, portguid, lid, desc, node, portinfo, sminfo, swinfo, link, vlarb, pkey, mcmember, inform, linfdb, mcfdb, dglist, dgmember, dtree




       -L SL




                 -o output permitted
                           path, vfinfo, vfinfocsv, vfinfocsv2





                 -o output not permitted
                           systemimageguid, nodeguid, portguid, lid, desc, node, portinfo, sminfo, swinfo, link, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, dglist, dgmember, dtree




       -G gid_pair




                 -o output permitted
                           path, trace





                 -o output not permitted
                           systemguid, nodeguid, portguid, lid, desc, node, portinfo, sminfo, swinfo, link, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, dglist, dgmember, dtree




       -a port_guid_list




                 -o output permitted
                           path





                 -o output not permitted
                           systemguid, nodeguid, portguid, lid, desc, node, portinfo, sminfo, swinfo, link, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, trace, dglist, dgmember, dtree




       -A gid_list




                 -o output permitted
                           path





                 -o output not permitted
                           systemguid, nodeguid, portguid, lid, desc, node, portinfo, sminfo, swinfo, link, vlarb, pkey, service, mcmember, inform, linfdb, mcfdb, trace, dglist, dgmember, dtree





Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                 opasaquery(1)
