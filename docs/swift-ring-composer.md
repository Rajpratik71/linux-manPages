swift-ring-composer(1)                                                                         OpenStack Swift                                                                         swift-ring-composer(1)



NAME
       swift-ring-composer - manual page for swift-ring-composer


SYNOPSIS
       swift-ring-composer [-h] <composite_builder_file> {show,compose} ...


DESCRIPTION
       This  is a tool for building a composite ring file from other existing ring builder files. The component ring builders must all have the same partition power. Each device must only be used in a sin‐
       gle component builder. Each region must only be used in a single component builder.

       NOTE: This tool is for experimental use and may be removed in future versions of Swift.

   positional arguments:
       <composite_builder_file>
              Name of composite builder file

   optional arguments:
       -h, --help
              show this help message and exit

COMMANDS
          show [-h]
              show composite ring builder metadata


          compose [-h] [<builder_file> <builder_file> [<builder_file> ...] --output <ring_file> [--force]
              compose composite ring

DOCUMENTATION
       More in depth documentation about the swift ring and also OpenStack Swift as a whole can be found at https://swift.openstack.org



Linux                                                                                             June 2018                                                                            swift-ring-composer(1)
