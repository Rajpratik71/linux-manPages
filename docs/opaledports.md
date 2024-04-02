
opaledports(8)                                                                              IFSFFCLIRG (Man Page)                                                                              opaledports(8)



NAME
       opaledports



       Toggles  the  beaconing  LED state of HFIs, switches, and switch ports. opaledports is a useful aid for finding specific physical nodes in a crowded data center. It supports the CSV link format pro‐
       vided by opaextractsellinks.

Syntax
       opaledports [-h hfi] [-p port] [-C] [-s|-d] [on|off] < portlist.csv

Options
       --help    Produces full help text.


       -h hfi    Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       -p port   Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.


       -C        Clears beaconing LED on all ports.


                 NOTE: If -C is entered, no other options are valid.

       -s        Affects source side (first node) of link only.


       -d        Affects destination side (second node) of link only.


       on|off    Turns on or off the beaconing LED. Options include:




                 on        Turns on beaconing LED.





                 off       Turns off beaconing LED.



       portlist.csv
                 Specifies the file listing the links to process. The list is of the form:


                 NodeGUID;PortNum;NodeType;NodeDesc;NodeGUID;PortNum;
                 NodeType;NodeDesc;Dontcare

Examples
       echo "0x001175010165ac1d;1;FI;phkpstl035 hfi1_0"|opaledports on
       opaledports on < portlist.csv
       opaextractsellinks -F led:on | opaledports off
       opaledports -C



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                opaledports(8)
