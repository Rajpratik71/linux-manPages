
opagenchassis(8)                                                                            IFSFFCLIRG (Man Page)                                                                            opagenchassis(8)



NAME
       opagenchassis



       Generates a list of IPv4, IPv6, and/or TCP names in a format acceptable for inclusion in the /etc/opa/chassis file.

Syntax
       opagenchassis [-t portsfile] [-p ports]

Options
       --help    Produces full help text.

       -t portsfile
                 Specifies the file with list of local HFI ports used to access fabric for analysis.
                 Default is /etc/opa/ports file.

       -p ports  Specifies the list of local HFI ports used to access fabrics for counter clear.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0       First active port on HFI x.





                 x:y       HFI x, port y.



Environment Variables
       The following environment variables are also used by this command:

       PORTS     List of ports, used in absence of -t and -p.

       PORTS_FILE
                 File containing list of ports, used in absence of -t and -p.

Examples
       opagenchassis
       opagenchassis -p '1:1 1:2 2:1 2:2'



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                              opagenchassis(8)
