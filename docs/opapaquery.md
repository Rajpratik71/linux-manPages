
opapaquery(8)                                                                               IFSFFCLIRG (Man Page)                                                                               opapaquery(8)



NAME
       opapaquery



       (All)  Performs  various  queries of the performance management (PM)/performance administration (PA) agent and provides details about fabric performance. Refer to the Intel(R) Omni-Path Fabric Suite
       Fabric Manager User Guide

       for a description of the operation and client services of the PM/PA.

       By default, opapaquery queries the most recent data. However, if an image number (imgNum) and/or image offset (imgOff) is provided, the query returns previous sweep data. Queries that access  previ‐
       ous sweep data return with the absolute image number representing that data, and therefore have an image offset of zero.

       opapaquery's operation is dependent on an Intel(R) Omni-Path Fabric Suite Fabric Manager version 6.0 or greater running as master SM/PM in the fabric.

       By  default,  opapaquery  uses the first active port on the local system. However, if the Fabric Management Node is connected to more than one fabric (for example, a subnet), the HFI and port may be
       specified to select the fabric whose PA is to be queried.

Syntax
       opapaquery [-v] [-h hfi|-b addr] [-p port] [-x gid] [-E]
       [-T ssl_params] [-o type] [-g groupName] [-l nodeLid] [-P portNumber]
       [--timeout] [-G nodeGuid] [-D nodeDesc] [-d delta] [-j date_time]
       [-q date_time] [-U] [-s select] [-f focus] [-S start] [-r range]
       [-n imgNum] [-O imgOff] [-y imgTime] [-m moveImgNum] [-M moveImgOff] [-V vfName]

