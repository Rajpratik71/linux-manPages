
oparesolvehfiport(1)                                                                        IFSFFCLIRG (Man Page)                                                                        oparesolvehfiport(1)



NAME
       oparesolvehfiport



       (Host) Permits the Intel(R) Omni-Path Fabric Host Software style Intel(R) Omni-Path Host Fabric Interface (HFI) number and port number arguments to be converted to a Host Software style HFI name and
       physical port number.

Syntax
       oparesolvehfiport [-o output] [ hfi] [ port]

Options
       --help    Produces full help text.


       -o output Specifies the output type.




                 devname   Prints the device name, in the format hfiname:portnum (Default).





                 hfinum    Prints the hfi number.



       hfi       Specifies the HFI, numbered 1..n. Using 0 specifies that the -p port port is a system-wide port number. Default is 0.


       port      Specifies the port, numbered 1..n. Using 0 specifies the first active port. Default is 0.


                 The HFI and port permit a variety of selections:



                 0 0       First active port in system.





                 x 0       First active port on HFI x.





                 0 y       Port y within system (no matter which ports are active).





                 x y       HFI x, port y



Examples
       oparesolvehfiport 0 1 #Output: hfi1_0:1
       oparesolvehfiport -o devname 0 1 #Output: hfi1_0:1
       oparesolvehfiport -o hfinum 0 1 #Output: 1



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                          oparesolvehfiport(1)
