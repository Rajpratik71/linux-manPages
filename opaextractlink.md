
opaextractlink(8)                                                                           IFSFFCLIRG (Man Page)                                                                           opaextractlink(8)



NAME
       opaextractlink



       Produces  a  CSV  file  listing all or some of the links in the fabric. opaextractlink is a front end to the opareport tool. The output from this tool can be imported into a spreadsheet or parsed by
       other scripts.

Syntax
       opaextractlink [opareport options]

Options
       --help    Produces full help text.


       opareport options
                 The following options are passed to opareport. This subset is considered typical and useful for this command. By design, the tool ignores -o/--output report option.




                 -h/--hfi hfi
                           Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.





                 -p/--port port
                           Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.





                 -X/--infile snapshot_input
                           Generates a report using the data in the snapshot_input file. snapshot_input must have been generated during a previous -o snapshot run. When used, the -s, -i, -C, and -a options
                           are ignored. '-' may be used as the snapshot_input to specify stdin.





                 -T/--topology topology_input
                           Uses  topology_input  file  to  augment  and  verify  fabric information. When used, various reports can be augmented with information not available electronically (such as cable
                           labels). '-' may be used to specify stdin.




-h and -p options permit a variety of selections:
       -h 0      First active port in system (Default).


       -h 0 -p 0 First active port in system.


       -h x      First active port on HFI x.


       -h x -p 0 First active port on HFI x.


       -h 0 -p y Port y within system (no matter which ports are active).


       -h x -p y HFI x, port y.


Examples
       # List all the links in the fabric:
       opaextractlink

       # List all the links to a switch named "coresw1":
       opaextractlink -F "node:coresw1"

       # List all the links to end-nodes:
       opaextractlink -F "nodetype:FI"

       # List all the links on the 2nd HFI's fabric of a multi-plane fabric:
       opaextractlink -h 2



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                             opaextractlink(8)
