SMPQUERY(8)                                                                                  Open IB Diagnostics                                                                                  SMPQUERY(8)



NAME
       smpquery - query InfiniBand subnet management attributes

SYNOPSIS
       smpquery [options] <op> <dest dr_path|lid|guid> [op params]

DESCRIPTION
       smpquery allows a basic subset of standard SMP queries including the following: node info, node description, switch info, port info. Fields are displayed in human readable format.

OPTIONS
       Current supported operations (case insensitive) and their parameters:

          Nodeinfo (NI) <addr>

          Nodedesc (ND) <addr>

          Portinfo (PI) <addr> [<portnum>]     # default port is zero

          PortInfoExtended (PIE) <addr> [<portnum>]

          Switchinfo (SI) <addr>

          PKeyTable (PKeys) <addr> [<portnum>]

          SL2VLTable (SL2VL) <addr> [<portnum>]

          VLArbitration (VLArb) <addr> [<portnum>]

          GUIDInfo (GI) <addr>

          MlnxExtPortInfo (MEPI) <addr> [<portnum>]  # default port is zero

       -c, --combined
              Use Combined route address argument <lid> <DR_Path>

       -x, --extended
              Set SMSupportsExtendedSpeeds bit 31 in AttributeModifier (only impacts PortInfo queries).

       -K, --show_keys
              show security keys (mkey, smkey, etc.) associated with the request.

   Addressing Flags
       -D, --Direct     The address specified is a directed route

          Examples:
             [options] -D [options] "0"          # self port
             [options] -D [options] "0,1,2,1,4"  # out via port 1, then 2, ...

             (Note the second number in the path specified must match the port being
             used.  This can be specified using the port selection flag '-P' or the
             port found through the automatic selection process.)

       -G, --Guid     The address specified is a Port GUID

       -L, --Lid   The address specified is a LID

       -s, --sm_port <smlid>     use 'smlid' as the target lid for SA queries.

   Port Selection flags
       -C, --Ca <ca_name>    use the specified ca_name.

       -P, --Port <ca_port>    use the specified ca_port.

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

   Debugging flags
       -d     raise the IB debugging level.  May be used several times (-ddd or -d -d -d).

       -e     show send and receive errors (timeouts and others)

       -h, --help      show the usage message

       -v, --verbose
              increase the application verbosity level.  May be used several times (-vv or -v -v -v)

       -V, --version     show the version info.

   Configuration flags
       -t, --timeout <timeout_ms> override the default timeout for the solicited mads.

       --node-name-map <node-name-map> Specify a node name map.
          This file maps GUIDs to more user friendly names.  See FILES section.

       -y, --m_key <key>
              use the specified M_key for requests. If non-numeric value (like 'x') is specified then a value will be prompted for.

       --config, -z  <config_file> Specify alternate config file.
          Default: /etc/infiniband-diags/ibdiag.conf

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

EXAMPLES
       ::     smpquery  portinfo  3  1                      #  portinfo by lid, with port modifier smpquery -G switchinfo 0x2C9000100D051 1  # switchinfo by guid smpquery -D nodeinfo 0                    #
              nodeinfo by direct route smpquery -c nodeinfo 6 0,12               # nodeinfo by combined route

SEE ALSO
       smpdump (8)

AUTHOR
       Hal Rosenstock
              < hal@mellanox.com >




                                                                                                                                                                                                  SMPQUERY(8)
