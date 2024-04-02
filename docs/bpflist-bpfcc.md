bpflist(8)                                                    System Manager's Manual                                                   bpflist(8)

NAME
       bpflist - Display processes currently using BPF programs and maps.

SYNOPSIS
       bpflist [-v]

DESCRIPTION
       This  tool  displays processes currently using BPF programs and maps, and optionally also kprobes and uprobes on the system. This is useful
       to understand which BPF programs are loaded on the system.

       Currently, for lack of a better alternative, this tool pipes into 'ls' and parses its output to snoop for BPF file descriptors in all  run‐
       ning processes.  In the future, when BPF accounting is provided by the kernel, this tool should use these accounting features.

       Only the root user can use this tool, because it accesses debugfs.

REQUIREMENTS
       bcc, debugfs

OPTIONS
       -h Print usage message.

       -v     Count kprobes and uprobes as well as BPF programs. Repeating verbose mode twice also prints the kprobe and uprobe definitions in ad‐
              dition to counting them.

EXAMPLES
       Display processes currently using BPF programs:
              # bpflist

       Also count kprobes and uprobes:
              # bpflist -v

FIELDS
       PID    Process ID.

       COMM   Process comm.

       TYPE   The type of the data displayed: BPF program, BPF map, kprobe, or uprobe.

       COUNT  The number of items of this type that belong to the specified process.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Sasha Goldshtein

USER COMMANDS                                                       2017-03-09                                                          bpflist(8)
