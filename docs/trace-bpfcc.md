trace(8)                                                      System Manager's Manual                                                     trace(8)

NAME
       trace - Trace a function and print its arguments or return value, optionally evaluating a filter. Uses Linux eBPF/bcc.

SYNOPSIS
       trace [-h] [-b BUFFER_PAGES] [-p PID] [-L TID] [-v] [-Z STRING_SIZE] [-S] [-s SYM_FILE_LIST]
                [-M MAX_EVENTS] [-t] [-u] [-T] [-C] [-K] [-U] [-a] [-I header]
                probe [probe ...]

DESCRIPTION
       trace probes functions you specify and displays trace messages if a particular condition is met. You can control the message format to dis‐
       play function arguments and return values.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -p PID Trace only functions in the process PID.

       -L TID Trace only functions in the thread TID.

       -v     Display the generated BPF program, for debugging purposes.

       -z STRING_SIZE
              When collecting string arguments (of type char*), collect up to STRING_SIZE characters. Longer strings will be truncated.

       -s SYM_FILE_LIST
              When collecting stack trace in build id format, use the coma separated list for symbol resolution.

       -S     If set, trace messages from trace's own process. By default, this is off to avoid tracing storms -- for example, if  you  trace  the
              write system call, and consider that trace is writing to the standard output.

       -M MAX_EVENTS
              Print up to MAX_EVENTS trace messages and then exit.

       -t     Print times relative to the beginning of the trace (offsets), in seconds.

       -u     Print UNIX timestamps instead of offsets from trace beginning, requires -t.

       -T     Print the time column.

       -C     Print CPU id.

       -c CGROUP_PATH
              Trace only functions in processes under CGROUP_PATH hierarchy.

       -n NAME
              Only print process names containing this name.

       -f MSG_FILTER
              Only print message of event containing this string.

       -B     Treat argument of STRCMP helper as a binary value

       -K     Print the kernel stack for each event.

       -U     Print the user stack for each event.  -a Print virtual address in kernel and user stacks.

       -I header
              Additional  header  files to include in the BPF program. This is needed if your filter or print expressions use types or data struc‐
              tures that are not available in the standard headers. For example: 'linux/mm.h'

       probe [probe ...]
              One or more probes that attach to functions, filter conditions, and print information. See PROBE SYNTAX below.

PROBE SYNTAX
       The general probe syntax is as follows:

       [{p,r}]:[library]:function[(signature)] [(predicate)] ["format string"[, arguments]]

       {t:category:event,u:library:probe} [(predicate)] ["format string"[, arguments]]

       {[{p,r}],t,u}
              Probe type - "p" for function entry, "r" for function return, "t" for kernel tracepoint, "u" for USDT probe. The default probe  type
              is "p".

       [library]
              Library  containing  the  probe.   Specify the full path to the .so or executable file where the function to probe resides. Alterna‐
              tively, you can specify just the lib name: for example, "c" refers to libc. If no library name is specified, the kernel is  assumed.
              Also, you can specify an executable name (without a full path) if it is in the PATH.  For example, "bash".

       category
              The tracepoint category. For example, "sched" or "irq".

       function
              The function to probe.

       signature
              The  optional  signature  of the function to probe. This can make it easier to access the function's arguments, instead of using the
              "arg1", "arg2" etc.  argument specifiers. For example, "(struct timespec *ts)" in the signature position lets you use  "ts"  in  the
              filter or print expressions.

       event  The tracepoint event. For example, "block_rq_complete".

       probe  The USDT probe name. For example, "pthread_create".

       [(predicate)]
              The filter applied to the captured data. Only if the filter evaluates as true, the trace message will be printed. The filter can use
              any valid C expression that refers to the argument values: arg1, arg2, etc., or to the return value retval in  a  return  probe.  If
              necessary, use C cast operators to coerce the arguments to the desired type. For example, if arg1 is of type int, use the expression
              ((int)arg1 < 0) to trace only invocations where arg1 is negative.  Note that only arg1-arg6 are supported, and only if the  function
              is  using the standard x86_64 convention where the first six arguments are in the RDI, RSI, RDX, RCX, R8, R9 registers. If no predi‐
              cate is specified, all function invocations are traced.

              The predicate expression may also use the STRCMP pseudo-function to compare a predefined string to a string argument.  For  example:
              STRCMP("test", arg1).  The order of arguments is important: the first argument MUST be a quoted literal string, and the second argu‐
              ment can be a runtime string, most typically an argument.

       ["format string"[, arguments]]
              A printf-style format string that will be used for the trace message. You can use the following format specifiers: %s, %d, %u, %lld,
              %llu,  %hd,  %hu,  %c, %x, %llx -- with the same semantics as printf's. Make sure to pass the exact number of arguments as there are
              placeholders in the format string. The format specifier replacements may be any C expressions, and may refer  to  the  same  special
              keywords as in the predicate (arg1, arg2, etc.).

              In  addition to the above format specifiers, you can also use %K and %U when the expression is an address that potentially points to
              executable code (i.e., a symbol). trace will resolve %K specifiers to a kernel symbol, such as vfs__read, and will resolve %U speci‐
              fiers to a user-space symbol in that process, such as sprintf.

              In  tracepoints,  both  the predicate and the arguments may refer to the tracepoint format structure, which is stored in the special
              "args" variable. For example, the block:block_rq_complete tracepoint can print or filter by args->nr_sector. To discover the  format
              of your tracepoint, use the tplist tool.

              In  USDT probes, the arg1, ..., argN variables refer to the probe's arguments.  To determine which arguments your probe has, use the
              tplist tool.

              The predicate expression and the format specifier replacements for printing may also use the following special keywords: $pid, $tgid
              to  refer  to the current process' pid and tgid; $uid, $gid to refer to the current user's uid and gid; $cpu to refer to the current
              processor number.

EXAMPLES
       Trace all invocations of the open system call with the name of the file being opened:
              # trace '::do_sys_open "%s", arg2'

       Trace all invocations of the read system call where the number of bytes requested is greater than 20,000:
              # trace '::sys_read (arg3 > 20000) "read %d bytes", arg3'

       Trace all malloc calls and print the size of the requested allocation:
              # trace ':c:malloc "size = %d", arg1'

       Trace returns from the readline function in bash and print the return value as a string:
              # trace 'r:bash:readline "%s", retval'

       Trace the block:block_rq_complete tracepoint and print the number of sectors completed:
              # trace 't:block:block_rq_complete "%d sectors", args->nr_sector'

       Trace the pthread_create USDT probe from the pthread library and print the address of the thread's start function:
              # trace 'u:pthread:pthread_create "start addr = %llx", arg3'

       Trace the nanosleep system call and print the sleep duration in nanoseconds:
              # trace 'p::SyS_nanosleep(struct timespec *ts) sleep for %lld ns , ts->tv_nsec'

       Trace the inet_pton system call using build id mechanism and print the stack
              # trace -s /lib/x86_64-linux-gnu/libc.so.6,/bin/ping 'p:c:inet_pton' -U

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

USER COMMANDS                                                       2016-02-18                                                            trace(8)
