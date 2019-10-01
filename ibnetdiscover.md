IBNETDISCOVER(8)                                                                             Open IB Diagnostics                                                                             IBNETDISCOVER(8)



NAME
       IBNETDISCOVER - discover InfiniBand topology

SYNOPSIS
       ibnetdiscover [options] [<topology-file>]

DESCRIPTION
       ibnetdiscover  performs  IB  subnet discovery and outputs a human readable topology file. GUIDs, node types, and port numbers are displayed as well as port LIDs and NodeDescriptions.  All nodes (and
       links) are displayed (full topology).  Optionally, this utility can be used to list the current connected nodes by nodetype.  The output is printed to standard output unless a topology file is spec‐
       ified.

OPTIONS
       -l, --list List of connected nodes

       -g, --grouping Show grouping.  Grouping correlates IB nodes by different vendor specific schemes.  It may also show the switch external ports correspondence.

       -H, --Hca_list List of connected CAs

       -S, --Switch_list List of connected switches

       -R, --Router_list List of connected routers

       -s, --show Show progress information during discovery.

       -f, --full Show full information (ports' speed and width, vlcap)

       -p, --ports Obtain a ports report which is a list of connected ports with relevant information (like LID, portnum, GUID, width, speed, and NodeDescription).

       -m, --max_hops Report max hops discovered.

       --outstanding_smps, -o <val>
              Specify the number of outstanding SMP's which should be issued during the scan

              Default: 2

   Cache File flags
       --cache <filename> Cache the ibnetdiscover network data in the specified filename.  This cache may be used by other tools for later analysis.

       --load-cache <filename> Load and use the cached ibnetdiscover data stored in the specified filename.  May be useful for outputting and learning about other fabrics or a previous state of a fabric.

       --diff  <filename>  Load cached ibnetdiscover data and do a diff comparison to the current network or another cache.  A special diff output for ibnetdiscover output will be displayed showing differ‐
       ences between the old and current fabric.  By default, the following are compared for differences: switches, channel adapters, routers, and port connections.

       --diffcheck <key(s)> Specify what diff checks should be done in the --diff option above.  Comma separate multiple diff check key(s).  The available diff checks are:  sw  =  switches,  ca  =  channel
       adapters, router = routers, port = port connections, lid = lids, nodedesc = node descriptions.  Note that port, lid, and nodedesc are checked only for the node types that are specified (e.g. sw, ca,
       router).  If port is specified alongside lid or nodedesc, remote port lids and node descriptions will also be compared.

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
       -d     raise the IB debugging level.  May be used several times (-ddd or -d -d -d).

       -e     show send and receive errors (timeouts and others)

       -h, --help      show the usage message

       -v, --verbose
              increase the application verbosity level.  May be used several times (-vv or -v -v -v)

       -V, --version     show the version info.

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

   TOPOLOGY FILE FORMAT
       The topology file format is human readable and largely intuitive.  Most identifiers are given textual names like vendor ID (vendid), device ID  (device  ID),  GUIDs  of  various  types  (sysimgguid,
       caguid,  switchguid, etc.).  PortGUIDs are shown in parentheses ().  For switches, this is shown on the switchguid line.  For CA and router ports, it is shown on the connectivity lines.  The IB node
       is identified followed by the number of ports and a quoted the node GUID.  On the right of this line is a comment (#) followed by the NodeDescription in quotes.  If the node is a switch,  this  line
       also  contains whether switch port 0 is base or enhanced, and the LID and LMC of port 0.  Subsequent lines pertaining to this node show the connectivity.   On the left is the port number of the cur‐
       rent node.  On the right is the peer node (node at other end of link). It is identified in quotes with nodetype followed by - followed by NodeGUID with the port number in square  brackets.   Further
       on  the right is a comment (#).  What follows the comment is dependent on the node type.  If it it a switch node, it is followed by the NodeDescription in quotes and the LID of the peer node.  If it
       is a CA or router node, it is followed by the local LID and LMC and then followed by the NodeDescription in quotes and the LID of the peer node.  The active link width and speed are then appended to
       the end of this output line.

       An example of this is:

          #
          # Topology file: generated on Tue Jun  5 14:15:10 2007
          #
          # Max of 3 hops discovered
          # Initiated from node 0008f10403960558 port 0008f10403960559

          Non-Chassis Nodes

          vendid=0x8f1
          devid=0x5a06
          sysimgguid=0x5442ba00003000
          switchguid=0x5442ba00003080(5442ba00003080)
          Switch  24 "S-005442ba00003080"         # "ISR9024 Voltaire" base port 0 lid 6 lmc 0
          [22]    "H-0008f10403961354"[1](8f10403961355)         # "MT23108 InfiniHost Mellanox Technologies" lid 4 4xSDR
          [10]    "S-0008f10400410015"[1]         # "SW-6IB4 Voltaire" lid 3 4xSDR
          [8]     "H-0008f10403960558"[2](8f1040396055a)         # "MT23108 InfiniHost Mellanox Technologies" lid 14 4xSDR
          [6]     "S-0008f10400410015"[3]         # "SW-6IB4 Voltaire" lid 3 4xSDR
          [12]    "H-0008f10403960558"[1](8f10403960559)         # "MT23108 InfiniHost Mellanox Technologies" lid 10 4xSDR

          vendid=0x8f1
          devid=0x5a05
          switchguid=0x8f10400410015(8f10400410015)
          Switch  8 "S-0008f10400410015"          # "SW-6IB4 Voltaire" base port 0 lid 3 lmc 0
          [6]     "H-0008f10403960984"[1](8f10403960985)         # "MT23108 InfiniHost Mellanox Technologies" lid 16 4xSDR
          [4]     "H-005442b100004900"[1](5442b100004901)        # "MT23108 InfiniHost Mellanox Technologies" lid 12 4xSDR
          [1]     "S-005442ba00003080"[10]                # "ISR9024 Voltaire" lid 6 1xSDR
          [3]     "S-005442ba00003080"[6]         # "ISR9024 Voltaire" lid 6 4xSDR

          vendid=0x2c9
          devid=0x5a44
          caguid=0x8f10403960984
          Ca      2 "H-0008f10403960984"          # "MT23108 InfiniHost Mellanox Technologies"
          [1](8f10403960985)     "S-0008f10400410015"[6]         # lid 16 lmc 1 "SW-6IB4 Voltaire" lid 3 4xSDR

          vendid=0x2c9
          devid=0x5a44
          caguid=0x5442b100004900
          Ca      2 "H-005442b100004900"          # "MT23108 InfiniHost Mellanox Technologies"
          [1](5442b100004901)     "S-0008f10400410015"[4]         # lid 12 lmc 1 "SW-6IB4 Voltaire" lid 3 4xSDR

          vendid=0x2c9
          devid=0x5a44
          caguid=0x8f10403961354
          Ca      2 "H-0008f10403961354"          # "MT23108 InfiniHost Mellanox Technologies"
          [1](8f10403961355)     "S-005442ba00003080"[22]                # lid 4 lmc 1 "ISR9024 Voltaire" lid 6 4xSDR

          vendid=0x2c9
          devid=0x5a44
          caguid=0x8f10403960558
          Ca      2 "H-0008f10403960558"          # "MT23108 InfiniHost Mellanox Technologies"
          [2](8f1040396055a)     "S-005442ba00003080"[8]         # lid 14 lmc 1 "ISR9024 Voltaire" lid 6 4xSDR
          [1](8f10403960559)     "S-005442ba00003080"[12]                # lid 10 lmc 1 "ISR9024 Voltaire" lid 6 1xSDR

       When  grouping  is  used,  IB  nodes are organized into chassis which are numbered. Nodes which cannot be determined to be in a chassis are displayed as "Non-Chassis Nodes".  External ports are also
       shown on the connectivity lines.

AUTHORS
       Hal Rosenstock
              < halr@voltaire.com >

       Ira Weiny
              < ira.weiny@intel.com >




                                                                                                                                                                                             IBNETDISCOVER(8)
