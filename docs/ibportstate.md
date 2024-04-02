IBPORTSTATE(8)                                                                               Open IB Diagnostics                                                                               IBPORTSTATE(8)



NAME
       IBPORTSTATE - handle port (physical) state and link speed of an InfiniBand port

SYNOPSIS
       ibportstate [options] <dest dr_path|lid|guid> <portnum> [<op>]

DESCRIPTION
       ibportstate allows the port state and port physical state of an IB port to be queried (in addition to link width and speed being validated relative to the peer port when the port queried is a switch
       port), or a switch port to be disabled, enabled, or reset. It also allows the link speed/width enabled on any IB port to be adjusted.

OPTIONS
       <op>

              Supported ops: enable, disable, reset, speed, espeed, fdr10, width, query,
                     on, off, down, arm, active, vls, mtu, lid, smlid, lmc, mkey, mkeylease, mkeyprot (Default is query)

              enable, disable, and reset are only allowed on switch ports (An error is indicated if attempted on CA or router ports)

              off change the port state to disable.

              on change the port state to enable(only when the current state is disable).

              speed and width are allowed on any port

              speed values are the legal values for PortInfo:LinkSpeedEnabled (An error is indicated if PortInfo:LinkSpeedSupported does not support this setting)

              espeed is allowed on any port supporting extended link speeds

              fdr10 is allowed on any port supporting fdr10 (An error is indicated if port's capability mask indicates extended link speeds are not supported or if PortInfo:LinkSpeedExtSupported  does  not
              support this setting)

              width  values  are  legal  values  for  PortInfo:LinkWidthEnabled  (An  error is indicated if PortInfo:LinkWidthSupported does not support this setting) (NOTE: Speed and width changes are not
              effected until the port goes through link renegotiation)

              query also validates port characteristics (link width, speed, espeed, and fdr10) based on the peer port. This checking is done when the port queried is a switch port as it relies on  combined
              routing  (an  initial  LID route with directed routing to the peer) which can only be done on a switch. This peer port validation feature of query op requires LID routing to be functioning in
              the subnet.

              mkey, mkeylease, and mkeyprot are only allowed on CAs, routers, or switch port 0 (An error is generated if attempted on external switch ports).  Hexadecimal and octal mkeys may  be  specified
              by prepending the key with '0x' or '0', respectively.  If a non-numeric value (like 'x') is specified for the mkey, then ibportstate will prompt for a value.

   Addressing Flags
       -L, --Lid   The address specified is a LID

       -G, --Guid     The address specified is a Port GUID

       -D, --Direct     The address specified is a directed route

          Examples:
             [options] -D [options] "0"          # self port
             [options] -D [options] "0,1,2,1,4"  # out via port 1, then 2, ...

             (Note the second number in the path specified must match the port being
             used.  This can be specified using the port selection flag '-P' or the
             port found through the automatic selection process.)

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
       --config, -z  <config_file> Specify alternate config file.
          Default: /etc/infiniband-diags/ibdiag.conf

       -t, --timeout <timeout_ms> override the default timeout for the solicited mads.

       -y, --m_key <key>
              use the specified M_key for requests. If non-numeric value (like 'x') is specified then a value will be prompted for.

   Debugging flags
       -h, --help      show the usage message

       -d     raise the IB debugging level.  May be used several times (-ddd or -d -d -d).

       -e     show send and receive errors (timeouts and others)

       -K, --show_keys
              show security keys (mkey, smkey, etc.) associated with the request.

       -v, --verbose
              increase the application verbosity level.  May be used several times (-vv or -v -v -v)

       -V, --version     show the version info.

FILES
   CONFIG FILE
       /etc/infiniband-diags/ibdiag.conf

       A global config file is provided to set some of the common options for all tools.  See supplied config file for details.

EXAMPLES
       ::     ibportstate  3  1 disable                  # by lid ibportstate -G 0x2C9000100D051 1 enable  # by guid ibportstate -D 0 1                       # (query) by direct route ibportstate 3 1 reset
              # by lid ibportstate 3 1 speed 1                  # by lid ibportstate 3 1 width 1                  # by lid ibportstate -D 0 1 lid 0x1234 arm        # by direct route

AUTHOR
       Hal Rosenstock
              < hal.rosenstock@gmail.com >




                                                                                                                                                                                               IBPORTSTATE(8)
