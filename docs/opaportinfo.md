
opaportinfo(1)                                                                              IFSFFCLIRG (Man Page)                                                                              opaportinfo(1)



NAME
       opaportinfo



       (Host or Switch) Displays configuration and state of a specified Intel(R) Omni-Path Host Fabric Interface (HFI) port on the local host or a remote switch.

Syntax
       opaportinfo [-l lid[-m dest_port]] [-h hfi] [-p port] [-v]

Options
       -l lid    Specifies the destination LID. Default is local port.


       -m dest_port
                 Specifies the destination port. Default is port with given LID. Useful to access switch ports.


       -h hfi    Specifies the HFI to send through/to. Default is first HFI.


       -p port   Specifies the port to send through/to. Default is first port.



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
       opaportinfo -p 1
       opaportinfo -p 2 -h 2 -l 5 -m 18

Description
       To  access  switch  ports  using this command, the -l and -m options must be given. The -l option specifies the LID of switch port 0 (the logical management port for the switch) and -m specifies the
       actual switch port to access.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                opaportinfo(1)
