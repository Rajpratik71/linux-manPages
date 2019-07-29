LSTOPO(1)                                                              hwloc                                                             LSTOPO(1)

NAME
       lstopo, lstopo-no-graphics, hwloc-ls - Show the topology of the system

SYNOPSIS
       lstopo [ options ]... [ filename ]

       lstopo-no-graphics [ options ]... [ filename ]

       hwloc-ls [ options ]... [ filename ]

       Note that hwloc(7) provides a detailed explanation of the hwloc system; it should be read before reading this man page

OPTIONS
       --of <format>, --output-format <format>
              Enforce the output in the given format.  See the OUTPUT FORMATS section below.

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

       --export-synthetic-flags <flags>
              Enforce  flags  when  exporting to the synthetic format.  These flags are passed to hwloc_topology_export_synthetic().  A value of 2
              reverts to the format of hwloc v1.9.  A value of 3 reverts to the original minimalistic format (before v1.9).

       -v --verbose
              Include additional detail.  The hwloc-info tool may be used to display even more information about specific objects.

       -s --silent
              Reduce the amount of details to show.

       -f --force
              If the destination file already exists, overwrite it.

       -l --logical
              Display hwloc logical indexes instead of physical/OS indexes (default for console output).  These indexes are  prefixed  with  "L#".
              The physical indexes of some objects (PU and Node by default, all objects if verbose) will appear as object attribute "P#...".

       -p --physical
              Display  OS/physical  indexes instead of hwloc logical indexes (default for graphical output).  These indexes are prefixed with "P#"
              instead of "L#" in the console output.

       -c --cpuset
              Display the cpuset of each object.

       -C --cpuset-only
              Only display the cpuset of each object; do not display anything else about the object.

       --taskset
              Show CPU set strings in the format recognized by the taskset command-line program instead of hwloc-specific CPU set  string  format.
              This option should be combined with --cpuset or --cpuset-only, otherwise it will imply --cpuset.

       --only <type>
              Only show objects of the given type in the textual output.

       --ignore <type>
              Ignore  all  objects  of  type <type> in the topology.  hwloc supports ignoring any type except PUs and I/O devices.  However lstopo
              still offers PU ignoring by hiding PU objects in the graphical and textual outputs.  Note that PU may not be ignored in the XML out‐
              put.  Note also that the top-level object type cannot be ignored (usually Machine or System).

       --no-caches
              Do not show caches.

       --no-useless-caches
              Do  not  show  caches  which  do  not  have a hierarchical impact.  This calls hwloc_topology_ignore_type_keep_structure() for cache
              objects.

       --no-icaches
              Do not show Instruction caches, only Data and Unified caches are displayed.

       --whole-system
              Do not consider administration limitations.

       --merge
              Do not show levels that do not have a hierarchical impact.  This calls hwloc_topology_ignore_all_keep_structure().

       --no-collapse
              Do not collapse identical PCI devices.  By default, identical sibling PCI devices (such as many virtual functions  inside  a  single
              physical device) are collapsed.

       --restrict <cpuset>
              Restrict the topology to the given cpuset.

       --restrict binding
              Restrict  the  topology to the current process binding.  This option requires the use of the actual current machine topology (or any
              other topology with --thissystem or with HWLOC_THISSYSTEM set to 1 in the environment).

       --restrict-flags <flags>
              Enforce flags when restricting the topology.  The default is 0.  These flags are passed to hwloc_topology_restrict().

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

       --ps --top
              Show  existing processes as misc objects in the output. To avoid uselessly cluttering the output, only processes that are restricted
              to some part of the machine are shown.  On Linux, kernel threads are not shown.  If many processes appear,  the  output  may  become
              hard to read anyway, making the hwloc-ps program more practical.

       --fontsize <size>
              Set size of text font.

       --gridsize <size>
              Set size of margin between elements.

       --horiz, --horiz=<type1,...>
              Horizontal  graphical  layout  instead of nearly 4/3 ratio.  If a comma-separated list of types is given, the layout only applies to
              the corresponding containers.

       --vert, --vert=<type1,...>
              Vertical graphical layout instead of nearly 4/3 ratio.  If a comma-separated list of types is given, the layout only applies to  the
              corresponding containers.

       --rect, --rect=<type1,...>
              Rectangular graphical layout with nearly 4/3 ratio, including when placing NUMA nodes.  If a comma-separated list of types is given,
              the layout only applies to the corresponding containers.

       --no-legend
              Remove the text legend at the bottom.

       --append-legend <line>
              Append the line of text to the bottom of the legend in graphical mode.  If the line is too long, it will be truncated in the output.
              If adding multiple lines, each line should be given separately by passing this option multiple times.

       --version
              Report version and exit.

