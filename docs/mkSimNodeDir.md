MKSIMNODEDIR(1)                                                                            IB MANAGEMENT SIMULATOR                                                                            MKSIMNODEDIR(1)



NAME
       mkSimNodeDir -  Create a /proc like files for a simulated node

SYNOPSYS
       mkSimNodeDir -n node-name [-g sim-guids-file]

DESCRIPTION
       This utility build the /proc like file tree for the given node based on the guids dump file produced by the simulator.

ARGUMENTS
       -n node-name
           The node name to create the files for.

       -g sim-guids-file
           Dump file to use. default is ./ibmgtsim.guids.txt

LIMITATIONS
       Only HCAs are supported.

       Single HCA per guid.

AUTHOR
       Eitan Zahavi, Mellanox Technologies LTD, eitan@mellanox.co.il



IBMGTSIM 1.0                                                                                      2008-06-16                                                                                  MKSIMNODEDIR(1)