Options
       -v/--verbose
                 Specifies the verbose output.


       -h/--hfi hfi
                 Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       -b/--oob address
                 Specifies Out-of-Band address of node running the FE. Can be either hostname, IPv4, or IPv6 address. Default is "127.0.0.1".


       -p/--port port
                 Specifies the port.


                 ·      In-band: Numbered 1...n. Using 0 specifies the first active port. Default is 0.

                 ·      Out-of-band: Port FE is listening on. Default is 3245.




       -x/--source-gid src_gid
                 Specifies the source GID of the local GID. (This is required for most Path and Trace Record Queries when Out-of-Band.)


       -E/--feEsm
                 Specifies the ESM FE.


       -T/--ssl-params file
                 Specifies the SSL/TLS parameters XML file. Default is /etc/opa/opamgt_tls.xml.


       -o/--output type
                 Specifies the output type. Default is groupList. See Output Types


       -g/--groupName groupName
                 Specifies the group name for groupInfo query.


       -l/--lid lid
                 Specifies the LID of the node.


       -P/--portNumber portNumber
                 Specifies the port number within the node.


       --timeout Specifies the timeout (response wait time) in ms. Default is 1000 ms.


       -G/--nodeGuid
                 Specifies the GUID of the node.


       -D/--nodeDesc
                 Specifies the description of the node.


       -d/--delta delta
                 Specifies the delta flag for portCounters query - 0 or 1.


       -j/--begin  date_time
                 Obtains portCounters over an interval beginning at date_time. date_time may be a time entered as HH:MM[:SS] or date as mm/dd/YYYY, dd.mm.YYYY, YYYY-mm-dd or  date  followed  by  time;  for
                 example, "2016-07-04 14:40". Relative times are taken as "x [second|minute|hour|day](s) ago.


       -q/--end  date_time
                 Obtains  portCounters  over an interval ending at date_time. date_time may be a time entered as HH:MM[:SS] or date as mm/dd/YYYY, dd.mm.YYYY, YYYY-mm-dd or date followed by time; for exam‐
                 ple, "2016-07-04 14:40". Relative times are taken as "x [second|minute|hour|day](s) ago.


       -U/--userCntrs
                 Queries by user-controlled counters flag for portCounters.


       -s/--select select
                 Specifies the 32-bit select flag for clearing port counters.


                 Select bits for clrPortCounters. 0 is the least significant bit (rightmost). The clrPortCounters bit descriptions are listed in the order "mask - bit - location" below:


                 ·      0x80000000 - 31 - Transmit Data (XmitData)


                 ·      0x40000000 - 30 - Receive Data (RcvData)


                 ·      0x20000000 - 29 - Transmit Packets (XmitPkts)


                 ·      0x10000000 - 28 - Receive Packets (RcvPkts)


                 ·      0x08000000 - 27 - Multicast Transmit Packets (MulticastXmitPkts)


                 ·      0x04000000 - 26 - Multicast Receive Packets (MulticastRcvPkts)


                 ·      0x02000000 - 25 - Transmit Wait (XmitWait)


                 ·      0x01000000 - 24 - Congestion Discards (CongDiscards)


                 ·      0x00800000 - 23 - Receive FECN (RcvFECN)


                 ·      0x00400000 - 22 - Receive BECN (RcvBECN)


                 ·      0x00200000 - 21 - Transmit Time Congestion (XmitTimeCong)


                 ·      0x00100000 - 20 - Transmit Time Wasted BW (XmitWastedBW)


                 ·      0x00080000 - 19 - Transmit Time Wait Data (XmitWaitData)


                 ·      0x00040000 - 18 - Receive Bubble (RcvBubble)


                 ·      0x00020000 - 17 - Mark FECN (MarkFECN)


                 ·      0x00010000 - 16 - Receive Constraint Errors (RcvConstraintErrors)


                 ·      0x00008000 - 15 - Receive Switch Relay (RcvSwitchRelayErrors)


                 ·      0x00004000 - 14 - Transmit Discards (XmitDiscards)


                 ·      0x00002000 - 13 - Transmit Constraint Errors (XmitConstraintErrors)


                 ·      0x00001000 - 12 - Receive Remote Physical Errors (RcvRemotePhysicalErrors)


                 ·      0x00000800 - 11 - Local Link Integrity (LocalLinkIntegrityErrors)


                 ·      0x00000400 - 10 - Receive Errors (RcvErrors)


                 ·      0x00000200 - 9 - Excessive Buffer Overrun (ExcessiveBufferOverruns)


                 ·      0x00000100 - 8 - FM Configuration Errors (FMConfigErrors)


                 ·      0x00000080 - 7 - Link Error Recovery (LinkErrorRecovery)


                 ·      0x00000040 - 6 - Link Error Downed (LinkDowned)


                 ·      0x00000020 - 5 - Uncorrectable Errors (UncorrectableErrors)




                 Select bits for clrVfPortCounters. 0 is the least significant bit (rightmost). The clrVfPortCounters bit descriptions are listed in the order "mask - bit - location" below:


                 ·      0x80000000 - 31 - VL Transmit Data (VLXmitData)


                 ·      0x40000000 - 30 - VL Receive Data (VLRcvData)


                 ·      0x20000000 - 29 - VL Transmit Packets (VLXmitPkts)


                 ·      0x10000000 - 28 - VL Receive Packets (VLRcvPkts)


                 ·      0x08000000 - 27 - VL Transmit Discards (VLXmitDiscards)


                 ·      0x04000000 - 26 - VL Congestion Discards (VLCongDiscards)


                 ·      0x02000000 - 25 - VL Transmit Wait (VLXmitWait)


                 ·      0x01000000 - 24 - VL Receive FECN (VLRcvFECN)


                 ·      0x00800000 - 23 - VL Receive BECN (VLRcvBECN)


                 ·      0x00400000 - 22 - VL Transmit Time Congestion (VLXmitTimeCong)


                 ·      0x00200000 - 21 - VL Transmit Wasted BW (VLXmitWastedBW)


                 ·      0x00100000 - 20 - VL Transmit Wait Data (VLXmitWaitData)


                 ·      0x00080000 - 19 - VL Receive Bubble (VLRcvBubble)


                 ·      0x00040000 - 18 - VL Mark FECN (VLMarkFECN)


                 ·      Bits 17-0 reserved




       -f/--focus focus
                 Specifies the focus select value for getting focus ports. focus select values are:



                 unexpclrport
                           Lists unexpectedly cleared ports - LID ordered.





                 norespport
                           Lists no response ports - LID ordered.





                 skippedport
                           Lists skipped ports - LID ordered.





                 utilhigh  Sorted by utilization - highest first.





                 pktrate   Sorted by packet rate - highest first.





                 utillow   Sorted by utilization - lowest first.





                 integrity Sorted by integrity category - highest first.





                 congestion
                           Sorted by congestion category - highest first.





                 smacongestion
                           Sorted by SMA congestion category - highest first.





                 bubbles   Sorted by bubble category - highest first.




                 security  Sorted by security category - highest first.





                 routing   Sorted by routing category - highest first.





                 vfutilhighv
                           Sorted by utilization - highest first.




                 vfpktrate Sorted by packet rate - highest first.




                 vfutillow Sorted by utilization - lowest first.




                 vfcongestion
                           Sorted by congestion category - highest first.




                 vfbubbles Sorted by bubble category - highest first.


       -S/--start start
                 Specifies the start of window for focus ports, should always be 0.


       -r/--range range
                 Specifies the size of window for focus ports list.


       -Q/--tuple
                 Specifies a tuple that identifies a focus select value, comparator and argument in the form select: comparator:argument. Up to 8 tuples may be specified as: -Q s1:c1:a1 -Q s2:c2:a2 ...  -Q
                 s8:c8:a8


                 Valid focus select values are: utilization, pktrate, integrity, congestion, smacongestion, bubbles, security and routing.

                 Valid comparator values are: GT, GE, LT, LE

                 Valid arguments are: Any 64-bit value in hexadecimal or decimal.

                 When specifying more than one tuple, a logical operator -Z/--operator must also be specified.

       -Z/--operator
                 Specifies a logical operator used to join the results of the specified tuples.


                 and - Specifies a port is returned if it meets all of the tuple filter criteria.

                 or - Specifies a port is returned if it meets one or more of the tuple filter criteria.

       -n/--imgNum imgNum
                 Specifies the 64-bit image number.


       -O/--imgOff imgOff
                 Specifies the image offset.


       -y/--imgTime
                 Specifies the image time. May be used with imageinfo, groupInfo, groupInfo, groupConfig, freezeImage, focusPorts, vfInfo, vfConfig, and vfFocusPorts. Will return closest image within image
                 interval if possible. See --begin/--end above for format.


       -m/--moveImgNum moveImgNum
                 Specifies the 64-bit image number. Used with moveFreeze to move a freeze image.


       -M/--moveImgOff moveImgOff
                 Specifies the image offset. Can be used with moveFreeze to move a freeze image.


       -V/--vfName vfName
                 Specifies the VF name for vfInfo query.



