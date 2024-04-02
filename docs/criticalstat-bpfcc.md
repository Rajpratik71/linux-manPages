criticalstat(8)                                               System Manager's Manual                                              criticalstat(8)

NAME
       criticalstat - A tracer to find and report long atomic critical sections in kernel

SYNOPSIS
       criticalstat [-h] [-p] [-i] [-d DURATION]

DESCRIPTION
       criticalstat  traces  and  reports occurences of atomic critical sections in the kernel with useful stacktraces showing the origin of them.
       Such critical sections frequently occur due to use of spinlocks, or if interrupts or preemption were explicity disabled by  a  driver.  IRQ
       routines  in  Linux  are  also  executed  with interrupts disabled. There are many reasons. Such critical sections are a source of long la‐
       tency/responsive issues for real-time systems.

       This works by probing the preempt/irq and cpuidle tracepoints in the kernel.  Since this uses BPF, only the root user can  use  this  tool.
       Further, the kernel has to be built with certain CONFIG options enabled. See below.

REQUIREMENTS
       Enable  CONFIG_PREEMPTIRQ_EVENTS  and  CONFIG_DEBUG_PREEMPT.  Additionally, the following options should be DISABLED on older kernels: CON‐
       FIG_PROVE_LOCKING, CONFIG_LOCKDEP.

OPTIONS
       -h     Print usage message.

       -p     Find long sections where preemption was disabled on local CPU.

       -i     Find long sections where interrupt was disabled on local CPU.

       -d DURATION
              Only identify sections that are longer than DURATION in microseconds.

EXAMPLES
       Run with default options: irq disabled for more than 100 uS
              # criticalstat

       Find sections with preemption disabled for more than 100 uS.
              # criticalstat -p

       Find sections with IRQ disabled for more than 500 uS.
              # criticalstat -d 500

       Find sections with preemption disabled for more than 500 uS.
              # criticalstat -p -d 500

OVERHEAD
       This tool can cause overhead if the application is spending a lot of time in kernel mode. The overhead is variable but can be 2-4% of  per‐
       formance degradation. If overhead is seen to be too much, please pass a higher DURATION to the -d option to filter more aggressively.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Joel Fernandes

SEE ALSO
       Linux kernel's preemptoff and irqoff tracers.

USER COMMANDS                                                       2018-06-07                                                     criticalstat(8)
