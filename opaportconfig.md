
opaportconfig(1)                                                                            IFSFFCLIRG (Man Page)                                                                            opaportconfig(1)



NAME
       opaportconfig



       (Host or Switch) Controls the configuration and state of a specified Intel(R) Omni-Path Host Fabric Interface (HFI) port on the local host or a remote switch.

       NOTE: This tool is designed for expert users only. Non-expert users should use other tools such as opaenableports, opadisableports and opaportinfo for basic functionality.


Syntax
       opaportconfig [-l lid[-m dest_port]] [-h hfi] [-p port] [-r secs] [-z]
       [-S state] [-P physstate] [-s speed] [-w width] [-c LTPCRC] [-v] [-x]
       [-L lid] [< sub command>]

Options
       --help    Produces full help text.


       -l lid    Specifies the destination LID. Default is local port.


       -m dest_port
                 Specifies the destination port. Default is port with given LID. Used to access switch ports.


       -h hfi    Specifies the HFI to send through/to. Default is first HFI.


       -p port   Specifies the port to send through/to. Default is first port.


       sub command
                 Specifies the one of the following choices:




                 enable    Enables port.





                 disable   Disables port.





                 bounce    Bounces port.





                 NOTE: Bouncing remote ports may cause timeouts.





                 ledon     Turns port LED on.





                 ledoff    Turns port LED off.




Configuration Options
       -r secs   Repeats to keep the port down for the specified amount of seconds.


       -S state  Specifies the new state. Default is 0.




                 0         No-op.





                 1         Down.





                 2         Initiate.





                 3         Armed.





                 4         Active.



       -P physstate
                 Specifies the new physical state. Default is 0.





       NOTE: All transitions are valid.




              0         No-op.





              2
                        Polling.





              3         Disabled.





              11        Phy-Test. Current physstate must be disabled.



       -s speed  Specifies the new link speeds enabled. Default is 0. To enable multiple speeds, use the sum of the desired speeds.




                 0         No-op.





                 2         0x0002 - 25 Gb/s.



       -w width  Specifies the new link widths enabled. Default is 0. To enable multiple widths, use sum of desired widths.




                 0         No-op.





                 1         0x01 - 1x.





                 2         0x02 - 2x.





                 4         0x04 - 3x.





                 8         0x08 - 4x.



       -c LTPCRC Specifies the new LTP CRCs enabled. Default is 0.
                 To enable multiple LTP CRCs, use sum of desired LTP CRCs.




                 0         No-op.





                 1         0x1 - 14-bit LTP CRC mode.





                 2         0x2 - 16-bit LTP CRC mode.





                 4         0x4 - 48-bit LTP CRC mode.




                 8         0x8 - 12/16 bits per lane LTP CRC mode.




-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.



Debug Options
       -v        Verbose output. Additional invocations turn on debugging, openib debugging, and libibumad debugging.


       -z        Does not get port information first; clears most port attributes.


       -L lid    Sets PortInfo.LID = lid.


Examples
       opaportconfig -w 1
       opaportconfig -p 1 -h 2 -w 3

Description
       Port  configuration is transient in nature. If the given host is rebooted or its Intel(R) Omni-Path Fabric Stack is restarted, the port reverts to its default configuration and state. Typically, the
       default state is to have the port enabled with all speeds and widths supported by the given HFI port.

       To access switch ports using this command, the -l and -m options must be given. The -l option specifies the lid of switch port 0 (the logical management port for the switch)  and  -m  specifies  the
       actual switch port to access.

       NOTE:  The  /etc/init.d/opaportconfig  script is provided as an example of changing port speed every time the server boots. This script can be edited, then scheduled, using chkconfig to control link
       settings on any set of HFI ports.


       CAUTION: When using this command to disable or reconfigure switch ports, if the final port in the path between the Fabric Management Node and the switch is disabled or fails  to  come  online,  then
       opaenableports is not able to reenable it. In this case, the switch CLI and/or a switch reboot may be needed to correct the situation.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                              opaportconfig(1)