-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.


Output Types
       classPortInfo
                 Specifies the class port info.


       groupList Specifies the list of PA groups.


       groupInfo Specifies the summary statistics of a PA group. Requires -g option for groupName.


       groupConfig
                 Specifies the configuration of a PA group. Requires -g option for groupName.


       groupNodeInfo
                 Specifies the node information of a PA group. Requires -g option for groupName. Options -l lid, -G nodeGuid and -D nodeDesc are optional.


       groupLinkInfo
                 Specifies the link Information of a PA group. Requires -g option for groupName. Options -l lid and -P port are optional. Note that -P 255 specifies all ports. Option -P port without -l lid
                 is ignored.


       portCounters
                 Specifies the port counters of fabric port. Requires -l lid and -P port options. -d delta is optional.


       clrPortCounters
                 Clears port counters of fabric port. Requires -l lid and -P port, and -s select options.


       clrAllPortCounters
                 Clears all port counters in fabric.


       pmConfig  Retrieves PM configuration information.


       freezeImage
                 Creates freeze frame for image ID. Requires -n imgNum.


       releaseImage
                 Releases freeze frame for image ID. Requires -n imgNum.


       renewImage
                 Renews lease for freeze frame for image ID. Requires -n imgNum.


       moveFreeze
                 Moves freeze frame from image ID to new image ID. Requires -n imgNum and -m moveImgNum.


       focusPorts
                 Gets sorted list of ports using utilization or error values (from group buckets). Requires -g groupname, -f focus, -S start, -r range.


       imageInfo Gets configuration of a PA image (timestamps, etc.). Requires -n imgNum.


       vfList    Specifies the list of virtual fabrics.


       vfInfo    Specifies the summary statistics of a virtual fabric. Requires -V option for vfName.


       vfConfig  Specifies the configuration of a virtual fabric. Requires -V option for vfName.


       vfPortCounters
                 Specifies the port counters of fabric port. Requires -V vfName, -l lid and -P port options, -d delta is optional.


       vfFocusPorts
                 Gets sorted list of virtual fabric ports using utilization or error values (from VF buckets). Requires -V vfname, -f focus, -S start, -r range.


       clrVfPortCounters
                 Clears VF port counters of fabric port. Requires -l lid, -P port, -s select, and -V vfname options.


