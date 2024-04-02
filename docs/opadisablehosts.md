
opadisablehosts(8)                                                                          IFSFFCLIRG (Man Page)                                                                          opadisablehosts(8)



NAME
       opadisablehosts



       (Linux) Searches for a set of hosts in the fabric and disables their corresponding switch port.

Syntax
       opadisablehosts [-h hfi] [-p port] reason host ...

Options
       --help    Produces full help text.


       -h hfi    Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       -p port   Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.


       reason    Specifies the text describing the reason hosts are being disabled. reason is saved in the reason field of the output file.


                 Information about the links disabled is written to a CSV file. By default, this file is named /etc/opa/disabled:hfi:port.csv where the hfi:port part of the file name is replaced by the HFI
                 number and the port number being operated on (such as 1:1 or 2:1). This CSV file can be used as input to opaenableports.

                 The list is of the form: NodeGUID;PortNum;NodeType;NodeDesc;NodeGUID; PortNum;NodeType;NodeDesc;Reason For each listed link, the switch port closer to this is the one that  has  been  dis‐
                 abled.

       host ...  Defines one or more hosts that are affected by the reason.



-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.


Examples
       opadisablehosts 'bad DRAM' compute001 compute045
       opadisablehosts -h 1 -p 2 'crashed' compute001 compute045



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                            opadisablehosts(8)
