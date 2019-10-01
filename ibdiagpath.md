IBDIAGPATH(1)                                                                               IB DIAGNOSTIC PACKAGE                                                                               IBDIAGPATH(1)



NAME
       ibdiagpath - IB diagnostic path

SYNOPSYS
       ibdiagpath
            {-n <[src-name,]dst-name>|-l <[src-lid,]dst-lid>|-d <p1,p2,p3,...>}
            [-c <count>] [-v] [-t <topo-file>] [-s <sys-name>] [-i <dev-index>]
            [-p <port-num>] [-o <out-dir>] [-lw <1x|4x|12x>] [-ls <2.5|5|10>] [-pm]
            [-pc] [-P <<PM counter>=<Trash Limit>>]

DESCRIPTION
       ibdiagpath traces a path between two end-points and provides information regarding the nodes and ports traversed along the path. It utilizes device specific health queries for the different devices
       along the traversed path.  The way ibdiagpath operates depends on the addressing mode used on the command line. If directed route adressing is used, the local node is the source node and the route
       to the destination port is known apriori.  On the other hand, if LID route (or by-name) addressing is imployed, then the source and destination ports of a route are specified by their LIDs (or by
       the names defined in the topology file). In this case, the actual path from the local port to the source port, and from the source port to the destination port, is defined by means of Subnet
       Management Linear Forwarding Table queries of the switch nodes along those paths. Therefore, the path cannot be predicted as it may change.  The tool allows omitting the source node, in which case
       the local port on the machine running the tool is assumed to be the source.  Note: When ibdiagpath queries for the performance counters along the path between the source and destination ports, it
       always traverses the LID route, even if a directed route is specified. If along the LID route one or more links are not in the ACTIVE state, ibdiagpath reports an error.  Checks for path validity
       from partitions, IPoIB and QoS perspectives are also provided.

       ibdiagpath.log -
           A dump of all the application reports generate according to the provided flags

       ibdiagnet.pm -
           A dump of the pm Counters values, of the fabric links

OPTIONS
       -n <[src-name,]dst-name> :
            Names of the source and destination ports (as defined in the topology file; source may be omitted -> local port is assumed to be the source)
       -l <[src-lid,]dst-lid> :
            Source and destination LIDs (source may be omitted -> local port is assumed to be the source)
       -d <p1,p2,p3,...> :
            directed route from the local node (which is the source) and the destination node
       -c <count> :
            The minimal number of packets to be sent across each link (default = 100)
       -v :
            Enable verbose mode
       -t <topo-file> :
            Specifies the topology file name
       -s <sys-name> :
            Specifies the local system name. Meaningful only if a topology file is specified
       -i <dev-index> :
            Specifies the index of the device of the port used to connect to the IB fabric (in case of multiple devices on the local system)
       -p <port-num> :
            Specifies the local device's port number used to connect to the IB fabric
       -o <out-dir> :
            Specifies the directory where the output files will be placed (default = /var/cache/ibutils)
       -lw <1x|4x|12x> :
            Specifies the expected link width
       -ls <2.5|5|10>  :
            Specifies the expected link speed
       -pm             :
            Dump all the fabric links, pm Counters into ibdiagnet.pm
       -pc             :
            Reset all the fabric links pmCounters
       -P <PM=<Trash>> :
            If any of the provided pm is greater then its provided value, print it to screen
       -h|--help       :
            Prints the help page information
       -V|--version :
            Prints the version of the tool
       --vars :
            Prints the tool's environment variables and their values

ERROR CODES
       1 - The path traced is un-healthy
       2 - Failed to parse command line options
       3 - More then 64 hops are required for traversing the local port to the "Source" port and then to the "Destination" port.
       4 - Unable to traverse the LFT data from source to destination
       5 - Failed to use Topology File
       6 - Failed to load required Package



IBDIAG 1.0                                                                                        2019-08-09                                                                                    IBDIAGPATH(1)
