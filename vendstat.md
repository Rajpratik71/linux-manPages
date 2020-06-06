VENDSTAT(8)                                                                                  Open IB Diagnostics                                                                                  VENDSTAT(8)



NAME
       vendstat - query InfiniBand vendor specific functions

SYNOPSIS
       vendstat [options] <lid|guid>

DESCRIPTION
       vendstat uses vendor specific MADs to access beyond the IB spec vendor specific functionality. Currently, there is support for Mellanox InfiniSwitch-III (IS3) and InfiniSwitch-IV (IS4).

OPTIONS
       -N     show IS3 or IS4 general information.

       -w     show IS3 port xmit wait counters.

       -i     show IS4 counter group info.

       -c <num,num>
              configure IS4 counter groups.

              Configure IS4 counter groups 0 and 1. Such configuration is not persistent across IS4 reboot.  First number is for counter group 0 and second is for counter group 1.

              Group 0 counter config values:

       ::
                 0 - PortXmitDataSL0-7 1 - PortXmitDataSL8-15 2 - PortRcvDataSL0-7

              Group 1 counter config values:

       ::     1 - PortXmitDataSL8-15 2 - PortRcvDataSL0-7 8 - PortRcvDataSL8-15

       -R, --Read <addr,mask>
              Read configuration space record at addr

       -W, --Write <addr,val,mask>
              Write configuration space record at addr

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

   Debugging flags
       -d     raise the IB debugging level.  May be used several times (-ddd or -d -d -d).

       -e     show send and receive errors (timeouts and others)

       -h, --help      show the usage message

       -v, --verbose
              increase the application verbosity level.  May be used several times (-vv or -v -v -v)

       -V, --version     show the version info.

   Configuration flags
       -t, --timeout <timeout_ms> override the default timeout for the solicited mads.

       --config, -z  <config_file> Specify alternate config file.
          Default: /etc/infiniband-diags/ibdiag.conf

FILES
   CONFIG FILE
       /etc/infiniband-diags/ibdiag.conf

       A global config file is provided to set some of the common options for all tools.  See supplied config file for details.

EXAMPLES
       ::     vendstat -N 6           # read IS3 or IS4 general information vendstat -w 6           # read IS3 port xmit wait counters vendstat -i 6 12        # read IS4 port 12 counter group info vendstat
              -c 0,1 6 12    # configure IS4 port 12 counter groups for PortXmitDataSL vendstat -c 2,8 6 12    # configure IS4 port 12 counter groups for PortRcvDataSL

AUTHOR
       Hal Rosenstock
              < hal.rosenstock@gmail.com >




                                                                                                                                                                                                  VENDSTAT(8)
