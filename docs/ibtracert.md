IBTRACERT(8)                                                                                 Open IB Diagnostics                                                                                 IBTRACERT(8)



NAME
       ibtracert - trace InfiniBand path

SYNOPSIS
       ibtracert [options] [<lid|guid> [<startlid> [<endlid>]]]

DESCRIPTION
       ibtracert uses SMPs to trace the path from a source GID/LID to a destination GID/LID. Each hop along the path is displayed until the destination is reached or a hop does not respond. By using the -m
       option, multicast path tracing can be performed between source and destination nodes.

OPTIONS
       -n, --no_info
              simple format; don't show additional information

       -m     show the multicast trace of the specified mlid

       -f, --force
              force route to destination port

   Addressing Flags
       -G, --Guid     The address specified is a Port GUID

       -L, --Lid   The address specified is a LID

       -s, --sm_port <smlid>     use 'smlid' as the target lid for SA queries.

       --ports-file <ports-file>   Specify a ports file.
          This file contains multiple source and destination lid or guid pairs. See FILES section.

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

   PORTS FILE FORMAT
       The ports file can be used to specify multiple source and destination pairs.  They can be lids or guids.  If guids, use the -G option to indicate that.

       Generically:

          # comment
          <src> <dst>

       Example:

          73 207
          203 657
          531 101

          > OR <

          0x0008f104003f125c 0x0008f104003f133d
          0x0008f1040011ab07 0x0008f104004265c0
          0x0008f104007c5510 0x0008f1040099bb08

EXAMPLES
       Unicast examples

       ::     ibtracert 4 16                                  # show path between lids 4 and 16 ibtracert -n 4  16                                #  same,  but  using  simple  output  format  ibtracert  -G
              0x8f1040396522d 0x002c9000100d051  # use guid addresses

       Multicast example

       ::     ibtracert -m 0xc000 4 16    # show multicast path of mlid 0xc000 between lids 4 and 16

SEE ALSO
       ibroute (8)

AUTHOR
       Hal Rosenstock
              <hal.rosenstock@gmail.com>

       Ira Weiny
              < ira.weiny@intel.com >




                                                                                                                                                                                                 IBTRACERT(8)
