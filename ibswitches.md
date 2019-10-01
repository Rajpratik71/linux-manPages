IBSWITCHES(8)                                                                                 OpenIB Diagnostics                                                                                IBSWITCHES(8)



NAME
       IBSWITCHES - show InfiniBand switch nodes in topology

SYNOPSIS
       ibswitches [options] [<topology-file>]

DESCRIPTION
       ibswitches is a script which either walks the IB subnet topology or uses an already saved topology file and extracts the switch nodes.

OPTIONS
       -C, --Ca <ca_name>    use the specified ca_name.

       -P, --Port <ca_port>    use the specified ca_port.

       -t, --timeout <timeout_ms> override the default timeout for the solicited mads.

       -y, --m_key <key>
              use the specified M_key for requests. If non-numeric value (like 'x') is specified then a value will be prompted for.

       -h, --help      show the usage message

       --config, -z  <config_file> Specify alternate config file.
          Default: /etc/infiniband-diags/ibdiag.conf

   Local port Selection
       Multiple port/Multiple CA support: when no IB device or port is specified (see the "local umad parameters" below), the libibumad library selects the port to use by the following criteria:

          1. the first port that is ACTIVE.

          2. if not found, the first port that is UP (physical link up).

          If a port and/or CA name is specified, the libibumad library attempts to fulfill the user request, and will fail if it is not possible.

          For example:

              ibaddr                 # use the first port (criteria #1 above)
              ibaddr -C mthca1       # pick the best port from "mthca1" only.
              ibaddr -P 2            # use the second (active/up) port from the first available IB device.
              ibaddr -C mthca0 -P 2  # use the specified port only.

FILES
   CONFIG FILE
       /etc/infiniband-diags/ibdiag.conf

       A global config file is provided to set some of the common options for all tools.  See supplied config file for details.

   NODE NAME MAP FILE FORMAT
       The node name map is used to specify user friendly names for nodes in the output.  GUIDs are used to perform the lookup.

       This functionality is provided by the opensm-libs package.  See opensm(8) for the file location for your installation.

       Generically:

          # comment
          <guid> "<name>"

       Example:

          # IB1
          # Line cards
          0x0008f104003f125c "IB1 (Rack 11 slot 1   ) ISR9288/ISR9096 Voltaire sLB-24D"
          0x0008f104003f125d "IB1 (Rack 11 slot 1   ) ISR9288/ISR9096 Voltaire sLB-24D"
          0x0008f104003f10d2 "IB1 (Rack 11 slot 2   ) ISR9288/ISR9096 Voltaire sLB-24D"
          0x0008f104003f10d3 "IB1 (Rack 11 slot 2   ) ISR9288/ISR9096 Voltaire sLB-24D"
          0x0008f104003f10bf "IB1 (Rack 11 slot 12  ) ISR9288/ISR9096 Voltaire sLB-24D"

          # Spines
          0x0008f10400400e2d "IB1 (Rack 11 spine 1   ) ISR9288 Voltaire sFB-12D"
          0x0008f10400400e2e "IB1 (Rack 11 spine 1   ) ISR9288 Voltaire sFB-12D"
          0x0008f10400400e2f "IB1 (Rack 11 spine 1   ) ISR9288 Voltaire sFB-12D"
          0x0008f10400400e31 "IB1 (Rack 11 spine 2   ) ISR9288 Voltaire sFB-12D"
          0x0008f10400400e32 "IB1 (Rack 11 spine 2   ) ISR9288 Voltaire sFB-12D"

          # GUID   Node Name
          0x0008f10400411a08 "SW1  (Rack  3) ISR9024 Voltaire 9024D"
          0x0008f10400411a28 "SW2  (Rack  3) ISR9024 Voltaire 9024D"
          0x0008f10400411a34 "SW3  (Rack  3) ISR9024 Voltaire 9024D"
          0x0008f104004119d0 "SW4  (Rack  3) ISR9024 Voltaire 9024D"

SEE ALSO
       ibnetdiscover(8)

DEPENDENCIES
       ibnetdiscover, ibnetdiscover format

AUTHOR
       Hal Rosenstock
              < halr@voltaire.com >




                                                                                                                                                                                                IBSWITCHES(8)
