HWLOC-ASSEMBLER(1)                                                     hwloc                                                    HWLOC-ASSEMBLER(1)

NAME
       hwloc-assembler - Assemble multiple XML topologies

SYNOPSIS
       hwloc-assembler [options] output.xml [--name <name1>] input1.xml [--name <name2>] input2.xml ...

OPTIONS
       -n --name <name>
              Set <name> in the AssemblerName info attribute of the next input topology root to ease identification within the final global topol‐
              ogy.

       -f --force
              Ignore errors while reading input files.

       -v --verbose
              Verbose messages.

DESCRIPTION
       hwloc-assembler combines the input XML topologies and exports the resulting global topologies to a new XML file.  All inputs are  inserting
       as children of the global root object.

       Each input topology root is annotated with info attributes before insertion.  AssemblerIndex is set to the index within the list of inputs.
       AssemblerName is set to the name given with --name if any.

       hwloc-assembler-remote offers a frontend for assembling remote nodes topologies without having to manually  gather  and  transfer  each  of
       them.

EXAMPLES
       To assemble two nodes topologies:

           $ hwloc-assembler output.xml --name host1 host1.xml --name host2 host2.xml

RETURN VALUE
       Upon successful execution, hwloc-assembler returns 0.

       hwloc-assembler will return nonzero if any kind of error occurs, such as (but not limited to) failure to parse the command line.

SEE ALSO
       hwloc(7), lstopo(1), hwloc-assembler-remote(1)

1.11.2                                                             Dec 17, 2015                                                 HWLOC-ASSEMBLER(1)
