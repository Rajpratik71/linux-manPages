HWLOC-ASSEMBLER-REMOTE(1)                                              hwloc                                             HWLOC-ASSEMBLER-REMOTE(1)

NAME
       hwloc-assembler-remote - Assemble multiple remote host topologies

SYNOPSIS
       hwloc-assembler-remote [options] output.xml host1 host2 ...

OPTIONS
       --ssh <ssh>
              Use the given ssh command (and options) to connect to remote hosts.

       --lstopo-path <path>
              Use  the  given path as the remote lstopo command when gathering remote topologies.  By default, lstopo is taken from the PATH envi‐
              ronment variable.

       --lstopo-opts <opts>
              Pass the given lstopo options when gathering remote topologies.

       --show Display the resulting topology before exit.

       -f --force
              Ignore failure to load a remote host topology.

DESCRIPTION
       hwloc-assembler-remote is a frontend to hwloc-assembler.  It takes care of retrieving the remote nodes' topologies before  assembling  them
       with hwloc-assembler.

EXAMPLES
       To assemble three nodes topologies:

           $ hwloc-assembler-remote output.xml host1 host2 host3

       To assemble the topology of a multi-process MPI job defined as a machinefile:

           $ hwloc-assembler-remote output.xml `cat machinefile | sort | uniq`

RETURN VALUE
       Upon successful execution, hwloc-assembler-remote returns 0.

       hwloc-assembler-remote will return nonzero if any kind of error occurs, such as (but not limited to) failure to parse the command line.

SEE ALSO
       hwloc(7), lstopo(1), hwloc-assembler(1)

1.11.2                                                             Dec 17, 2015                                          HWLOC-ASSEMBLER-REMOTE(1)
