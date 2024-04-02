
opaenableports(8)                                                                           IFSFFCLIRG (Man Page)                                                                           opaenableports(8)



NAME
       opaenableports



       (Linux)  Accepts  a disabled ports input file and re-enables the specified ports. The input file can be /etc/opa/disabled*.csv or a user-created subset of such a file. After enabling the port, it is
       removed from /etc/opa/disabled*.csv.

Syntax
       opaenableports [-h hfi] [-p port] < disabled.csv

Options
       --help    Produces full help text.


       -h hfi    Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       -p port   Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.


       disabled.csv
                 Specifies the input file listing the ports to enable. The list is of the form: NodeGUID;PortNum;NodeType;NodeDesc;Ignored.


                 An input file like this is generated in /etc/opa/disabled* by opadisableports.


-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.


Examples
       opaenableports < disabled.csv
       opaenableports < /etc/opa/disabled:1:1.csv
       opaenableports -h 1 -p 1 < disabled.csv

Other Information
       For messages containing skipping ports, either the device is offline or the other end of the link has been disabled and the device is no longer accessible in-band. The end  of  the  link  previously
       disabled by opedisableports or opadisablehosts can be found in /etc/opa/disabled:1:1.csv.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                             opaenableports(8)
