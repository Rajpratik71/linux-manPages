HWLOC-GATHER-TOPOLOGY(1)                                               hwloc                                              HWLOC-GATHER-TOPOLOGY(1)

NAME
       hwloc-gather-topology - Saves the relevant Linux topology files and the lstopo output for later (possibly offline) usage

SYNOPSIS
       hwloc-gather-topology [options] <path>

OPTIONS
       --io   Also  gather  I/O related files.  The gathering may be much slower, and the generated archive may be much bigger.  --dmi Also gather
              DMI/SMBIOS related files.  The gathering requires root access, and the dmi-sysfs kernel module should be loaded.

       -h --help
              Display help message and exit

DESCRIPTION
       hwloc-gather-topology saves all the relevant topology files into an archive (<path>.tar.bz2) and the lstopo  output  (<path>.output).   The
       utility for example stores the /proc/cpuinfo file and the entire /sys/devices/system/node/ directory tree.

       These  files  can be used later to explore the machine topology offline.  Once the tarball has been extracted, it may for instance be given
       to some hwloc command-line utilities through their --input option.  It is also possible to override the default  topology  that  the  hwloc
       library will read by setting the extracted path in the HWLOC_FSROOT environment variable.

       Both archive and lstopo output may also be submitted to hwloc developers to debug issues remotely.

       hwloc-gather-topology is a Linux specific tool, it is not installed on other operating systems.

       NOTE: It is highly recommended that you read the hwloc(7) overview page before reading this man page.

EXAMPLES
       To store topology information to be used later (possibly on a different host) please run:

            hwloc-gather-topology /tmp/myhost

       It  will  store all relevant topology files in the /tmp/myhost.tar.bz2 archive and the lstopo output in the /tmp/myhost.output file.  These
       files can be transferred on another host for later/offline analysis and/or as the input to various hwloc utilities.

       To use these data with hwloc utilities you have to unpack myhost.tar.bz2 archive first:

            tar jxvf /tmp/myhost.tar.bz2

       A new directory named myhost now contains all topology files.  Then you ask various hwloc utilities to use this topology instead of the one
       of the real machine by passing --input myhost.  To display the topology just run:

            lstopo --input ./myhost

       It is not necessary that the topology is extracted in the current directory, absolute or relative paths are also supported:

            lstopo --input /path/to/remote/host/extracted/topology/

       To see how hwloc would distribute 8 parallel jobs on the original host:

            hwloc-distrib --input myhost --single 8

       To get the corresponding physical indexes in the previous command:

            hwloc-calc --input myhost --po --li --proclist $(hwloc-distrib --input myhost --single 8)

       Any  program  may  actually  override  the  default  topology  with  a  given  archived one even if it does not have a --input option.  The
       HWLOC_FSROOT environment variable should be used to do so:

            HWLOC_FSROOT=myhost hwloc-calc --po --li --proclist $(hwloc-distrib --single 8)

       All these commands will produce the same output as if executed directly on the host on which the topology information was originally  gath‐
       ered by the hwloc-gather-topology script.

RETURN VALUE
       Upon successful execution, hwloc-gather-topology will exit with the code 0.

       hwloc-gather-topology  will  return nonzero exit status if any kind of error occurs, such as (but not limited to) failure to create the ar‐
       chive or output file.

SEE ALSO
       hwloc(7), lstopo(1), hwloc-calc(1), hwloc-distrib(1)

1.11.2                                                             Dec 17, 2015                                           HWLOC-GATHER-TOPOLOGY(1)
