IBSTAT(8)                                                                                    Open IB Diagnostics                                                                                    IBSTAT(8)



NAME
       ibstat - query basic status of InfiniBand device(s)

SYNOPSIS
       ibstat [options] <ca_name> [portnum]

DESCRIPTION
       ibstat is a binary which displays basic information obtained from the local IB driver. Output includes LID, SMLID, port state, link width active, and port physical state.

       It is similar to the ibstatus utility but implemented as a binary rather than a script. It has options to list CAs and/or ports and displays more information than ibstatus.

OPTIONS
       -l, --list_of_cas
              list all IB devices

       -s, --short
              short output

       -p, --port_list
              show port list

       ca_name
              InfiniBand device name

       portnum
              port number of InfiniBand device

   Debugging flags
       -d     raise the IB debugging level.  May be used several times (-ddd or -d -d -d).

       -h, --help      show the usage message

       -v, --verbose
              increase the application verbosity level.  May be used several times (-vv or -v -v -v)

       -V, --version     show the version info.

   Configuration flags
       --config, -z  <config_file> Specify alternate config file.
          Default: /etc/infiniband-diags/ibdiag.conf

EXAMPLES
       ::     ibstat             #  display  status  of  all ports on all IB devices ibstat -l         # list all IB devices ibstat -p         # show port guids ibstat mthca0 2   # show status of port 2 of
              'mthca0'

SEE ALSO
       ibstatus (8)

AUTHOR
       Hal Rosenstock
              < halr@voltaire.com >




                                                                                                                                                                                                    IBSTAT(8)
