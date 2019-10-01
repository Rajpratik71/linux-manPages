
opashowmc(8)                                                                                IFSFFCLIRG (Man Page)                                                                                opashowmc(8)



NAME
       opashowmc



       (Linux)  Displays  the Intel(R) Omni-Path Multicast groups created for the fabric along with the Intel(R) Omni-Path Host Fabric Interface (HFI) ports which are a member of each multicast group. This
       command can be helpful when attempting to analyze or debug Intel(R) Omni-Path multicast usage by applications or ULPs such as IPoIB.

Syntax
       opashowmc [-v] [-m mgid] [-t portsfile] [-p ports]

Options
       --help    Produces full help text.


       -v        Returns verbose output and shows name of each member.


       -m mgid   Shows the membership of the group <mgid> only.


       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabric(s) for analysis. Default is /etc/opa/ports file.


       -p ports  Specifies the list of local HFI ports used to access fabric(s) for analysis.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0       First active port on HFI x.





                 x:y       HFI x, port y.



Examples
       opashowmc
       opashowmc -p '1:1 1:2 2:1 2:2' opashowmc -m 0xff12401b80010000:0x00000000ffffffff

Environment Variables
       The following environment variables are also used by this command:

       PORTS     List of ports, used in absence of -t and -p.


       PORTS_FILE
                 File containing list of ports, used in absence of -t and -p.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                  opashowmc(8)
