mysqld_qslower(8)                                             System Manager's Manual                                            mysqld_qslower(8)

NAME
       mysqld_qslower - Trace MySQL server queries slower than a threshold.

SYNOPSIS
       mysqld_qslower PID [min_ms]

DESCRIPTION
       This traces queries served by a MySQL server, and prints those that exceed a custom latency (query duration) threshold. By default, a mini‐
       mum threshold of 1 millisecond is used. If a threshold of 0 is used, all queries are printed.

       This uses User Statically-Defined Tracing (USDT) probes, a feature added to MySQL for DTrace support, but which may not  be  enabled  on  a
       given MySQL installation. See requirements.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF, bcc, and MySQL server with USDT probe support (when configuring the build: -DENABLE_DTRACE=1).

OPTIONS
       PID Trace this mysqld PID.

       min_ms Minimum query latency (duration) to trace, in milliseconds. Default is 1 ms.

EXAMPLES
       Trace MySQL server queries slower than 1 ms for PID 1981:
              # mysqld_qslower 1981

       Trace slower than 10 ms for PID 1981:
              # mysqld_qslower 1981 10

FIELDS
       TIME(s)
              Time of query start, in seconds.

       PID    Process ID of the traced server.

       MS     Milliseconds for the query, from start to end.

       QUERY  Query string, truncated to 128 characters.

OVERHEAD
       This  adds  low-overhead  instrumentation  to MySQL queries, and only emits output data from kernel to user-level if they query exceeds the
       threshold. If the server query rate is less than 1,000/sec, the overhead is expected to be negligible. If the query rate is higher, test to
       gauge overhead.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       biosnoop(8)

USER COMMANDS                                                       2016-08-01                                                   mysqld_qslower(8)
