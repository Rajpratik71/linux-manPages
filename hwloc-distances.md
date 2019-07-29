HWLOC-DISTANCES(1)                                                     hwloc                                                    HWLOC-DISTANCES(1)

NAME
       hwloc-distances - Displays distance matrices

SYNOPSIS
       hwloc-distances [options]

OPTIONS
       -l --logical
              Display hwloc logical indexes (default) instead of physical/OS indexes.

       -p --physical
              Display OS/physical indexes instead of hwloc logical indexes.

       -i <file>, --input <file>
              Read topology from XML file <file> (instead of discovering the topology on the local machine).  If <file> is "-", the standard input
              is used.  XML support must have been compiled in to hwloc for this option to be usable.

       -i <directory>, --input <directory>
              Read topology from the chroot specified by <directory> (instead of discovering the topology on the local machine).  This  option  is
              generally only available on Linux.  The chroot was usually created by gathering another machine topology with hwloc-gather-topology.

       -i <specification>, --input <specification>
              Simulate  a  fake  hierarchy  (instead  of  discovering the topology on the local machine). If <specification> is "node:2 pu:3", the
              topology will contain two NUMA nodes with 3 processing units in each of them.  The <specification> string must end with a number  of
              PUs.

       --if <format>, --input-format <format>
              Enforce the input in the given format, among xml, fsroot and synthetic.

       --restrict <cpuset>
              Restrict the topology to the given cpuset.

       --whole-system
              Do not consider administration limitations.

       -v --verbose
              Verbose messages.

       --version
              Report version and exit.

DESCRIPTION
       hwloc-distances  displays  also distance matrices attached to the topology.  The value in the i-th row and j-th column is the distance from
       object #i to object #j.

       Unless defined by the user, matrices currently always contain relative latencies between NUMA nodes (which may or  may  not  be  accurate).
       See the definition of struct hwloc_distances_s in include/hwloc.h or the documentation for details.

       These  latencies  are  normalized  to  the latency of a local (non-NUMA) access.  Hence 3.5 in row #i column #j means that the latency from
       cores in NUMA node #i to memory in NUMA node #j is 3.5 higher than the latency from cores to their local memory.  A breadth-first traversal
       of the topology is performed starting from the root to find all distance matrices.

       NOTE:  lstopo  may also display distance matrices in its verbose textual output.  However lstopo only prints matrices that cover the entire
       topology while hwloc-distances also displays matrices that ignore part of the topology.

EXAMPLES
       On a quad-package opteron machine:

           $ hwloc-distances
           Latency matrix between 4 NUMANodes (depth 2) by logical indexes:
             index     0     1     2     3
                 0 1.000 1.600 2.200 2.200
                 1 1.600 1.000 2.200 2.200
                 2 2.200 2.200 1.000 1.600
                 3 2.200 2.200 1.600 1.000

RETURN VALUE
       Upon successful execution, hwloc-distances returns 0.

       hwloc-distances will return nonzero if any kind of error occurs, such as (but not limited to) failure to parse the command line.

SEE ALSO
       hwloc(7), lstopo(1)

1.11.2                                                             Dec 17, 2015                                                 HWLOC-DISTANCES(1)