DESCRIPTION
       lstopo and lstopo-no-graphics are capable of displaying a topological map of the system in a variety of different output formats.  The only
       difference between lstopo and lstopo-no-graphics is that graphical outputs are only supported by lstopo, to reduce dependencies on external
       libraries.  hwloc-ls is identical to lstopo-no-graphics.

       The  filename  specified  directly implies the output format that will be used; see the OUTPUT FORMATS section, below.  Output formats that
       support color will indicate specific characteristics about individual CPUs by their color; see the COLORS section, below.

OUTPUT FORMATS
       By default, if no output filename is specific, the output is sent to a graphical window if possible in  the  current  environment  (DISPLAY
       environment variable set on Unix, etc.).  Otherwise, a text summary is displayed in the console.

       The filename on the command line usually determines the format of the output.  There are a few filenames that indicate specific output for‐
       mats and devices (e.g., a filename of "-" will output a text summary to stdout), but most filenames indicate the desired output  format  by
       their suffix (e.g., "topo.png" will output a PNG-format file).

       The format of the output may also be changed with "--of".  For instance, "--of pdf" will generate a PDF-format file on the standard output,
       while "--of fig toto" will output a Xfig-format file named "toto".

       The list of currently supported formats is given below. Any of them may be used with "--of" or as a filename suffix.

       default
              Send the output to a window or to the console depending on the environment.

       console
              Send a text summary to stdout.  Binding, unallowed or offline processors are only annotated in this mode if verbose; see the  COLORS
              section, below.

       ascii  Output  an  ASCII  art  representation of the map (formerly called txt).  If outputting to stdout and if colors are supported on the
              terminal, the output will be colorized.

       fig    Output a representation of the map that can be loaded in Xfig.

       pdf    If lstopo was compiled with the proper support, lstopo outputs a PDF representation of the map.

       ps     If lstopo was compiled with the proper support, lstopo outputs a Postscript representation of the map.

       png    If lstopo was compiled with the proper support, lstopo outputs a PNG representation of the map.

       svg    If lstopo was compiled with the proper support, lstopo outputs an SVG representation of the map.

       synthetic
              If the topology is symmetric (which requires that the root object has its symmetric_subtree field set), lstopo outputs  a  synthetic
              description  string.  This output may be reused as an input synthetic topology description later.  Note that I/O devices often cause
              topology asymmetry.  Adding --no-io may then be useful when the synthetic export fails.  See also the Synthetic  topologies  section
              in the documentation.

       xml    If  lstopo  was  compiled with the proper support, lstopo outputs an XML representation of the map.  It may be reused later, even on
              another machine, with lstopo --input, the HWLOC_XMLFILE environment variable, or the hwloc_topology_set_xml() function.

       The following special names may be used:

       -      Send a text summary to stdout.

       /dev/stdout
              Send a text summary to stdout.  It is effectively the same as specifying "-".

       -.<format>
              If the entire filename is "-.<format>", lstopo behaves as if "--of <format> -" was given, which means a file of the given format  is
              sent to the standard output.

       See the output of "lstopo --help" for a specific list of what graphical output formats are supported in your hwloc installation.

