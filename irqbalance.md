IRQBALANCE(1)                                                                                     irqbalance                                                                                    IRQBALANCE(1)



NAME
       irqbalance - distribute hardware interrupts across processors on a multiprocessor system

SYNOPSIS
       irqbalance


DESCRIPTION
       The purpose of irqbalance is distribute hardware interrupts across processors on a multiprocessor system in order to increase performance.


OPTIONS
       -o, --oneshot
              Causes irqbalance to be run once, after which the daemon exits


       -d, --debug
              Causes irqbalance to print extra debug information.  Implies --foreground


       -f, --foreground
              Causes irqbalance to run in the foreground (without --debug)


       -h, --hintpolicy=[exact | subset | ignore]
              Set the policy for how irq kernel affinity hinting is treated.  Can be one of:

       exact irq affinity hint is applied unilaterally and never violated

       subset irq is balanced, but the assigned object will be a subset of the affintiy hint

       ignore irq affinity hint value is completely ignored

       The default value for hintpolicy is ignore


       -p, --powerthresh=<threshold>
              Set  the  threshold  at which we attempt to move a cpu into powersave mode If more than <threshold> cpus are more than 1 standard deviation below the average cpu softirq workload, and no cpus
              are more than 1 standard deviation above (and have more than 1 irq assigned to them), attempt to place 1 cpu in powersave mode.  In powersave mode, a cpu will not have any  irqs  balanced  to
              it, in an effort to prevent that cpu from waking up without need.


       -i, --banirq=<irqnum>
              Add  the  specified irq to the set of banned irqs. irqbalance will not affect the affinity of any irqs on the banned list, allowing them to be specified manually.  This option is addative and
              can be specified multiple times. For example to ban irqs 43 and 44 from balancing, use the following command line: irqbalance --banirq=43 --banirq=44


       --deepestcache=<integer>
              This allows a user to specify the cache level at which irqbalance partitions cache domains. Without specified, irqbalance searches the available deepest cache. This can affect how  irqbalance
              builds up the CPU tree. For example, on a system where all the CPU cores being within the same L3 cache domain, one can let irqbalance build up the CPU tree on L2 cache by using the following
              command line: irqbalance --deepestcache=2


       -l, --policyscript=<script>
              When specified, the referenced script will execute once for each discovered irq, with the sysfs device path and irq number passed as arguments.  Note that the device path argument will  point
              to  the  parent  directory from which the irq attributes directory may be directly opened.  The script may specify zero or more key=value pairs that will guide irqbalance in the management of
              that irq.  Key=value pairs are printed by the script on stdout and will be captured and interpreted by irqbalance.  Irqbalance expects a zero exit code from the provided utility.   Recognized
              key=value pairs are:

       ban=[true | false]
              Directs irqbalance to exclude the passed in irq from balancing

       balance_level=[none | package | cache | core]
              This allows a user to override the balance level of a given irq.  By default the balance level is determined automatically based on the pci device class of the device that owns the irq.

       numa_node=<integer>
              This  allows a user to override the numa node that sysfs indicates a given device irq is local to.  Often, systems will not specify this information in ACPI, and as a result devicesa are con‐
              sidered equidistant from all numa nodes in a system.  This option allows for that hardware provided information to be overridden, so that irqbalance can bias irq affinity  for  these  devices
              toward its most local node.  Note that specifying a -1 here forces irqbalance to consider an interrupt from a device to be equidistant from all nodes.

       -s, --pid=<file>
              Have  irqbalance  write  its process id to the specified file.  By default no pidfile is written.  The written pidfile is automatically unlinked when irqbalance exits. It is ignored when used
              with --debug or --foreground.


ENVIRONMENT VARIABLES
       IRQBALANCE_ONESHOT
              Same as --oneshot


       IRQBALANCE_DEBUG
              Same as --debug


       IRQBALANCE_BANNED_CPUS
              Provides a mask of cpus which irqbalance should ignore and never assign interrupts to.  This is a hex mask without the leading ’0x’, on systems with large numbers of processors each group  of
              eight  hex  digits  is  separated  by  a  comma ’,’. i.e. ‘export IRQBALANCE_BANNED_CPUS=fc0‘ would prevent irqbalance from assigning irqs to the 7th-12th cpus (cpu6-cpu11) or ‘export IRQBAL‐
              ANCE_BANNED_CPUS=ff000000,00000001‘ would prevent irqbalance from assigning irqs to the 1st (cpu0) and 57th-64th cpus (cpu56-cpu63).  If not specified, irqbalance use  mask  of  isolated  and
              adaptive-ticks CPUs on the system as the default value.


SIGNALS
       SIGHUP Forces a rescan of the available irqs and system topology


Homepage
       https://github.com/Irqbalance/irqbalance





Linux                                                                                              Dec 2006                                                                                     IRQBALANCE(1)
