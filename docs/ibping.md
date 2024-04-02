IBPING(8)                                                                                    Open IB Diagnostics                                                                                    IBPING(8)



NAME
       IBPING - ping an InfiniBand address

SYNOPSIS
       ibping [options] <dest lid | guid>

DESCRIPTION
       ibping  uses  vendor  mads  to validate connectivity between IB nodes.  On exit, (IP) ping like output is show. ibping is run as client/server.  Default is to run as client. Note also that a default
       ping server is implemented within the kernel.

OPTIONS
       -c, --count stop after count packets

       -f, --flood flood destination: send packets back to back without delay

       -o, --oui use specified OUI number to multiplex vendor mads

       -S, --Server start in server mode (do not return)

   Addressing Flags
       -L, --Lid   The address specified is a LID

       -G, --Guid     The address specified is a Port GUID

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

   Debugging flags
       -h, --help      show the usage message

       -d     raise the IB debugging level.  May be used several times (-ddd or -d -d -d).

       -e     show send and receive errors (timeouts and others)

       -v, --verbose
              increase the application verbosity level.  May be used several times (-vv or -v -v -v)

       -V, --version     show the version info.

FILES
   CONFIG FILE
       /etc/infiniband-diags/ibdiag.conf

       A global config file is provided to set some of the common options for all tools.  See supplied config file for details.

AUTHOR
       Hal Rosenstock
              < halr@voltaire.com >




                                                                                                                                                                                                    IBPING(8)
