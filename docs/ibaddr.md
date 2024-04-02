IBADDR(8)                                                                                     OpenIB Diagnostics                                                                                    IBADDR(8)



NAME
       IBADDR - query InfiniBand address(es)

SYNOPSIS
       ibaddr [options]

DESCRIPTION
       Display the lid (and range) as well as the GID address of the port specified (by DR path, lid, or GUID) or the local port by default.

       Note: this utility can be used as simple address resolver.

OPTIONS
       --gid_show, -g show gid address only

       --lid_show, -l show lid range only

       --Lid_show, -L show lid range (in decimal) only

   Addressing Flags
       -D, --Direct     The address specified is a directed route

          Examples:
             [options] -D [options] "0"          # self port
             [options] -D [options] "0,1,2,1,4"  # out via port 1, then 2, ...

             (Note the second number in the path specified must match the port being
             used.  This can be specified using the port selection flag '-P' or the
             port found through the automatic selection process.)

       -G, --Guid     The address specified is a Port GUID

       -s, --sm_port <smlid>     use 'smlid' as the target lid for SA queries.

   Debugging flags
       -d     raise the IB debugging level.  May be used several times (-ddd or -d -d -d).

       -e     show send and receive errors (timeouts and others)

       -h, --help      show the usage message

       -v, --verbose
              increase the application verbosity level.  May be used several times (-vv or -v -v -v)

       -V, --version     show the version info.

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

       -t, --timeout <timeout_ms> override the default timeout for the solicited mads.

       --config, -z  <config_file> Specify alternate config file.
          Default: /etc/infiniband-diags/ibdiag.conf

FILES
   CONFIG FILE
       /etc/infiniband-diags/ibdiag.conf

       A global config file is provided to set some of the common options for all tools.  See supplied config file for details.

EXAMPLES
          ibaddr                  # local port\'s address
          ibaddr 32               # show lid range and gid of lid 32
          ibaddr -G 0x8f1040023   # same but using guid address
          ibaddr -l 32            # show lid range only
          ibaddr -L 32            # show decimal lid range only
          ibaddr -g 32            # show gid address only

SEE ALSO
       ibroute (8), ibtracert (8)

AUTHOR
       Hal Rosenstock
              < halr@voltaire.com >




                                                                                                                                                                                                    IBADDR(8)
