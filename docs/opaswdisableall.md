
opaswdisableall(8)                                                                          IFSFFCLIRG (Man Page)                                                                          opaswdisableall(8)



NAME
       opaswdisableall



       (Linux) Disables all unused switch ports.

Syntax
       opaswdisableall [-t portsfile] [-p ports] [-F focus]

Options
       --help    Produces full help text.


       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabrics when clearing counters.
                 Default is /etc/opa/ports file.


       -p ports  Specifies the list of local HFI ports used to access fabrics for counter clear.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0       First active port on HFI x.





                 x:y       HFI x, port y.



       -F focus  Specifies the an opareport -style focus argument to limit the scope of operation.


Examples
       opaswdisableall
       opaswdisableall -p '1:1 1:2 2:1 2:2'

Environment Variables
       The following environment variables are also used by this command:

       PORTS     List of ports, used in absence of -t and -p.


       PORTS_FILE
                 File containing list of ports, used in absence of -t and -p.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                            opaswdisableall(8)
