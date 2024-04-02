
opatop(8)                                                                                   IFSFFCLIRG (Man Page)                                                                                   opatop(8)



NAME
       opatop



       Starts the Fabric Performance Monitor (opatop) Text-based User Interface (TUI) menu to display performance, congestion, and error information about a fabric.

Syntax
       opatop [-v] [-q] [-h hfi] [-p port] [--timeout] [-i seconds]

Options
       --help    Produces full help text.


       -v/--verbose level
                 Specifies the verbose output level. Value is additive and includes:



                 1         Screen




                 4         STDERR opatop




                 16        STDERR PaClient


       -q/--quiet
                 Disables progress reports.

       -h/--hfi hfi
                 Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       -p/--port port
                 Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.


       --timeout Specifies the timeout (response wait time) in ms. Default is 1000 ms.


       -i/--interval seconds
                 Interval in seconds at which PA queries are performed to refresh to the latest PA image. Default is 10 seconds.



-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                     opatop(8)
