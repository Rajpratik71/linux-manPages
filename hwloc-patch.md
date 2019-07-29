HWLOC-PATCH(1)                                                         hwloc                                                        HWLOC-PATCH(1)

NAME
       hwloc-patch - Apply a topology difference to an existing XML topology

SYNOPSIS
       hwloc-patch [options] [<topology.xml> | refname] [<diff.xml> | -] <output.xml>

       hwloc-patch [options] [<topology.xml> | refname] [<diff.xml> | -]

OPTIONS
       -R --reverse
                 Reverse the sense the difference file.

       --version Report version and exit.

DESCRIPTION
       hwloc-patch  loads  the difference between two topologies from a XML file (or from the standard input) and applies it to an existing topol‐
       ogy, generating a new, modified one.

       The XML difference may have been computed earlier with hwloc-diff or hwloc-compress-dir.

       If <output.xml> is given, the new, modified topology is stored in that new file. Otherwise, <topology.xml> is modified in place.

       If refname is given instead of <topology.xml>, the input topology filename is automatically guessed by reading the refname field of the XML
       diff file.  By default hwloc-diff generates XML diffs with the right reference topology filename (without any path prefix).

       If - is given instead of <diff.xml>, the topology difference is read from the standard input.

       NOTE:  It  is  highly recommended that you read the hwloc(7) overview page before reading this man page.  Most of the concepts described in
       hwloc(7) directly apply to the hwloc-patch utility.

EXAMPLES
       hwloc-patch's operation is best described through several examples.

       Apply a XML topology difference file to an existing topology:

           $ hwloc-patch fourmi023.xml diff.xml fourmi023-new.xml

       Apply a XML topology difference file whole refname field contains the right input topology:

           $ hwloc-patch refname diff.xml fourmi023-new.xml

       Apply a XML topology from the standard intput:

           $ cat diff.xml | hwloc-patch fourmi023.xml - fourmi023-new.xml

       Directly compute the difference between two topologies and apply it to another one, in place:

           $ hwloc-diff fourmi023.xml fourmi024.xml | hwloc-patch fourmi025.xml -

RETURN VALUE
       Upon successful execution, hwloc-patch outputs the modified topology.  The return value is 0.

       hwloc-patch also returns nonzero if any kind of error occurs, such as (but not limited to) failure to parse the command line.

SEE ALSO
       hwloc(7), lstopo(1), hwloc-diff(1), hwloc-compress-dir(1)

1.11.2                                                             Dec 17, 2015                                                     HWLOC-PATCH(1)