COLORS
       Individual CPUs are colored in the graphical output formats to indicate different characteristics:

       Green  The topology is reported as seen by a specific process (see --pid), and the given CPU is in this process CPU binding mask.

       White  The  CPU is in the allowed set (see below).  If the topology is reported as seen by a specific process (see --pid), the given CPU is
              also not in this process CPU binding mask.

       Red    The CPU is not in the allowed set (see below).

       Black  The CPU is offline (not all OS's support displaying offline CPUs).

       The "allowed set" is the set of CPUs to which the current process is allowed to bind.  The allowed set is usually either inherited from the
       parent  process  or set by administrative qpolicies on the system.  Linux cpusets are one example of limiting the allowed set for a process
       and its children to be less than the full set of CPUs on the system.

       Different processes may therefore have different CPUs in the allowed set.  Hence, invoking lstopo in different contexts and/or as different
       users  may  display  different colors for the same individual CPUs (e.g., running lstopo in one context may show a specific CPU as red, but
       running lstopo in a different context may show the same CPU as white).

       Some lstopo output modes, e.g. the console mode (default non-graphical output), do not support colors at all.  The  console  mode  displays
       the above characteristics by appending text to each PU line if verbose messages are enabled.

CUSTOM COLORS
       The  color  of  each object in the graphical output may be enforced by specifying a "lstopoStyle" info attribute in that object.  Its value
       should be a semi-colon separated list of "<attribute>=#rrggbb" where rr, gg and bb are the RGB components of a color, each  between  0  and
       255, in hexadecimal (00 to ff).  <attribute> may be

       Background
              Sets the background color of the main object box.

       Background2
              Sets the background color of the additional box for the object, for instance the memory box inside a NUMA node box.

       Text   Sets the color of the text showing the object name, type, index, etc.

       Text2  Sets the color of the additional text near the object, for instance the link speed behind a PCI bridge.

       The "lstopoStyle" info may be added to a temporarily-saved XML topologies with hwloc-annotate, or with hwloc_obj_add_info().  For instance,
       to display all core objects in blue (with white names):

           lstopo save.xml
           hwloc-annotate save.xml save.xml core:all info lstopoStyle "Background=#0000ff;Text=#ffffff"
           lstopo -i save.xml

LAYOUT
       In its graphical output, lstopo uses simple rectangular heuristics to try to achieve a 4/3 ratio between width and height. However, in  the
       particular  case  of  NUMA  nodes,  the  layout  is always a flat rectangle, to avoid letting the user believe any particular NUMA topology
       (lstopo is not able to render that yet).  The layout of a level may be changed with --vert, --horiz, and --rect.

EXAMPLES
       To display the machine topology in textual mode:

           lstopo-no-graphics

       To display the machine topology in ascii-art mode:

           lstopo-no-graphics -.ascii

       To display in graphical mode (assuming that the DISPLAY environment variable is set to a relevant value):

           lstopo

       To export the topology to a PNG file:

           lstopo file.png

       To export an XML file on a machine and later display the corresponding graphical output on another machine:

           machine1$ lstopo file.xml
           <transfer file.xml from machine1 to machine2>
           machine2$ lstopo --input file.xml

       To save the current machine topology to XML and later reload it faster while still considering it as the current machine:

          $ lstopo file.xml
          <...>
          $ lstopo --input file.xml --thissystem

       To restrict an XML topology to only physical processors 0, 1, 4 and 5:

           lstopo --input file.xml --restrict 0x33 newfile.xml

       To restrict an XML topology to only numa node whose logical index is 1:

           lstopo --input file.xml --restrict $(hwloc-calc --input file.xml node:1) newfile.xml

       To display a summary of the topology:

           lstopo -s

       To get more details about the topology:

           lstopo -v

       To only show cores:

           lstopo --only core

       To show cpusets:

           lstopo --cpuset

       To only show the cpusets of package:

           lstopo --only package --cpuset-only

       Simulate a fake hierarchy; this example shows with 2 NUMA nodes of 2 processor units:

           lstopo --input "n:2 2"

       To count the number of logical processors in the system

          lstopo --only pu | wc -l

       To append the kernel release and version to the graphical legend:

          lstopo --append-legend "Kernel release: $(uname -r)" --append-legend "Kernel version: $(uname -v)"

SEE ALSO
       hwloc(7), hwloc-info(1), hwloc-bind(1), hwloc-annotate(1), hwloc-ps(1), hwloc-gather-topology(1)

1.11.2                                                             Dec 17, 2015                                                          LSTOPO(1)
