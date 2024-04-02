SMPDUMP(8)                                                                                   Open IB Diagnostics                                                                                   SMPDUMP(8)



NAME
       smpdump - dump InfiniBand subnet management attributes

SYNOPSIS
       smpdump [options] <dlid|dr_path> <attribute> [attribute_modifier]

DESCRIPTION
       smpdump is a general purpose SMP utility which gets SM attributes from a specified SMA. The result is dumped in hex by default.

OPTIONS
       dlid|drpath
              LID or DR path to SMA

       attribute
              IBA attribute ID for SM attribute

       attribute_modifier
              IBA modifier for SM attribute

       -s, --string
              Print strings in packet if possible

   Addressing Flags
       -D, --Direct     The address specified is a directed route

          Examples:
             [options] -D [options] "0"          # self port
             [options] -D [options] "0,1,2,1,4"  # out via port 1, then 2, ...

             (Note the second number in the path specified must match the port being
             used.  This can be specified using the port selection flag '-P' or the
             port found through the automatic selection process.)

       -L, --Lid   The address specified is a LID

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
       Direct Routed Examples

       ::     smpdump -D 0,1,2,3,5 16 # NODE DESC smpdump -D 0,1,2 0x15 2 # PORT INFO, port 2

       LID Routed Examples

       ::     smpdump 3 0x15 2        # PORT INFO, lid 3 port 2 smpdump 0xa0 0x11       # NODE INFO, lid 0xa0

SEE ALSO
       smpquery (8)

AUTHOR
       Hal Rosenstock
              < halr@voltaire.com >




                                                                                                                                                                                                   SMPDUMP(8)
