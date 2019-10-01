IBMGTSIM(1)                                                                                IB MANAGEMENT SIMULATOR                                                                                IBMGTSIM(1)



NAME
       IBMgtSim - Infiniband Management Simulator

SYNOPSYS
       IBMgtSim [-h] [-V mod-verb-pair-list] [-l log-file] [-p server-port]
         [-w num-threads] [-f flow-tcl-file] [-s seed] -t topology

DESCRIPTION
       Simulates the Fabric as defined by the given topology file and start a server to handle MAD requests from clients like OpenSM.

ARGUMENTS
-t topology
A topology file describing the fabric to be simulated (see ibdm-topo-file)

OPTIONS
-s seed
The seed to be used for random number generation.

-f flow-tcl-file
A tcl file to be sourced after the fabric is setup.

-l log-file
Set the log file of the simulator (default is /var/cache/ibutils/ibsim.log)

-p server-port
Set the port number the server attaches to (default 46517)

-w num-threads
The number of threads processing the mads

-V <module-verbosity-pair-list>
Provides a fine grain control over the log file verbosity. Given list of pairs of simulator software module names and their verbosity levels - every module is separatly controlled. The first value (missing
module name) is controlling the default verbosity for all un-explicitly set modules.

    Current Verbosity Levels:

     MsgShowFatal  = 0x01;
     MsgShowError  = 0x02;
     MsgShowWarning= 0x04;
     MsgShowInfo   = 0x08;
     MsgShowVerbose= 0x10;
     MsgShowContext= 0x20;
     MsgShowSource = 0x40;
     MsgShowTime   = 0x80;
     MsgShowModule = 0x100;
     MsgShowMads   = 0x200;
     MsgShowFrames = 0x400;
     MsgShowAll    = 0xffff;
     MsgDefault    = 0x62f;

    Software Modules:

    client, server, dispatcher, node, sma, lftMad, mftMad, vlArbMad, pKeyMad, portInfoMad

    Examples -V flag values might be:

     -V 0xffff = Full verbosity on all modules

     -V '0x3 server 0x6f2 sma 0xffff' = Only fatal and error for all modules
         full verbosity for the SMA module and default verbosity for the
         Server module.

-h
This help message

AUTHOR
       Eitan Zahavi, Mellanox Technologies LTD, eitan@mellanox.co.il



IBMGTSIM 1.0                                                                                      2008-06-16                                                                                      IBMGTSIM(1)
