
opainfo(1)                                                                                  IFSFFCLIRG (Man Page)                                                                                  opainfo(1)



NAME
       opainfo



       Provides summary information for local HFI port(s).

Syntax
       opainfo [-h hfi] [-p port] [-o type] [-g] [-d detail] [-s pm_sl]
       [-v [-v]...]


Options
       --help    Produces full help text.


       -h hfi    Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       -p port   Specifies the port, numbered 1 to n. Using 0 specifies the first active port across all HFIs/ports. Default is 1 which indicates all ports. If selected, the tool returns information on all
                 available ports if p is not defined.


       -o type   Specifies the output type and can appear more than once.





       NOTE: Behavior without -o gives a brief summary of portinfo, counters and cableinfo.




              info      Outputs detailed portinfo.




              stats     Outputs detailed port counters.


       -g        Output is displayed in line-by-line format. Default is summary format.


       -d detail Output detail level. Range is 0 - 2. CableInfo only. Default is 0.





       NOTE: -d option is ignored when used with -o type.




              0         Minimal crucial information (for example, cable length, vendor)





              1         Brief summary





              2         Extended brief summary



       -s pm_sl  Specifies different Service Level for PMA traffic.



-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.



Debug Options
       -v        Specifies the verbose output. Additional invocations (-v -v ...) turn on debugging, openib debugging, and libibumad debugging.


Examples
       opainfo
       hfi1_0:1 PortGID:0xfe80000000000000:001175010165b19c
       PortState: Active
       LinkSpeed Act: 25Gb En: 25Gb
       LinkWidth Act: 4 En: 4
       LinkWidthDnGrd ActTx: 4 Rx: 4 En: 3,4
       LCRC Act: 14-bit En: 14-bit,16-bit,48-bit Mgmt: True
       LID: 0x00000001-0x00000001 SM LID: 0x00000002 SL: 0
       QSFP: PassiveCu, 1m FCI Electronics P/N 10131941-2010LF Rev 5
       Xmit Data: 22581581 MB Pkts: 5100825193
       Recv Data: 18725619 MB Pkts: 4024569756
       Link Quality: 5 (Excellent)



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                    opainfo(1)
