SAQUERY(8)                                                                                   Open IB Diagnostics                                                                                   SAQUERY(8)



NAME
       saquery - query InfiniBand subnet administration attributes

SYNOPSIS
       saquery [options] [<name> | <lid> | <guid>]

DESCRIPTION
       saquery issues the selected SA query. Node records are queried by default.

OPTIONS
       -p     get PathRecord info

       -N     get NodeRecord info

       -D, --list
              get NodeDescriptions of CAs only

       -S     get ServiceRecord info

       -I     get InformInfoRecord (subscription) info

       -L     return the Lids of the name specified

       -l     return the unique Lid of the name specified

       -G     return the Guids of the name specified

       -O     return the name for the Lid specified

       -U     return the name for the Guid specified

       -c     get the SA's class port info

       -s     return the PortInfoRecords with isSM or isSMdisabled capability mask bit on

       -g     get multicast group info

       -m     get  multicast member info.  If a group is specified, limit the output to the group specified and print one line containing only the GUID and node description for each entry. Example: saquery
              -m 0xc000

       -x     get LinkRecord info

       --src-to-dst <src:dst>
              get a PathRecord for <src:dst> where src and dst are either node names or LIDs

       --sgid-to-dgid <sgid:dgid>
              get a PathRecord for sgid to dgid where both GIDs are in an IPv6 format acceptable to inet_pton (3)

       --smkey <val>
              use SM_Key value for the query. Will be used only with "trusted" queries.  If non-numeric value (like 'x') is specified then saquery will prompt for a value.  Default (when not specified here
              or in /etc/infiniband-diags/ibdiag.conf) is to use SM_Key == 0 (or "untrusted")

       -K, --show_keys
              show security keys (mkey, smkey, etc.) associated with the request.

       --slid <lid> Source LID (PathRecord)

       --dlid <lid> Destination LID (PathRecord)

       --mlid <lid> Multicast LID (MCMemberRecord)

       --sgid <gid> Source GID (IPv6 format) (PathRecord)

       --dgid <gid> Destination GID (IPv6 format) (PathRecord)

       --gid <gid> Port GID (MCMemberRecord)

       --mgid <gid> Multicast GID (MCMemberRecord)

       --reversible Reversible path (PathRecord)

       --numb_path Number of paths (PathRecord)

       --pkey P_Key (PathRecord, MCMemberRecord). If non-numeric value (like 'x')
              is specified then saquery will prompt for a value

       --qos_class QoS Class (PathRecord)

       --sl Service level (PathRecord, MCMemberRecord)

       --mtu MTU and selector (PathRecord, MCMemberRecord)

       --rate Rate and selector (PathRecord, MCMemberRecord)

       --pkt_lifetime Packet lifetime and selector (PathRecord, MCMemberRecord)

       --qkey Q_Key (MCMemberRecord). If non-numeric value (like 'x') is specified
              then saquery will prompt for a value

       --tclass Traffic Class (PathRecord, MCMemberRecord)

       --flow_label Flow Label (PathRecord, MCMemberRecord)

       --hop_limit Hop limit (PathRecord, MCMemberRecord)

       --scope Scope (MCMemberRecord)

       --join_state Join state (MCMemberRecord)

       --proxy_join Proxy join (MCMemberRecord)

       --service_id ServiceID (PathRecord)

       Supported query names (and aliases):

          ClassPortInfo (CPI)
          NodeRecord (NR) [lid]
          PortInfoRecord (PIR) [[lid]/[port]/[options]]
          SL2VLTableRecord (SL2VL) [[lid]/[in_port]/[out_port]]
          PKeyTableRecord (PKTR) [[lid]/[port]/[block]]
          VLArbitrationTableRecord (VLAR) [[lid]/[port]/[block]]
          InformInfoRecord (IIR)
          LinkRecord (LR) [[from_lid]/[from_port]] [[to_lid]/[to_port]]
          ServiceRecord (SR)
          PathRecord (PR)
          MCMemberRecord (MCMR)
          LFTRecord (LFTR) [[lid]/[block]]
          MFTRecord (MFTR) [[mlid]/[position]/[block]]
          GUIDInfoRecord (GIR) [[lid]/[block]]
          SwitchInfoRecord (SWIR) [lid]
          SMInfoRecord (SMIR) [lid]

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

       --outstanding_smps, -o <val>
              Specify the number of outstanding SMP's which should be issued during the scan

              Default: 2

       --node-name-map <node-name-map> Specify a node name map.
          This file maps GUIDs to more user friendly names.  See FILES section.

       --config, -z  <config_file> Specify alternate config file.
          Default: /etc/infiniband-diags/ibdiag.conf

COMMON FILES
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

DEPENDENCIES
       OpenSM (or other running SM/SA), libosmcomp, libibumad, libibmad

AUTHORS
       Ira Weiny
              < ira.weiny@intel.com >

       Hal Rosenstock
              < halr@mellanox.com >




                                                                                                                                                                                                   SAQUERY(8)
