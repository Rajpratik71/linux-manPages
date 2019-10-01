IBLINKINFO(8)                                                                                 OpenIB Diagnostics                                                                                IBLINKINFO(8)



NAME
       IBLINKINFO - report link info for all links in the fabric

SYNOPSIS
       iblinkinfo <options>

DESCRIPTION
       iblinkinfo reports link info for each port in an IB fabric, node by node.  Optionally, iblinkinfo can do partial scans and limit its output to parts of a fabric.

OPTIONS
       --down, -d Print only nodes which have a port in the "Down" state.

       --line, -l Print all information for each link on one line. Default is to print a header with the node information and then a list for each port (useful for grep'ing output).

       --additional, -p Print additional port settings (<LifeTime>,<HoqLife>,<VLStallCount>)

       --switches-only Show only switches in output.

       --cas-only Show only CAs in output.

   Partial Scan flags
       The node to start a partial scan can be specified with the following addresses.

       --port-guid, -G <port_guid>  Specify a port_guid

       -D, --Direct <dr_path>     The address specified is a directed route

          Examples:
             -D "0"          # self port
             -D "0,1,2,1,4"  # out via port 1, then 2, ...

             (Note the second number in the path specified must match the port being
             used.  This can be specified using the port selection flag '-P' or the
             port found through the automatic selection process.)

       Note: For switches results are printed for all ports not just switch port 0.

       --switch, -S <port_guid> same as "-G". (provided only for backward compatibility)

       How much of the scan to be printed can be controlled with the following.

       --all, -a Print all nodes found in a partial fabric scan.  Normally a partial fabric scan will return only the node specified.  This option will print the other nodes found as well.

       --hops, -n <hops> Specify the number of hops away from a specified node to scan.  This is useful to expand a partial fabric scan beyond the node specified.

   Cache File flags
       --load-cache <filename> Load and use the cached ibnetdiscover data stored in the specified filename.  May be useful for outputting and learning about other fabrics or a previous state of a fabric.

       --diff  <filename>  Load cached ibnetdiscover data and do a diff comparison to the current network or another cache.  A special diff output for ibnetdiscover output will be displayed showing differ‐
       ences between the old and current fabric.  By default, the following are compared for differences: switches, channel adapters, routers, and port connections.

       --diffcheck <key(s)> Specify what diff checks should be done in the --diff option above.  Comma separate multiple diff check key(s).  The available diff checks are: port = port connections, state  =
       port state, lid = lids, nodedesc = node descriptions.  Note that port, lid, and nodedesc are checked only for the node types that are specified (e.g.  switches-only, cas-only).  If port is specified
       alongside lid or nodedesc, remote port lids and node descriptions will also be compared.

       --filterdownports <filename> Filter downports indicated in a ibnetdiscover cache.  If a port was previously indicated as down in the specified cache, and is still down,  do  not  output  it  in  the
       resulting  output.  This option may be particularly useful for environments where switches are not fully populated, thus much of the default iblinkinfo info is considered useless.  See ibnetdiscover
       for information on caching ibnetdiscover output.

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

   Configuration flags
       --config, -z  <config_file> Specify alternate config file.
          Default: /etc/infiniband-diags/ibdiag.conf

       --outstanding_smps, -o <val>
              Specify the number of outstanding SMP's which should be issued during the scan

              Default: 2

       --node-name-map <node-name-map> Specify a node name map.
          This file maps GUIDs to more user friendly names.  See FILES section.

       -t, --timeout <timeout_ms> override the default timeout for the solicited mads.

       -y, --m_key <key>
              use the specified M_key for requests. If non-numeric value (like 'x') is specified then a value will be prompted for.

   Debugging flags
       -e     show send and receive errors (timeouts and others)

       -h, --help      show the usage message

       -v, --verbose
              increase the application verbosity level.  May be used several times (-vv or -v -v -v)

       -V, --version     show the version info.

EXIT STATUS
       0 on success, -1 on failure to scan the fabric, 1 if check mode is used and inconsistencies are found.

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

AUTHOR
       Ira Weiny
              < ira.weiny@intel.com >




                                                                                                                                                                                                IBLINKINFO(8)
