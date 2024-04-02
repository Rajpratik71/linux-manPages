
opapmaquery(1)                                                                              IFSFFCLIRG (Man Page)                                                                              opapmaquery(1)



NAME
       opapmaquery



       (All) Performs individual PMA queries against a specific LID. It is very useful in displaying port runtime information.

Syntax
       opapmaquery [-v] [-s sl] [-l lid] [-h hfi] [-p port] [-o otype]
       [-m port] [-n mask] [-e mask] [-w mask]


Options
       --help    Produces full help text.


       -v        Specifies the verbose output. Can be specified more than once for additional openib debugging and libibumad debugging.


       -s sl     Specifies different service level. Default is SM SL.


       -l lid    Specifies the destination LID. Default is local port.


       -h/--hfi hfi
                 Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       -p/--port port
                 Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.


       -o otype  Specifies the output type. Default is getportstatus. Refer to otype options vary by report for supported options.


                 Valid output types are:



                 classportinfo
                           Specifies the class of port info.





                 getportstatus
                           Specifies the list of port counters. Supported options:


                           [-m port] [-w vl mask]






                 clearportstatus
                           Clears the port counters. Supported options:


                           [-n port mask] [-e counter mask] [-w vl mask]






                 getdatacounters
                           Specifies the list of data counters. Supported options:


                           [-n port mask] [-w vl mask]






                 geterrorcounters
                           Specifies the list of error counters. Supported options:


                           [-n port mask] [-w vl mask]






                 geterrorinfo
                           Specifies the list of error info. Supported options:


                           [-n port mask]






                 clearerrorinfo
                           Clears the error info. Supported options:


                           [-n port mask] [-e counter mask]





-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.



otype options vary by report
       -m port   Specifies the port in destination device to query/clear. Required when using -l option for all but -o classportinfo.


       -n mask   Specifies the port mask, in hexadecimal. Bits represent ports 63-0. For example: 0x2 for port 1, 0x6 for ports 1, 2.


       -e mask   Specifies  the counter/error select mask, in hexadecimal. The following lists "Mask - Bit - Location for Counters". Where applicable, location "for Error Info" is presented. Default is all
                 bits set (0xffffffe0).



                 ·      0x80000000 - 31 - Transmit Data (XmitData) For Error Info: Receive Error Info


                 ·      0x40000000 - 30 - Receive Data (RcvData) For Error Info: Excessive Buffer Overrun


                 ·      0x20000000 - 29 - Transmit Packets (XmitPkts) For Error Info: Transmit Const Error Info


                 ·      0x10000000 - 28 - Receive Packets (RcvPkts) For Error Info: Receive Const Error Info


                 ·      0x08000000 - 27 - Multicast Transmit Packets (MulticastXmitPkts) For Error Info: Receive Switch Relay Error Info


                 ·      0x04000000 - 26 - Multicast Receive Packets (MulticastRcvPkts) For Error Info: Uncorrectable Error Info


                 ·      0x02000000 - 25 - Transmit Wait (XmitWait) For Error Info: FM Configuration Error Info


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




       -w mask   Specifies the Virtual Lane Select Mask, in hexadecimal. Bits represent VL number 31-0. For example, 0x1 for VL 0, 0x3 for VL 0,1. Default is none.


Examples
       opapmaquery -o classportinfo

       opapmaquery -o getportstatus
       # get data and error counts, local port

       opapmaquery -o getdatacounters -n 0x2
       # get data counts, local port 1

       opapmaquery -o geterrorcounters -n 0x2
       # get error counts, local port 1

       opapmaquery -o clearportstatus -n 0x2
       # clear all counters local port 1

       opapmaquery -o geterrorinfo -n 0x2
       # get error info for local port 1

       opapmaquery -o clearerrorinfo -n 0x2
       # clear all error info, local port 1
       opapmaquery -o getdatacounters -l 6 -n 0x7e -w 0x1
       # for device at LID 6, get data counters on ports 1-6, inclusive of VL 0 data

       opapmaquery -o clearportstatus -l 6 -n 0x2 -e 0x1ffff
       # for device at LID 6, on port 1, clear only error counters

       opapmaquery -o clearerrorinfo -l 6 -n 0x2 -e 0x04000000
       # for device at LID 6, on ports 1, clear uncorrectable error info



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                opapmaquery(1)
