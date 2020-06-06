FCNSQ(8)                                                                                       Open-FCoE Tools                                                                                       FCNSQ(8)



NAME
       fcnsq - Fibre Channel Name Server Query Tool

SYNOPSIS
       fcnsq host --gpn port_id [-q | --quiet]

       fcnsq host --gnn port_id [-q | --quiet]

       fcnsq host --gspn port_id [-q | --quiet]

       fcnsq host --gsnn wwpn [-q | --quiet]

       fcnsq ?

DESCRIPTION
       The fcnsq command performs Fibre Channel Name Server queries for a user-specified FC Host. The supported name server query commands include: Get Port Name (GPN), Get Node Name (GNN), Get Symbolic
       Node Name (GSNN), and Get Symbolic Port Name (GSPN) as described in FC-GS-3 for the Common Transport (CT) services.

       fcnsq takes the host bsg name as the input for the target host. Host bsg name must be a valid bsg device, e.g., "host12" as derived from /dev/bsg/fc_host12. For each name server query command, the
       argument is either a Port ID or a World Wide Port Name. Port IDs and World Wide Names must be specified in hexadecimal. To disable verbose output, use the --quiet option.

OPTIONS
       host --gpn port_id
           Get Port Name by Port ID for host.

       host --gnn port_id
           Get Node Name by Port ID for host.

       host --gspn port_id
           Get Symbolic Port Name by Port ID for host.

       host --gsnn wwpn
           Get Symbolic Node Name by World Wide Port Name for host.

       -q, --quiet
           Disable verbose output.

       ?
           Display a help message with basic usage instructions.

EXAMPLES
       Query Get Port Name (GPN) from host12 for Port ID 0xbf0027

           fcnsq host12 --gpn bf0027

       Query Get Node Name (GNN) from host12 for Port ID 0xbf0027

           fcnsq host12 --gnn bf0027

       Query Get Symbolic Port Name (GSPN) from host12 for Port ID 0xbf0027

           fcnsq host12 --gspn bf0027

       Query Get Symbolic Node Name (GSNN) from host12 for WWWPN 0x1000001B213C9DDA

           fcnsq host12 --gsnn 0x1000001B213C9DDA

SEE ALSO
       fcoeadm(8)

SUPPORT
       fcnsq is part of the fcoe-utils package, maintained through the Open-FCoE project. Resources for both developers and users can be found at the Open-FCoE website http://open-fcoe.org/.



Open-FCoE                                                                                         06/09/2010                                                                                         FCNSQ(8)
