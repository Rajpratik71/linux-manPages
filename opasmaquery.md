
opasmaquery(1)                                                                              IFSFFCLIRG (Man Page)                                                                              opasmaquery(1)



NAME
       opasmaquery



       (All) Performs Intel(R) Omni-Path Architecture-defined SMA queries and displays the resulting response. Each query is issued directly to the SMA and does not involve SM interaction.

Syntax
       opasmaquery [-v] [-d detail][-g] [-l lid] [-h hfi] [-p port] [-o otype]
       [-m port| port1,port2] [-f flid] [-b block[,count]] [hop hop ...]

Options
       --help    Produces full help text.


       -v        Returns verbose output. Can be specified more than once for additional openib and libibumad debugging.


       -d detail Specifies  the  output detail level for cableinfo only. Range is 0 - n. Default is 2. An upper limit for detail level is not enforced. After a maximum amount of output is reached, a larger
                 detail value has no effect.


       -g        Displays line-by-line format. Default is summary format.


       -l lid    Specifies the destination LID. Default is local port.


       -h/--hfi hfi
                 Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       -p/--port port
                 Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.


       -o otype  Specifies the output type. Default is nodeinfo. Refer to otype Options Vary by Report for supported options.


                 Valid output types are:



                 bfrctrl   Specifies buffer control tables.


                           [-m dest_port] [-m port1,port2]




                 cableinfo Specifies cable information.


                           [-d detail] [-m dest_port] [-b block[,count]]




                 conginfo  Specifies congestion information.





                 desc or nodedesc
                           Specifies node descriptions/names.





                 hficongcon
                           Specifies HFI congestion control settings.


                           [-b block[,count]] [-f flid]




                 hficonglog
                           Specifies HFI congestion logs.


                           [-b block[,count]]




                 hficongset
                           Specifies HFI congestion settings.





                 linfdb    Specifies switch linear forwarding database (FDB) tables.


                           [-b block[,count]] [-f flid]




                 mcfdb     Specifies switch multicast FDB tables.


                           [-m dest_port] [-b block[,count]] [-f flid]




                 portgroup Specifies Adaptive Routing port groups.


                           [-b block[,count]]




                 portgroupfdb
                           Specifies Adaptive Routing port group FWD tables.


                           [-b block[,count]] [-f flid]




                 nodeaggr  Specifies node information and node descriptions.





                 node or nodeinfo
                           Specifies node information.


                           [-m dest_port]




                 portinfo  Specifies port information.


                           [-m dest_port]




                 pstateinfo
                           Specifies switch port state information.


                           [-m dest_port] [-m port1,port2]




                 pkey      Specifies P-Key tables.


                           [-m dest_port] [-b block[,count]]




                 slsc      Specifies SL to SC mapping tables.





                 scsl      Specifies SC to SL mapping tables.





                 scsc      Specifies SC to SC mapping tables.


                           [-m dest_port] [-m port1,port2]




                 scvlt     Specifies SC to VLt tables.


                           [-m dest_port] [-m port1,port2]




                 scvlnt    Specifies SC to VLnt tables.


                           [-m dest_port] [-m port1,port2]




                 scvlr     Specifies SC to VLr tables


                           [-m dest_port] [-m port1,port2]




                 sminfo    Specifies SM information.





                 swaggr    Specifies node information and switch information.





                 swconglog Specifies switch congestion logs.


                           [-b block[,count]]




                 swcongset Specifies switch congestion settings.





                 swinfo    Specifies switch information.





                 swportcong
                           Specifies switch congestion settings.


                           [-b block[,count]]




                 vlarb     Specifies VL arbitration tables.


                           [-m dest_port]




                 ibnodeinfo
                           Specifies IB node information.





                 ledinfo   Specifies LED information.


                           [-m dest_port]



-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.



otype Options Vary by Report
       [-m port|port1,port2] [-f lid] [-b block[,count]]

       -m port   Specifies the port in destination device to query.


       -m port1,port2
                 For some reports, specifies a range of ports between port1 and port2. For others, this describes an inport/outport pair.


       -f lid    Specifies the LID to look up in forwarding table to select which LFT or MFT block to display. Default is to show entire table.


       -b block[,count]
                 Specifies the block number of either GUIDs or pkey, and the number of blocks to display. Default is to show entire table.


                 For example:

                 -b block  Displays all of block block of a larger table.





                 -b block,count
                           Displays count blocks of data starting with block block.





                 -b, count Displays count blocks of data starting with block 0.



Examples
       opasmaquery -o desc -l 6
       # get nodedesc via lid routed

       opasmaquery -o nodedesc 1 3
       # get nodedesc via directed route (2 dr hops)

       opasmaquery -o nodeinfo -l 2 3
       # get nodeinfo via a combination of lid routed and # directed route (1 dr hop)

       opasmaquery -o portinfo
       # get local port info

       opasmaquery -o portinfo -l 6 -m 1
       # get port info of port 1 of lid 6

       opasmaquery -o pkey -l 2 3
       # get pkey table entries starting (lid routed to lid 2,
       # then 1 dr hop to port 3)

       opasmaquery -o vlarb -l 6
       # get vlarb table entries from lid 6

       opasmaquery -o swinfo -l 2
       # get switch info

       opasmaquery -o sminfo -l 1
       # get SM info

       opasmaquery -o slsc -l 3
       # get sl2sc table entries from lid 3

       opasmaquery -o scsl -l 3
       # get sc2sl table entries from lid 3



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                opasmaquery(1)
