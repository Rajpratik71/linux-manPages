HWLOC-ANNOTATE(1)                                                      hwloc                                                     HWLOC-ANNOTATE(1)

NAME
       hwloc-annotate - Add info attributes to a XML topology

SYNOPSIS
       hwloc-annotate [options] <input.xml> <output.xml> <location> <mode> <annotation>

OPTIONS
       --ri      Remove all info attributes that exist with the same name before adding the new one.  This option is only accepted in "info" mode.
                 If the info value is omitted, existing infos are replaced with nothing.

       --ci      Clear the existing info attributes in the target objects before annotating.  If no new annotation has to be added after clearing,
                 mode should be set to none.

DESCRIPTION
       hwloc-annotate  loads  a topology from a XML file, adds some annotations, and export the resulting topology to another XML file.  The input
       and output files may be the same.

       The annotation may be string info attributes.  This is specified by the mode:

       info <name> <value>
              Specifies a new string info attribute whose name is name and value is value.

       misc <name>
              Specifies a new Misc object name.

       none   No new annotation is added. This is useful when clearing existing attributes.

       Annotations may be added to one specific object in the topology, all of them, or all of a given type.  This is specified by the location:

       all    annotates all objects in the topology.

       root   annotates the root object of the topology.

       <type>:all
              annotates all objects of the given type.

       <type>:<index>
              annotates the object of the given type and index.  The index is logical.

       NOTE: The existing annotations may be listed with hwloc-info.

       NOTE: It is highly recommended that you read the hwloc(7) overview page before reading this man page.  Most of the  concepts  described  in
       hwloc(7) directly apply to the hwloc-annotate utility.

EXAMPLES
       hwloc-annotate's operation is best described through several examples.

       Add an info attribute to all Core objects:

           $ hwloc-annotate input.xml output.xml Core:all info infoname infovalue

       Add a Misc object named "foobar" under the root object of the topology and modify the input XML directly:

           $ hwloc-annotate file.xml file.xml root misc foobar

       Add an info attribute to OS device #2 and #3:

           $ hwloc-annotate input.xml output.xml os:2-3 info infoname infovalue

       Change package objects to green with red text in the lstopo graphical output:

           $ hwloc-annotate topo.xml topo.xml package:all info lstopoStyle "Background=#00ff00;Text=#ff0000"
           $ lstopo -i topo.xml

RETURN VALUE
       Upon successful execution, hwloc-annotate generates the output topology.  The return value is 0.

       hwloc-annotate will return nonzero if any kind of error occurs, such as (but not limited to) failure to parse the command line.

SEE ALSO
       hwloc(7), lstopo(1), hwloc-info(1)

1.11.2                                                             Dec 17, 2015                                                  HWLOC-ANNOTATE(1)
