IBDMCHK(1)                                                                                  IB DATA MODEL PACKAGE                                                                                  IBDMCHK(1)



NAME
       IBDM - Network Checker and Attributes Analyzer

SYNOPSYS
       ibdmchk has two operation modes: design and verification.

       DESIGN:

       ibdmchk [-v][-h][-u][-r <roots file>] -t <topology file> -n <SM Node>
         -p <SM Port> [-e] [-l <lmc>]

       VERIFICATION:

       ibdmchk [-v][-h][-r <roots file>] [-s <subnet file>] [-f <fdb file>]
         [-m <mcfdbs file> [-l <lmc>] [-u] [-M] [-a]
         [-c <path sl file>] [-d <sl2vl tables file>]

DESIGN MODE DESCRIPTION
       The Design mode is intended to be used before the cluster is built. It provides basic checks of the specified network as described by a topology file. After simulating the SM LID assignment and
       routing algorithms it provides reports of the (H)CA to (H)CA paths depth histogram and credit deadlock potential in the resulting routing scheme.

ARGUMENTS:
-t⎪--topo <topo file>
The topology file specifying the network. See man ibdm-topology-file

-n⎪--node <SM Node>
The name of the Subnet Manager node (syntax: <Topo-File-System>/U1)

-p⎪--port <SM Port>
The port number by which the SM nodes is attached to the fabric.

OPTIONS
-v⎪--verbose
Verbsoe mode

-h⎪--help
Provides this help message

-l⎪--lmc <lmc>
LMC value > 0 means assigning 2^lmc lids to each port.

-e⎪--enh
Use enhanced routing algorithm when LMC > 0 and report the resulting paths correlation (using same system/node) histogram

-r⎪--roots <roots file> A file with all the roots node names (one on each line).

VERIFICATION MODE DESCRIPTION
       After the cluster is built and OpenSM is run (using flag -D 0x43) it reports the subnet and FDB tables into the files osm-subnet.lst, osm.fdbs and osm.fdbs in /var/log/ (or subnet.lst, osm.fdbs and
       osm.mcfdbs into /var/cache/ibutils in older OpenSM versions). ibdiagnet is also producing the same files in its output directory.  Based on these files the utility checks all CA to CA connectivity.
       Further analysis for credit deadlock potential is performed and reported.  In case of an LMC > 0 it reports histograms for how many systems and nodes are common between the different paths for the
       same port pairs.

ARGUMENTS
-l⎪--lmc <lmc>
The LMC value used while running OpenSM. Mandatory if not the default 0.

OPTIONS
-v⎪--verbose
Verbsoe mode

-h⎪--help
Provides this help message

-s⎪--subnet <file>
OpenSM subnet.lst file (default is /var/log/osm-subnet.lst or /var/cache/ibutils/subnet.lst)

-f⎪--fdb <file>
OpenSM dump of Ucast LFDB. Use -D 0x41 to generate it (default is /var/log/osm.fdbs or /var/cache/ibutils/osm.fdbs).

-m⎪--mcfdb <file>
OpenSM dump of Multicast LFDB. Use -D 0x41 to generate it (default is /var/log/osm.mcfdbs or /var/cache/ibutils/osm.mcfdbs).

-c⎪--psl <file>
Source Guid to DLID -> Path SL mapping.  Each line holds: src_node_guid dlid sl.  Used by the credit loop check to accuartly model SL/VL based routing.

-d⎪--slvl <file>
SL2VL mapping of all switces.  Each line holds: swguid iport oport 0x(sl0)(sl1) 0x(sl2)(sl3)...  Used by the credit loop check to accuartly model SL/VL based routing.

-r⎪--roots <roots file>
A file holding all root nodes guids (one per line).

-u⎪--updn
Use Up/Down based credit loop check algorithm instead of the generic one.

-M⎪--MFT
Include multicast routing in credit loops analysis.

-a⎪--all
Verify not only CA-CA paths but also SW-SW, CA-SW and SW-CA.  Both check for FDB path connectivity and also for credit loops.

AUTHOR
       Eitan Zahavi, Mellanox Technologies LTD, eitan@mellanox.co.il



IBDM 1.0                                                                                          2009-03-17                                                                                       IBDMCHK(1)
