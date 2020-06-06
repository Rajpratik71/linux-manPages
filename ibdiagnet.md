IBDIAGNET(1)                                                                                IB DIAGNOSTIC PACKAGE                                                                                IBDIAGNET(1)



NAME
       ibdiagnet - IB diagnostic net

SYNOPSYS
       ibdiagnet [-c <count>] [-v] [-r] [-vlr] [-u] [-o <out-dir>]
         [-t <topo-file>] [-s <sys-name>] [-i <dev-index>] [-p <port-num>] [-wt]
         [-pm] [-pc] [-P <<PM>=<Value>>]
         [-lw <1x|4x|12x>] [-ls <2.5|5|10>]
         [-skip <ibdiag_check/s>] [-load_db <db_file>]

DESCRIPTION
       ibdiagnet scans the fabric using directed route packets and extracts all the available information regarding its connectivity and devices.  It then produces the following files in the output
       directory (which defined by the -o option (see below)).

FILES
       ibdiagnet.log -
           A dump of all the application reports generate according to the provided flags

       ibdiagnet.lst -
           List of all the nodes, ports and links in the fabric

       ibdiagnet.fdbs -
           A dump of the unicast forwarding tables of the fabric switches

       ibdiagnet.mcfdbs -
           A dump of the multicast forwarding tables of the fabric switches

       ibdiagnet.masks -
           In case of duplicate port/node Guids, these file include the map between masked Guid and real Guids

       ibdiagnet.sm -
           List of all the SM (state and priority) in the fabric

       ibdiagnet.pm -
           A dump of the pm Counters values, of the fabric links

       ibdiagnet.pkey -
           A dump of the the existing partitions and their member host ports

       ibdiagnet.mcgs -
           A dump of the multicast groups, their properties and member host ports

       ibdiagnet.psl -
           A dump of the path record SL of each possible source node guid and DLID pairs.  Created only if -vlr option is provided

       ibdiagnet.slvl -
           A dump of the SL2VL Tables from all the switches.  Created only if -vlr option is provided

       ibdiagnet.db -
           A dump of the internal subnet database. This file can be loaded in later runs using the -load_db option

       In addition to generating the files above, the discovery phase also checks for duplicate node/port GUIDs in the IB fabric. If such an error is detected, it is displayed on the standard output. After
       the discovery phase is completed, directed route packets are sent multiple times (according to the -c option) to detect possible problematic paths on which packets may be lost. Such paths are
       explored, and a report of the suspected bad links is displayed on the standard output.

       After scanning the fabric, if the -r option is provided, a full report of the fabric qualities is displayed.  This report includes:

       ·   SM report

       ·   Number of nodes and systems

       ·   Hop-count information

            maximal hop-count, an example path, and a hop-count histogram
       ·   All CA-to-CA paths traced

       ·   Credit loop report

       ·   mgid-mlid-HCAs multicast group and report

       ·   Partitions report

       ·   IPoIB report

       Note: In case the IB fabric includes only one CA, then CA-to-CA paths are not reported.  Furthermore, if a topology file is provided, ibdiagnet uses the names defined in it for the output reports.

OPTIONS
       -c <count>      :
            Min number of packets to be sent across each link (default = 10)
       -v              :
            Enable verbose mode
       -r              :
            Provides a report of the fabric qualities
       -u              :
            Credit loop check based on UpDown rules
       -t <topo-file>  :
            Specifies the topology file name
       -s <sys-name>   :
            Specifies the local system name. Meaningful only if a topology file is specified
       -i <dev-index>  :
            Specifies the index of the device of the port used to connect to the IB fabric (in case of multiple devices on the local system)
       -p <port-num>   :
            Specifies the local device's port num used to connect to the IB fabric
       -o <out-dir>    :
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
       -skip <skip-option(s)> :
            Skip the executions of the selected checks. Skip options (one or more can be specified) : dup_guids  zero_guids pm logical_state part ipoib all
       -wt <file-name>> :
            Write out the discovered topology into the given file. This flag is useful if you later want to check for changes from the current state of the fabric. A directory named ibdiag_ibnl is also
           created by this option, and holds the IBNL files required to load this topology. To use these files you will need to set the environment variable named IBDM_IBNL_PATH to that directory. The
           directory is located in /var/cache/ibutils or in the output directory provided by the -o flag.
       -load_db <file-name>> :
            Load subnet data from the given .db file, and skip subnet discovery stage. Note: Some of the checks require actual subnet discovery, and therefore would not run when load_db is specified. These
           checks are : Duplicated/zero guids, link state, SMs status.
       -vlr :
            VL based Routing - provide this option to create the paths SL file (psl), SL2VL file (slvl) and use them in credit loops check (if -r option is provided).
               NOTE: Since number of paths is N^2 extracting the PSL file may take some time.

       -h|--help       :
            Prints the help page information
       -V|--version    :
            Prints the version of the tool
       --vars          :
            Prints the tool's environment variables and their values

ERROR CODES
       1 - Failed to fully discover the fabric
       2 - Failed to parse command line options
       3 - Failed to intract with IB fabric
       4 - Failed to use local device or local port
       5 - Failed to use Topology File
       6 - Failed to load requierd Package



IBDIAG 1.0                                                                                        2019-08-09                                                                                     IBDIAGNET(1)
