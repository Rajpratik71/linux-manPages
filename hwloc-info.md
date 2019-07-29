HWLOC-INFO(1)                                                          hwloc                                                         HWLOC-INFO(1)

NAME
       hwloc-info - Show some information about some objects or about a topology

SYNOPSIS
       hwloc-info [ options ]...  <object>...

       hwloc-info [ options ]...

       Note that hwloc(7) provides a detailed explanation of the hwloc system and of valid <object> formats; it should be read before reading this
       man page.

OPTIONS
       -i <file>, --input <file>
              Read topology from XML file <file> (instead of discovering the topology on the local machine).  If <file> is "-", the standard input
              is used.  XML support must have been compiled in to hwloc for this option to be usable.

       -i <directory>, --input <directory>
              Read  topology  from the chroot specified by <directory> (instead of discovering the topology on the local machine).  This option is
              generally only available on Linux.  The chroot was usually created by gathering another machine topology with hwloc-gather-topology.

       -i <specification>, --input <specification>
              Simulate a fake hierarchy (instead of discovering the topology on the local machine).  If  <specification>  is  "node:2  pu:3",  the
              topology  will contain two NUMA nodes with 3 processing units in each of them.  The <specification> string must end with a number of
              PUs.

       --if <format>, --input-format <format>
              Enforce the input in the given format, among xml, fsroot and synthetic.

       -v --verbose
              Include additional detail.

       -s --silent
              Reduce the amount of details to show.  A single summary line per object is displayed.

       --ancestors
              Display information about the object as well as about all its ancestors up to the root of the topology.

       --ancestor <type>
              Only display the object ancestors that match the given type.

       -n     When outputting object information, prefix each line with the index of the considered object within the  input.   For  instance,  if
              three cores were given in input, the output lines will be prefixed with "0: ", "1: " or "2: ".  If --ancestor is also used, the pre‐
              fix will be "X.Y: " where X is the index of the considered object within the input, and Y is the parent  index  (0  for  the  object
              itself, increasing towards the root of the topology).

       --whole-system
              Do not consider administration limitations.

       --restrict <cpuset>
              Restrict the topology to the given cpuset.

       --restrict binding
              Restrict  the  topology to the current process binding.  This option requires the use of the actual current machine topology (or any
              other topology with --thissystem or with HWLOC_THISSYSTEM set to 1 in the environment).

       --no-icaches
              Do not show Instruction caches, only Data and Unified caches are considered.

       --no-io
              Do not show any I/O device or bridge.  By default, common devices (GPUs, NICs, block  devices,  ...)  and  interesting  bridges  are
              shown.

       --no-bridges
              Do  not show any I/O bridge except hostbridges.  By default, common devices (GPUs, NICs, block devices, ...) and interesting bridges
              are shown.

       --whole-io
              Show all I/O devices and bridges.  By default, only common devices (GPUs, NICs, block devices,  ...)  and  interesting  bridges  are
              shown.

       --thissystem
              Assume that the selected backend provides the topology for the system on which we are running.  This is useful when using --restrict
              binding and loading a custom topology such as an XML file.

       --pid <pid>
              Detect topology as seen by process <pid>, i.e. as if process <pid> did the discovery itself.  Note that this can for instance change
              the set of allowed processors.  Also show this process current CPU binding by marking the corresponding PUs (in Green in the graphi‐
              cal output, see the COLORS section below, or by appending (binding) to the verbose text output).  If 0 is given as pid, the  current
              binding for the lstopo process will be shown.

       -p --physical
              Use OS/physical indexes instead of logical indexes for input.

       -l --logical
              Use logical indexes instead of physical/OS indexes for input (default).

       --version
              Report version and exit.

DESCRIPTION
       hwloc-info  displays  information  about  the  specified  object.   It is intended to be used with tools such as grep for filtering certain
       attribute lines.  When no object is specified, hwloc-info prints a summary of the topology.

       Objects may be specified as location tuples, as explained in hwloc(7).  However hexadecimal bitmasks are not accepted since they may corre‐
       spond to multiple objects.

       NOTE:  It  is  highly recommended that you read the hwloc(7) overview page before reading this man page.  Most of the concepts described in
       hwloc(7) directly apply to the hwloc-calc utility.

EXAMPLES
       To display information about each package:

           $ hwloc-info package:all
           Package L#0
            logical index = 0
           ...

       To display information about the core whose physical index is 2:

           $ utils/hwloc-info -p core:2
           Core L#1
            logical index = 1
            os index = 2
          ...

SEE ALSO
       hwloc(7), lstopo(1), hwloc-calc(1), hwloc-bind(1), hwloc-ps(1), hwloc-gather-topology(1)

1.11.2                                                             Dec 17, 2015                                                      HWLOC-INFO(1)
