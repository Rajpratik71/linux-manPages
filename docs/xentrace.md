xentrace(8)                                       Xen                                      xentrace(8)

NAME
       xentrace - capture Xen trace buffer data

SYNOPSIS
       xentrace [ OPTIONS ] [ FILE ]

DESCRIPTION
       xentrace is used to capture trace buffer data from Xen.  The data is output in the following
       binary format (host endian):

           CPU(uint) TSC(u64) EVENT(u32) D1 D2 D3 D4 D5 (all u32)

       Where CPU is the processor number, TSC is the record's timestamp (the value of the CPU cycle
       counter), EVENT is the event ID and D1...D5 are the trace data.

       Data is dumped onto the standard output (which must not be a TTY) or a FILE specified on the
       command line.

       The output should be parsed using the tool xentrace_format, which can produce human-readable
       output in ASCII format.

OPTIONS
       -t l, --log-thresh=l
           set the threshold number, l, of new records required to trigger a write of all new records
           to the output

       -s p, --poll-sleep=p
           set the time, p, (in milliseconds) to sleep between polling the buffers for new data.

       -c [c|CPU-LIST|all], --cpu-mask=[c|CPU-LIST|all]
           This can be: a hex value (of the form 0xNNNN...), or a set of cpu ranges as described
           below, or the string all. Hex values are limited to 32 bits. If not specified, the cpu-mask
           as set during bootup will be constructed. If using the CPU-LIST it expects decimal numbers,
           which may be specified as follows:

             "0-3"
                 Trace only on CPUs 0 through 3

             "0,2,5-7"
                 Trace only on CPUs 0, 2, and 5 through 7

             "-3"
                 Trace only on CPUs 0 through 3

             "-3,7"
                 Trace only on CPUs 0 through 3 and 7

             "3-"
                 Trace only on CPUs 3 up to maximum numbers of CPUs the host has

           If using all it will use all of the CPUs the host has.

       -e mask, --evt-mask=mask
           set event capture mask. If not specified the TRC_ALL will be used.

       -?, --help
           Give this help list

       --usage
           Give a short usage message

       -V, --version
           Print program version

   Event Classes (Masks)
       The following event classes (masks) can be used to filter the events being gathered by
       xentrace:

               ID                  Description

               0x0001f000          TRC_GEN
               0x0002f000          TRC_SCHED
               0x0004f000          TRC_DOM0OP
               0x0008f000          TRC_HVM
               0x0010f000          TRC_MEM
               0xfffff000          TRC_ALL

   Event Subclasses (More Masks)
       The following event subclasses (masks) can also be used to filter the events being gathered by
       xentrace:

               ID                  Description

               0x00081000          TRC_HVM_ENTRYEXIT
               0x00082000          TRC_HVM_HANDLER

   Events
       xentrace collects the following events from the trace buffer:

               ID                 Description

               0x0001f001         TRC_LOST_RECORDS
               0x0002f001         TRC_SCHED_DOM_ADD
               0x0002f002         TRC_SCHED_DOM_REM
               0x0002f003         TRC_SCHED_SLEEP
               0x0002f004         TRC_SCHED_WAKE
               0x0002f005         TRC_SCHED_YIELD
               0x0002f006         TRC_SCHED_BLOCK
               0x0002f007         TRC_SCHED_SHUTDOWN
               0x0002f008         TRC_SCHED_CTL
               0x0002f009         TRC_SCHED_ADJDOM
               0x0002f010         TRC_SCHED_SWITCH
               0x0002f011         TRC_SCHED_S_TIMER_FN
               0x0002f012         TRC_SCHED_T_TIMER_FN
               0x0002f013         TRC_SCHED_DOM_TIMER_FN
               0x0002f014         TRC_SCHED_SWITCH_INFPREV
               0x0002f015         TRC_SCHED_SWITCH_INFNEXT

               0x00081001         TRC_HVM_VMENTRY
               0x00081002         TRC_HVM_VMEXIT
               0x00082001         TRC_HVM_PF_XEN
               0x00082002         TRC_HVM_PF_INJECT
               0x00082003         TRC_HVM_INJ_EXC
               0x00082004         TRC_HVM_INJ_VIRQ
               0x00082005         TRC_HVM_REINJ_VIRQ
               0x00082006         TRC_HVM_IO_READ
               0x00082007         TRC_HVM_IO_WRITE
               0x00082008         TRC_HVM_CR_READ
               0x00082009         TRC_HVM_CR_WRITE
               0x0008200A         TRC_HVM_DR_READ
               0x0008200B         TRC_HVM_DR_WRITE
               0x0008200C         TRC_HVM_MSR_READ
               0x0008200D         TRC_HVM_MSR_WRITE
               0x0008200E         TRC_HVM_CPUID
               0x0008200F         TRC_HVM_INTR
               0x00082010         TRC_HVM_NMI
               0x00082011         TRC_HVM_SMI
               0x00082012         TRC_HVM_VMMCALL
               0x00082013         TRC_HVM_HLT
               0x00082014         TRC_HVM_INVLPG

               0x0010f001         TRC_MEM_PAGE_GRANT_MAP
               0x0010f002         TRC_MEM_PAGE_GRANT_UNMAP
               0x0010f003         TRC_MEM_PAGE_GRANT_TRANSFER

AUTHOR
       Mark A. Williamson <mark.a.williamson@intel.com>

SEE ALSO
       xentrace_format(1)

4.9.2                                         2018-04-12                                   xentrace(8)
