IRQBALANCE(1)                                                                                   irqbalance                                                                                  IRQBALANCE(1)

NAME
       irqbalance - distribute hardware interrupts across processors on a multiprocessor system

SYNOPSIS
       irqbalance

DESCRIPTION
       The purpose of irqbalance is to distribute hardware interrupts across processors on a multiprocessor system in order to increase performance.

OPTIONS
       -o, --oneshot
              Causes irqbalance to be run once, after which the daemon exits.

       -d, --debug
              Causes irqbalance to print extra debug information.  Implies --foreground.

       -f, --foreground
              Causes irqbalance to run in the foreground (without --debug).

       -j, --journal
              Enables log output optimized for systemd-journal.

       -h, --hintpolicy=[exact | subset | ignore]
              Set the policy for how IRQ kernel affinity hinting is treated.  Can be one of:

       exact IRQ affinity hint is applied unilaterally and never violated.

       subset IRQ is balanced, but the assigned object will be a subset of the affinity hint.

       ignore IRQ affinity hint value is completely ignored.

       The default value for hintpolicy is ignore.

       -p, --powerthresh=<threshold>
              Set  the  threshold  at  which we attempt to move a CPU into powersave mode If more than <threshold> CPUs are more than 1 standard deviation below the average CPU softirq workload, and no
              CPUs are more than 1 standard deviation above (and have more than 1 IRQ assigned to them), attempt to place 1 CPU in powersave mode.  In powersave mode, a CPU will not have any IRQs  bal‐
              anced to it, in an effort to prevent that CPU from waking up without need.

       -i, --banirq=<irqnum>
              Add  the  specified IRQ to the set of banned IRQs. irqbalance will not affect the affinity of any IRQs on the banned list, allowing them to be specified manually.  This option is addative
              and can be specified multiple times. For example to ban IRQs 43 and 44 from balancing, use the following command line: irqbalance --banirq=43 --banirq=44

       --deepestcache=<integer>
              This allows a user to specify the cache level at which irqbalance partitions cache domains.  Specifying a deeper cache may allow a greater degree of flexibility for irqbalance  to  assign
              IRQ  affinity  to  achieve greater performance increases, but setting a cache depth too large on some systems (specifically where all CPUs on a system share the deepest cache level), will
              cause irqbalance to see balancing as unnecessary.  irqbalance --deepestcache=2

       The default value for deepestcache is 2.

       -l, --policyscript=<script>
              When specified, the referenced script will execute once for each discovered IRQ, with the sysfs device path and IRQ number passed as arguments.  Note that the device  path  argument  will
              point  to  the parent directory from which the IRQ attributes directory may be directly opened.  The script may specify zero or more key=value pairs that will guide irqbalance in the man‐
              agement of that IRQ.  Key=value pairs are printed by the script on stdout and will be captured and interpreted by irqbalance.  Irqbalance expects a zero exit code from the provided  util‐
              ity.  Recognized key=value pairs are:

       ban=[true | false]

       Directs irqbalance to exclude the passed in IRQ from balancing.

       balance_level=[none | package | cache | core]
              This allows a user to override the balance level of a given IRQ.  By default the balance level is determined automatically based on the pci device class of the device that owns the IRQ.

       numa_node=<integer>
              This  allows  a  user to override the NUMA node that sysfs indicates a given device IRQ is local to.  Often, systems will not specify this information in ACPI, and as a result devices are
              considered equidistant from all NUMA nodes in a system.  This option allows for that hardware provided information to be overridden, so that irqbalance can bias  IRQ  affinity  for  these
              devices toward its most local node.  Note that specifying a -1 here forces irqbalance to consider an interrupt from a device to be equidistant from all nodes.

       hintpolicy=[exact | subset | ignore ]
              This allows a user to override the globally set hintpolicy for a given irq.  Use is identical to the --hintpolicy setting, but applied per irq

       -s, --pid=<file>
              Have  irqbalance  write  its  process id to the specified file.  By default no pidfile is written.  The written pidfile is automatically unlinked when irqbalance exits. It is ignored when
              used with --debug or --foreground.

       -t, --interval=<time>
              Set the measurement time for irqbalance.  irqbalance will sleep for <time> seconds between samples of the irq load on the system cpus. Defaults to 10.

ENVIRONMENT VARIABLES
       IRQBALANCE_ONESHOT
              Same as --oneshot.

       IRQBALANCE_DEBUG
              Same as --debug.

       IRQBALANCE_BANNED_CPUS
              Provides a mask of CPUs which irqbalance should ignore and never assign interrupts to.

SIGNALS
       SIGHUP Forces a rescan of the available IRQs and system topology.

Homepage
       https://github.com/Irqbalance/irqbalance

Linux                                                                                            Dec 2006                                                                                   IRQBALANCE(1)
