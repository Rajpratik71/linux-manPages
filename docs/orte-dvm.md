ORTE-DVM(1)                                                          Open MPI                                                          ORTE-DVM(1)

NAME
       orte-dvm, ompi_dvm - Establish a Distributed Virtual Machine (DVM).

       Note: orte-dvm and ompi-dvm are synonyms for each other.  Using either of the names will produce the same behavior.

SYNOPSIS
       orte-dvm [ options ]

       Invoking  orte-dvm via an absolute path name is equivalent to specifying the --prefix option with a <dir> value equivalent to the directory
       where orte-dvm resides, minus its last subdirectory.  For example:

           % /usr/local/bin/orte-dvm ...

       is equivalent to

           % orte-dvm --prefix /usr/local

QUICK SUMMARY
       orte-dvm will establish a DVM that can be used to execute subsequent applications. Use of orte-dvm can be advantageous, for  example,  when
       you  want to execute a number of short-lived tasks. In such cases, the time required to start the ORTE DVM can be a significant fraction of
       the time to execute the overall application. Thus, creating a persistent DVM can speed the overall execution. In addition, a persistent DVM
       will support executing multiple parallel applications while maintaining separation between their respective cores.

OPTIONS
       -h, --help
              Display help for this command

       -V, --version
              Print version number.  If no other arguments are given, this will also cause orte-dvm to exit.

       Use one of the following options to specify which hosts (nodes) of the cluster to use for the DVM.

       -H, -host, --host <host1,host2,...,hostN>
              List of hosts for the DVM.

       -hostfile, --hostfile <hostfile>
              Provide a hostfile to use.

       -machinefile, --machinefile <machinefile>
              Synonym for -hostfile.

       --prefix <dir>
              Prefix  directory that will be used to set the PATH and LD_LIBRARY_PATH on the remote node before invoking the ORTE daemon.  Setting
              MCA parameters:

       -gmca, --gmca <key> <value>
              Pass global MCA parameters that are applicable to all contexts. <key> is the parameter name; <value> is the parameter value.

       -mca, --mca <key> <value>
              Send arguments to various MCA modules.  See the "MCA" section, below.

       -report-uri, --report-uri <channel>
              Print out orte-dvm's URI during startup. The channel must be either a '-' to indicate that the URI is to be output to stdout, a  '+'
              to indicate that the URI is to be output to stderr, or a filename to which the URI is to be written.

       The following options are useful for developers; they are not generally useful to most ORTE and/or MPI users:

       -d, --debug-devel
              Enable debugging of the ORTE layer.

       --debug-daemons-file
              Enable debugging of the ORTE daemons in the DVM, storing output in files.

       There may be other options listed with orte-dvm --help.

DESCRIPTION
       orte-dvm  starts  a Distributed Virtual Machine (DVM) by launching a daemon on each node of the allocation, as modified or specified by the
       -host and -hostfile options. Applications can subsequently be executed using the orte-submit command.  The DVM remains in  operation  until
       receiving the orte-submit -terminate command.

   Specifying Host Nodes
       Host nodes can be identified on the orte-dvm command line with the -host option or in a hostfile.

       For example,

       orte-dvm -H aa,aa,bb ./a.out
           launches two processes on node aa and one on bb.

       Or, consider the hostfile

          % cat myhostfile
          aa slots=2
          bb slots=2
          cc slots=2

       Here,  we  list  both  the host names (aa, bb, and cc) but also how many "slots" there are for each.  Slots indicate how many processes can
       potentially execute on a node.  For best performance, the number of slots may be chosen to be the number of cores on the node or the number
       of processor sockets.  If the hostfile does not provide slots information, a default of 1 is assumed.  When running under resource managers
       (e.g., SLURM, Torque, etc.), Open MPI will obtain both the hostnames and the number of slots directly from the resource manger.

1.10.2                                                             Jan 21, 2016                                                        ORTE-DVM(1)
