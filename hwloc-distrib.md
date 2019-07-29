HWLOC-DISTRIB(1)                                                       hwloc                                                      HWLOC-DISTRIB(1)

NAME
       hwloc-distrib - Build a number of cpu masks distributed on the system

SYNOPSIS
       hwloc-distrib [options] <integer>

OPTIONS
       --single
              Singlify each output to a single CPU.

       --taskset
              Show CPU set strings in the format recognized by the taskset command-line program instead of hwloc-specific CPU set string format.

       -v --verbose
              Verbose messages.

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

       --ignore <type>
              Ignore all objects of type <type> in the topology.

       --from <type>
              Distribute  starting  from  objects of the given type instead of from the top of the topology hierarchy, i.e. ignoring the structure
              given by objects above.

       --to <type>
              Distribute down to objects of the given type instead of down to the bottom of the topology hierarchy, i.e.  ignoring  the  structure
              given  by  objects  below.  This may be useful if some latitude is desired for the binding, e.g. just bind several processes to each
              package without specifying a single core for each of them.

       --at <type>
              Distribute among objects of the given type.  This is equivalent to specifying both --from and --to at the same time.

       --reverse
              Distribute by starting with the last objects first, and singlify CPU sets by keeping the last bit (instead of the first bit).

       --restrict <cpuset>
              Restrict the topology to the given cpuset.

       --whole-system
              Do not consider administration limitations.

       --version
              Report version and exit.

DESCRIPTION
       hwloc-distrib generates a series of CPU masks corresponding to a distribution of a given number  of  elements  over  the  topology  of  the
       machine. The distribution is done recursively from the top of the hierarchy (or from the level specified by option --from) down to the bot‐
       tom of the hierarchy (or down to the level specified by option --to, or until only one element remains), splitting the number  of  elements
       at each encountered hierarchy level not ignored by options --ignore.

       This  can e.g. be used to distribute a set of processes hierarchically according to the topology of a machine. These masks can be used with
       hwloc-bind(1).

       NOTE: It is highly recommended that you read the hwloc(7) overview page before reading this man page.  Most of the  concepts  described  in
       hwloc(7) directly apply to the hwloc-bind utility.

EXAMPLES
       hwloc-distrib's operation is best described through several examples.

       If 4 processes have to be distributed across a machine, their CPU masks may be obtained with:

           $ hwloc-distrib 4
           0x0000000f
           0x00000f00
           0x000000f0
           0x0000f000

       To distribute only among the second package, the topology should be restricted:

           $ hwloc-distrib --restrict $(hwloc-calc package:1) 4
           0x00000010
           0x00000020
           0x00000040
           0x00000080

       To get a single processor of each CPU masks (prevent migration in case of binding)

           $ hwloc-distrib 4 --single
           0x00000001
           0x00000100
           0x00000010
           0x00001000

       Each output line may be converted independently with hwloc-calc:

           $ hwloc-distrib 4 --single | hwloc-calc --taskset
           0x1
           0x100
           0x10
           0x1000

       To convert the output into a list of processors that may be passed to dplace -c inside a mpirun command line:

           $ hwloc-distrib 4 --single | xargs hwloc-calc --pulist
           0,8,4,16

RETURN VALUE
       Upon successful execution, hwloc-distrib displays one or more CPU mask strings.  The return value is 0.

       hwloc-distrib will return nonzero if any kind of error occurs, such as (but not limited to) failure to parse the command line.

SEE ALSO
       hwloc(7), hwloc-gather-topology(1)

1.11.2                                                             Dec 17, 2015                                                   HWLOC-DISTRIB(1)
