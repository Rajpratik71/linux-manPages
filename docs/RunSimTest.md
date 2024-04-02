RUNSIMTEST(1)                                                                              IB MANAGEMENT SIMULATOR                                                                              RUNSIMTEST(1)



NAME
       RunSimTest - Run a test over the IB management simulator

SYNOPSYS
       RunSimTest [-h] [-o osm-path][-f flow-file][-c checker-file]
          -t topology [-n osm-node-name][-p osm-port-num][-s seed][-V verbosity-list]

       This command starts the simulator and runs the the given test flow on top of it. Then it runs the checker flow. The default test flow starts OpenSM and wait for Subnet-Up event. User given flow can
       make use of the provided facilities for starting OpenSM and tracking it events.

ARGUMENTS
       -t topology
           A topology file describing the fabric (see ibdm-topo-file)

OPTIONS
       -f flow-file
           A tcl file sourced by the sim after the fabric is setup. See following discussion about the provided API and global variables that are available for the flow.

       -c checker-file
           A tcl file defining when osm completed and what checks are requierd to validate it's outputs. The procedure named 'checker' is invoked by the test flow to start the checking flow. The default
           flow waits for OpenSM to complete setup the fabric and run ibdmchk.

       -o osm-path
           Full path to OpenSM (/usr/local/ofed/osm-sim/bin/opensm). NOTE OpenSM should be compiled with --with-osmv=sim to be able to connect to the simulator.

       -n osm-node
           Topology file node name the SM runs on (default H-1/U1)

       -p port-num
           Port number the SM attaches to (default 1).

       -s seed
           Random seed to be used.

       -V verbosity-list
           Module verbosity list. The first should be the global verbosity. See IBMgtSim for full list of modules.  Examples:

            -V 0xffff = Full verbosity on all modules
            -V '"0x3 server 0x6f2 sma 0xffff"' = Only fatal and error
               for all modules full verbosity for the SMA module and default
               verbosity for the Server module.

       -h  This help message

AUTHOR
       Eitan Zahavi, Mellanox Technologies LTD, eitan@mellanox.co.il



IBMGTSIM 1.0                                                                                      2008-06-16                                                                                    RUNSIMTEST(1)
