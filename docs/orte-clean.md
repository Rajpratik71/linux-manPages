orte-clean(1)                                                        Open MPI                                                        orte-clean(1)

NAME
       orte-clean - Cleans up any stale processes and files leftover from Open MPI jobs.

SYNOPSIS
       orte-clean [--verbose]
       mpirun --pernode [--host | --hostfile file] orte-clean [--verbose]

OPTIONS
       [-v | --verbose] This argument will run the command in verbose mode and print out the universes that are getting cleaned up as well as pro‐
       cesses that are being killed.

DESCRIPTION
       orte-clean attempts to clean up any processes and files left over from Open MPI jobs that were run in the past as  well  as  any  currently
       running jobs.  This includes OMPI infrastructure and helper commands, any processes that were spawned as part of the job, and any temporary
       files.  orte-clean will only act upon processes and files that belong to the user running the orte-clean command.  If run as root, it  will
       kill off processes belonging to any users.

       When run from the command line, orte-clean will attempt to clean up the local node it is run from.  When launched via mpirun, it will clean
       up the nodes selected by mpirun.

EXAMPLES
       Example 1: Clean up local node only.

       example% orte-clean

       Example 2: To clean up on a specific set of nodes specified on command line, it is recommended to use the pernode option.   This  will  run
       one orte-clean for each node.

       example% mpirun --pernode --host node1,node2,node3 orte-clean

       To clean up on a specific set of nodes from a file.

       example% mpirun --pernode --hostfile nodes_file orte-clean

       Example 3: Within a resource managed environment like N1GE, SLURM, or Torque.  The following example is from N1GE.

       First, we see that we have two nodes with two CPUs each.

       example% qsh -pe orte 4
       example% mpirun -np 4 hostname
       node1
       node1
       node2
       node2

       Clean up all the nodes in the cluster.

       example% mpirun --pernode orte-clean

       Clean up a subset of the nodes in the cluster.

       example% mpirun --pernode --host node1 orte-clean

SEE ALSO
       orterun(1), orte-ps(1)

1.10.2                                                             Jan 21, 2016                                                      orte-clean(1)
