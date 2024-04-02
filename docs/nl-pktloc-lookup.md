nl-pktloc-lookup(8)                                                                        System Manager's Manual                                                                        nl-pktloc-lookup(8)



NAME
       nl-pktloc-lookup - Lookup packet location definitions

SYNOPSIS
       nl-pktloc-lookup name
       nl-pktloc-lookup --list


DESCRIPTION
       nl-pktloc-lookup searches the packet location database for a matching entry. It is used to resolve packet location aliases to their definition, i.e. alignment, layer, offset, and mask.


OPTIONS
       -h or --help
              Print help text to console and exit.

       -v or --version
              Print versioning information to console and exit.

       -l or --list
              List all packet location definitions.

       --u32=VALUE
              Prints  the  packet  location definition in a special format that is understood by iproute2's u32 selector parser. It will output a u32 selector which will compare the provided value with the
              value specified by the packet location.

              Please note that due to the limitation of u32, it is not possible to use packet locations based on the link layer. nl-pktloc-lookup will print an error message in this case.

              Example:
                selector=$(nl-pktloc-lookup --u32 22 tcp.sport)
                tc filter add [...] u32 match $(selector) flowid 1:2


FILES
       /etc/libnl/pktloc


AUTHOR
       Thomas Graf is the original author and current maintainer of libnl and libnl tools. Many people have contributed to it since.



libnl                                                                                          27 October 2010                                                                            nl-pktloc-lookup(8)
