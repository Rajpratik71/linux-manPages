IBCCCONFIG(8)                                                                                 OpenIB Diagnostics                                                                                IBCCCONFIG(8)



NAME
       IBCCCONFIG - configure congestion control settings

SYNOPSIS
       ibccconfig [common_options] [-c cckey] <op> <lid|guid> [port]

DESCRIPTION
       ibccconfig supports the configuration of congestion control settings on switches and HCAs.

       WARNING -- You should understand what you are doing before using this tool.  Misuse of this tool could result in a broken fabric.

OPTIONS
       Current supported operations and their parameters:
              CongestionKeyInfo  (CK)  <lid|guid>  <cckey>  <cckeyprotectbit> <cckeyleaseperiod> <cckeyviolations> SwitchCongestionSetting (SS) <lid|guid> <controlmap> <victimmask> <creditmask> <threshold>
              <packetsize> <csthreshold> <csreturndelay> <markingrate> SwitchPortCongestionSetting (SP) <lid|guid> <portnum> <valid> <control_type> <threshold> <packet_size> <cong_parm_marking_rate> CACon‐
              gestionSetting  (CS)  <lid|guid> <port_control> <control_map> <ccti_timer> <ccti_increase> <trigger_threshold> <ccti_min> CongestionControlTable (CT) <lid|guid> <cctilimit> <index> <cctentry>
              <cctentry> ...

       --cckey, -c, <cckey> Specify a congestion control (CC) key.  If none is specified, a key of 0 is used.

   Debugging flags
       -d     raise the IB debugging level.  May be used several times (-ddd or -d -d -d).

       -e     show send and receive errors (timeouts and others)

       -h, --help      show the usage message

       -v, --verbose
              increase the application verbosity level.  May be used several times (-vv or -v -v -v)

       -V, --version     show the version info.

   Addressing Flags
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

   Configuration flags
       -y, --m_key <key>
              use the specified M_key for requests. If non-numeric value (like 'x') is specified then a value will be prompted for.

       --config, -z  <config_file> Specify alternate config file.
          Default: /etc/infiniband-diags/ibdiag.conf

EXAMPLES
          ibccconfig SwitchCongestionSetting 2 0x1F 0x1FFFFFFFFF 0x0 0xF 8 0 0:0 1  # Configure Switch Congestion Settings
          ibccconfig CACongestionSetting 1 0 0x3 150 1 0 0                          # Configure CA Congestion Settings to SL 0 and SL 1
          ibccconfig CACongestionSetting 1 0 0x4 200 1 0 0                          # Configure CA Congestion Settings to SL 2
          ibccconfig CongestionControlTable 1 63 0 0:0 0:1 ...                      # Configure first block of Congestion Control Table
          ibccconfig CongestionControlTable 1 127 0 0:64 0:65 ...                   # Configure second block of Congestion Control Table

FILES
   CONFIG FILE
       /etc/infiniband-diags/ibdiag.conf

       A global config file is provided to set some of the common options for all tools.  See supplied config file for details.

AUTHOR
       Albert Chu
              < chu11@llnl.gov >




                                                                                                                                                                                                IBCCCONFIG(8)
