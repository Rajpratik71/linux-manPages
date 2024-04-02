tplist(8)                                                     System Manager's Manual                                                    tplist(8)

NAME
       tplist - Display kernel tracepoints or USDT probes and their formats.

SYNOPSIS
       tplist [-p PID] [-l LIB] [-v] [filter]

DESCRIPTION
       tplist  lists all kernel tracepoints, and can optionally print out the tracepoint format; namely, the variables that you can trace when the
       tracepoint is hit.  tplist can also list USDT probes embedded in a specific library or executable, and can list USDT probes for all the li‐
       braries loaded by a specific process.  These features are usually used in conjunction with the argdist and/or trace tools.

       On a typical system, accessing the tracepoint list and format requires root.  However, accessing USDT probes does not require root.

OPTIONS
       -p PID Display the USDT probes from all the libraries loaded by the specified process.

       -l LIB Display  the USDT probes from the specified library or executable. If the librar or executable can be found in the standard paths, a
              full path is not required.

       -v     Increase the verbosity level. Can be used to display the variables, locations, and arguments of tracepoints and USDT probes.

       [filter]
              A wildcard expression that specifies which tracepoints or probes to print.  For example, block:* will print  all  block  tracepoints
              (block:block_rq_complete, etc.). Regular expressions are not supported.

EXAMPLES
       Print all kernel tracepoints:
              # tplist

       Print all net tracepoints with their format:
              # tplist -v 'net:*'

       Print all USDT probes in libpthread:
              $ tplist -l pthread

       Print all USDT probes in process 4717 from the libc provider:
              $ tplist -p 4717 'libc:*'

       Print all the USDT probes in the node executable:
              $ tplist -l node

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Sasha Goldshtein

USER COMMANDS                                                       2016-03-20                                                           tplist(8)
