
opa2rm(8)                                                                                   IFSFFCLIRG (Man Page)                                                                                   opa2rm(8)



NAME
       opa2rm



       Permits the generation of configuration files for FastFabric or resource managers from a topology xml file.

       When  using  a  topology spreadsheet and opaxlattopology to design and prepare for deployment verification of a fabric, opa2rm may be used to generate resource manager configuration from the planned
       cluster design. Using this approach will allow the resulting configuration files to be complete, even if some nodes in the fabric have not yet been  installed  or  made  operational.  Alternatively,
       opareport -o topology can be used to generate a topology XML file for input to opa2rm. In this case, only the currently present nodes will be included.

       When  working with SLURM, the opa2rm -o slurm option should typically be used. This option will generate a SLURM configuration file that lists the hosts directly connected to each switch in a syntax
       that can be used by SLURM's topology/tree plugin. It also generates a single "fake" switch shown as connecting all the other switches together. This approach allows for SLURM  job  placement  to  be
       improved while avoiding undo overhead in SLURM. This option also allows for topologies that are not a pure fat-tree.

       When  the  configuration is a pure fat tree or oversubscribed fat tree, the opa2rm -o slurmfull option may be used to generate the full description of the fabric, including all intermediate and core
       switches in the fat tree topology. This option may permit better job placement optimization than the output from the opa2rm -o slurm option. However for larger fabrics,  it  may  also  increase  the
       overhead within SLURM.

Syntax
       opa2rm [-v] [-q] -o output[-g|-u|-t] [-F point] [-p prefix] [-s suffix] topology_input

Options
       --help    Produces full help text.


       -v/--verbose
                 Specifies verbose output.


       -q/--quiet
                 Disables progress reports.


       -o/--output output
                 Specifies the output type:




                 slurm     SLURM tree nodes. Supports a variety of topologies.





                 slurmful  SLURM fat tree nodes and ISLs. Only supports pure trees.





                 hosts     FastFabric hosts file omitting this host



       -g/--guid Specifies the output switch GUIDs instead of names.


       -u/--underscore
                 Changes spaces in switch names to underscores.


       -t/--trunc
                 Truncates switch names at first space.


                 This will treat large Director switches as a single, big switch.

                 If -g, -u or -t are not specified, the switch name's suffix, after the first space, will be placed at the start of the name. For example, 'core5 Leaf 101' becomes 'Leaf101_core5'.

       -F/--focus point
                 Specifies the focus area for output. Limits the scope of output to links that match any of the given focus points.


       -p/--prefix prefix
                 Specifies the prefix to prepend to all FI hostnames.


       -s/--suffix suffix
                 Specifies the suffix to append to all FI hostnames.


       topology_input
                 Specifies the topology_input file to use. '-' may be used to specify stdin.


Point Syntax
       node:value
                 value is node description (node name).


       node:value1:port:value2
                 value1 is node description (node name); value2 is port number.


       nodepat:value
                 value is glob pattern for node description (node name).


       nodepat:value1:port:value2
                 value1 is glob pattern for node description (node name); value2 is port number.


       nodetype:value
                 value is node type (SW or FI).


       nodetype:value1:port:value2
                 value1 is node type (SW or FI); value2 is port number.


       rate:value
                 value is string for rate (25g, 50g, 75g, 100g).


       mtucap:value
                 value is MTU size (2048, 4096, 8192, 10240); omits switch mgmt port 0.


       labelpat:value
                 value is glob pattern for cable label.


       lengthpat:value
                 value is glob pattern for cable length.


       cabledetpat:value
                 value is glob pattern for cable details.


       linkdetpat:value
                 value is glob pattern for link details.


       portdetpat:value
                 value is glob pattern for port details to value.


Examples
       opa2rm -o slurm topology.xml
       opa2rm -o slurm -p 'opa-' topology.xml
       opa2rm -o slurm -s '-opa' topology.xml
       opa2rm -o slurm -F 'nodepat:compute*' -F 'nodepat:opacore1 *'
       topology.xml
       opa2rm -o nodes -F 'nodedetpat:compute*' topology.xml
       opa2rm -o hosts topology.xml



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                     opa2rm(8)
