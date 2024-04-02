IBDMTR(1)                                                                                   IB DATA MODEL PACKAGE                                                                                   IBDMTR(1)



NAME
       ibdmtr -  Fabric Trace Route

SYNOPSYS
       ibdmtr [-v][-h] {-c <cbaling file>⎪-t <topo file>} -s <sm node name>
         -p <sm port num> -d <comma-sep-dr-path>

DESCRIPTION
       This utility parses a cabling list or topology file describing the systems connections that make a fabric.  Then it start following the direct route provided and print out the systems and nodes on
       the route.

ARGUMENTS Required arguments description.
       -t⎪--topology <file>
           Topology file describing the network. See man ibdm-topology-file.
       -c⎪--cables <file>
           Cabling list file. Following the line format:

           <Sys1Type> <Sys1Name> <Port1Name> <Sys2Type> <Sys2Name> <Port2Name>

       -s⎪--sm-node <name>
           The name of the SM node (not system). E.g. OSM/U1.
       -p⎪--port-num <num>
           The number of the SM node port the SM is attached to
       -d⎪--dr-path <comm-sep-dr-path>
           A list of ports to go out through

OPTIONS
       -v⎪--verbose
           verbsoe mode
       -h⎪--help
           provide this help message

AUTHOR
       Eitan Zahavi, Mellanox Technologies LTD, eitan@mellanox.co.il



IBDM 1.0                                                                                          2008-06-16                                                                                        IBDMTR(1)
