CHCPU(8)                                                                                         User Manuals                                                                                        CHCPU(8)



NAME
       chcpu - configure CPUs

SYNOPSIS
       chcpu [-e] [-d] [-c] [-g] cpu-list
       chcpu [-p] mode
       chcpu -r
       chcpu [-h] [-V]

DESCRIPTION
       chcpu  can modify the state of CPUs.  It can enable or disable CPUs, scan for new CPUs, change the CPU dispatching mode of the underlying hypervisor, and request CPUs from the hypervisor (configure)
       or return CPUs to the hypervisor (deconfigure).

       Some options have a cpu-list argument.  Use this argument to specify a comma-separated list of CPUs.  The list can contain individual CPU addresses or ranges of addresses.  For  example,  0,5,7,9-11
       makes the command applicable to the CPUs with the addresses 0, 5, 7, 9, 10, and 11.

OPTIONS
       -r, --rescan
              Trigger a rescan of CPUs.  Use this option on systems that do not automatically detect newly attached CPUs.  The Linux kernel then recognizes the new CPUs.

       -c, --configure cpu-list
              Configure all specified CPUs.  Configuring a CPU means that the hypervisor takes a CPU from the CPU pool and assigns it to the virtual hardware on which your kernel runs.

       -e, --enable cpu-list
              Enable all specified CPUs.  Enabling a CPU means that the kernel sets it online.  A CPU must be configured, see -c, before it can be enabled.

       -p, --dispatch mode
              Set the CPU dispatching mode (polarization).  This option has an effect only if your hardware architecture and hypervisor support CPU polarization.  Available modes are:

                     horizontal  The workload is spread across all available CPUs.
                     vertical    The workload is concentrated on few CPUs.

       -d, --disable cpu-list
              Disable all specified CPUs.  Disabling a CPU means that the kernel sets it offline.

       -g, --deconfigure cpu-list
              Deconfigure  all  specified  CPUs.  Deconfiguring a CPU means that the hypervisor removes the CPU from the virtual hardware on which the Linux instance runs and returns it to the CPU pool.  A
              CPU must be offline, see -d, before it can be deconfigured.

       -h, --help
              Display help information and exit.

       -V, --version
              Display version information and exit.


RETURN CODES
       chcpu has the following return codes:

       0      success

       1      failure

       64     partial success

AUTHOR
       Heiko Carstens ⟨heiko.carstens@de.ibm.com⟩

COPYRIGHT
       Copyright IBM Corp. 2011

SEE ALSO
       lscpu(1)

AVAILABILITY
       The chcpu command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



Linux                                                                                             June 2012                                                                                          CHCPU(8)
