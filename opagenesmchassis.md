
opagenesmchassis(8)                                                                         IFSFFCLIRG (Man Page)                                                                         opagenesmchassis(8)



NAME
       opagenesmchassis



       Generates  a  list of chassis IPv4 and IPv6 addresses and/or TCP names where the Embedded Subnet Manager (ESM) is running, in a format acceptable for inclusion in the /etc/opa/esm_chassis file. This
       tool uses opagenchassis output to iterate through all the chassis.

Syntax
       opagenesmchassis [-u user] [-S] [-t portsfile] [-p ports]

Options
       --help    Produces full help text.

       -u user   Performs command as user. For chassis, the default is admin.

       -S        Securely prompts for password for user on chassis.

       -t portsfile
                 Specifies the file with a list of local HFI ports used to access fabric(s) for analysis.
                 Default is /etc/opa/ports

       -p ports  Specifies the list of local HFI ports used to access fabrics.


                 Default is first active port. The first HFI in the system is 1. The first port on an HFI is 1. Uses the format hfi:port,
                 for example:



                 0:0       First active port in system.





                 0:y       Port y within system.





                 x:0       First active port on HFI x.





                 x:y       HFI x, port y.



Environment Variables
       The following environment variables are also used by this command:

       FF_CHASSIS_ADMIN_PASSWORD
                 Password for chassis, used in absence of -S.

       PORTS     List of ports, used in absence of -t and -p.

       PORTS_FILE
                 File containing list of ports, used in absence of -t and -p.

Examples
       opagenesmchassis
       opagenesmchassis -S -p '1:1 1:2 2:1 2:2'

       Alternatively, while editing the file, use a vi command to include the output such as:
       :r! opagenesmchassis



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                           opagenesmchassis(8)