Examples
       opapaquery -o classPortInfo
       opapaquery -o groupList
       opapaquery -o groupInfo -g All
       opapaquery -o groupConfig -g All
       opapaquery -o groupNodeInfo -g All -G <nodeGuid>
       opapaquery -o groupNodeInfo -g All -D <nodeDesc>
       opapaquery -o groupNodeInfo -g All -l 1
       opapaquery -o groupNodeInfo -g All -l 1 -G <nodeGuid>
       opapaquery -o groupLinkInfo -g All
       opapaquery -o groupLinkInfo -g All -l 1 -P 1
       opapaquery -o groupLinkInfo -g All -l 1 -P 255
       opapaquery -o portCounters -l 1 -P 1 -d 1
       opapaquery -o portCounters -l 1 -P 1 -d 1 -n 0x20000000d02 -O 1
       opapaquery -o portCounters -l 1 -P 1 -d 1 -j 13:30 -q 14:20
       opapaquery -o clrPortCounters -l 1 -P 1 -s 0xC0000000
       (clears XmitData & RcvData)
       opapaquery -o clrAllPortCounters -s 0xC0000000
       (clears XmitData & RcvData on all ports)
       opapaquery -o pmConfig
       opapaquery -o freezeImage -n 0x20000000d02
       opapaquery -o releaseImage -n 0xd01
       opapaquery -o renewImage -n 0xd01
       opapaquery -o moveFreeze -n 0xd01 -m 0x20000000d02 -M -2
       opapaquery -o focusPorts -g All -f integrity -S 0 -r 20
       opapaquery -o focusPorts -g All -S 0 -r 20 -Z AND -Q integrity:ge:20 -Q bubbles:lt:10
       opapaquery -o focusPorts -g All -f skippedport -S 0 -r 20
       opapaquery -o imageInfo -n 0x20000000d02
       opapaquery -o imageInfo -y "1 hour ago"
       opapaquery -o vfList
       opapaquery -o vfInfo -V Default
       opapaquery -o vfConfig -V Default
       opapaquery -o vfPortCounters -l 1 -P 1 -d 1 -V Default
       opapaquery -o clrVfPortCounters -l 1 -P 1 -s 0xC0000000 -V Default
       (clears VLXmitData & VLRcvData)
       opapaquery -o vfFocusPorts -V Default -f integrity -S 0 -r 20



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                 opapaquery(8)
