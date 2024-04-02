IBCCQUERY(8)                                                                                  OpenIB Diagnostics                                                                                 IBCCQUERY(8)



NAME
       IBCCQUERY - query congestion control settings/info

SYNOPSIS
       ibccquery [common_options] [-c cckey] <op> <lid|guid> [port]

DESCRIPTION
       ibccquery support the querying of settings and other information related to congestion control.

OPTIONS
       Current supported operations and their parameters:
              CongestionInfo  (CI) <addr> CongestionKeyInfo (CK) <addr> CongestionLog (CL) <addr> SwitchCongestionSetting (SS) <addr> SwitchPortCongestionSetting (SP) <addr> [<portnum>] CACongestionSetting
              (CS) <addr> CongestionControlTable (CT) <addr> Timestamp (TI) <addr>

       --cckey, -c <cckey> Specify a congestion control (CC) key.  If none is specified, a key of 0 is used.

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

FILES
   CONFIG FILE
       /etc/infiniband-diags/ibdiag.conf

       A global config file is provided to set some of the common options for all tools.  See supplied config file for details.

EXAMPLES
          ibccquery CongestionInfo 3              # Congestion Info by lid
          ibccquery SwitchPortCongestionSetting 3 # Query all Switch Port Congestion Settings
          ibccquery SwitchPortCongestionSetting 3 1 # Query Switch Port Congestion Setting for port 1

AUTHOR
       Albert Chu
              < chu11@llnl.gov >




                                                                                                                                                                                                 IBCCQUERY(8)
