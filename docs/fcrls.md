FCRLS(8)                                                                                       Open-FCoE Tools                                                                                       FCRLS(8)



NAME
       fcrls - Fibre Channel Read Link Error Status Block (RLS) tool

SYNOPSIS
       fcrls --port rport_bsg_name [--quiet]

       fcrls --fcid rport_port_FC-ID [--quiet]

       fcrls --help

DESCRIPTION
       The fcrls command performs Fibre Channel Read Link Error Status Block (RLS) ELS request (see FC-LS-2) via BSG over a given rport bsg name or FC-ID.

       fcrls takes either a rport bsg name or a rport port FC-ID as the input. To disable verbose output, use the --quiet option.

OPTIONS
       --port rport_bsg_name
           Send RLS to a rport by FC remote port bsg name, e.g., rport-7:0-1.

       --fcid rport_port_FC-ID
           Send RLS to a rport by port FC-ID, e.g., 0xce000d.

       --quiet
           Disable verbose output.

       --help
           Display a help message with basic usage instructions.

EXAMPLES
       Sends RLS to the FC remote port as rport-7:0-1

           fcrls --port rport-7:0-1

       Sends RLS to the FC remote port with 0xce000d as its port FC-ID

           fcrls --fcid 0xce000d

SEE ALSO
       fcoeadm(8)

SUPPORT
       fcrls is part of the fcoe-utils package, maintained through the Open-FCoE project. Resources for both developers and users can be found at the Open-FCoE website http://open-fcoe.org/.



Open-FCoE                                                                                         02/06/2013                                                                                         FCRLS(8)
