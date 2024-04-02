deadlock(8)                                                   System Manager's Manual                                                  deadlock(8)

NAME
       deadlock - Find potential deadlocks (lock order inversions) in a running program.

SYNOPSIS
       deadlock [-h] [--binary BINARY] [--dump-graph DUMP_GRAPH] [--verbose] [--lock-symbols LOCK_SYMBOLS] [--unlock-symbols UNLOCK_SYMBOLS] pid

DESCRIPTION
       deadlock finds potential deadlocks in a running process. The program attaches uprobes on `pthread_mutex_lock` and `pthread_mutex_unlock` by
       default to build a mutex wait directed graph, and then looks for a cycle in this graph.  This graph has the following properties:

       - Nodes in the graph represent mutexes.

       - Edge (A, B) exists if there exists some thread T where lock(A) was called and lock(B) was called before unlock(A) was called.

       If there is a cycle in this graph, this indicates that there is a lock order inversion (potential deadlock). If the program  finds  a  lock
       order inversion, the program will dump the cycle of mutexes, dump the stack traces where each mutex was acquired, and then exit.

       This  program can only find potential deadlocks that occur while the program is tracing the process. It cannot find deadlocks that may have
       occurred before the program was attached to the process.

       This tool does not work for shared mutexes or recursive mutexes.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc

OPTIONS
       -h, --help
              show this help message and exit

       --binary BINARY
              If set, trace the mutexes from the binary at this path. For statically-linked binaries, this argument is not required.  For  dynami‐
              cally-linked  binaries,  this  argument  is  required  and  should be the path of the pthread library the binary is using.  Example:
              /lib/x86_64-linux-gnu/libpthread.so.0

       --dump-graph DUMP_GRAPH
              If set, this will dump the mutex graph to the specified file.

       --verbose
              Print statistics about the mutex wait graph.

       --lock-symbols LOCK_SYMBOLS
              Comma-separated list of lock symbols to trace. Default is pthread_mutex_lock.  These symbols cannot be inlined in the binary.

       --unlock-symbols UNLOCK_SYMBOLS
              Comma-separated list of unlock symbols to trace. Default is pthread_mutex_unlock. These symbols cannot be inlined in the binary.

       pid    Pid to trace

EXAMPLES
       Find potential deadlocks in PID 181. The --binary argument is not needed for statically-linked binaries.
              # deadlock 181

       Find potential deadlocks in PID 181. If the process was created from a dynamically-linked executable, the --binary argument is required and
       must be the path of the pthread library:
              # deadlock 181 --binary /lib/x86_64-linux-gnu/libpthread.so.0

       Find  potential  deadlocks  in PID 181. If the process was created from a statically-linked executable, optionally pass the location of the
       binary. On older kernels without https://lkml.org/lkml/2017/1/13/585, binaries that contain `:` in the path cannot  be  attached  with  up‐
       robes. As a workaround, we can create a symlink to the binary, and provide the symlink name instead with the `--binary` option:
              # deadlock 181 --binary /usr/local/bin/lockinversion

       Find potential deadlocks in PID 181 and dump the mutex wait graph to a file:
              # deadlock 181 --dump-graph graph.json

       Find potential deadlocks in PID 181 and print mutex wait graph statistics:
              # deadlock 181 --verbose

       Find potential deadlocks in PID 181 with custom mutexes:
              # deadlock 181 --lock-symbols custom_mutex1_lock,custom_mutex2_lock --unlock_symbols custom_mutex1_unlock,custom_mutex2_unlock

OUTPUT
       This  program does not output any fields. Rather, it will keep running until it finds a potential deadlock, or the user hits Ctrl-C. If the
       program finds a potential deadlock, it will output the stack traces and lock order inversion in the following format and exit:

       Potential Deadlock Detected!

       Cycle in lock order graph: Mutex M0 => Mutex M1 => Mutex M0

       Mutex M1 acquired here while holding Mutex M0 in Thread T:
              [stack trace]

       Mutex M0 previously acquired by the same Thread T here:
              [stack trace]

       Mutex M0 acquired here while holding Mutex M1 in Thread S:
              [stack trace]

       Mutex M1 previously acquired by the same Thread S here:
              [stack trace]

       Thread T created by Thread R here:
              [stack trace]

       Thread S created by Thread Q here:
              [stack trace]

OVERHEAD
       This traces all mutex lock and unlock events and all thread creation events on the traced process. The overhead of this can be high if  the
       process has many threads and mutexes. You should only run this on a process where the slowdown is acceptable.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Kenny Yu

USER COMMANDS                                                       2017-02-01                                                         deadlock(8)
