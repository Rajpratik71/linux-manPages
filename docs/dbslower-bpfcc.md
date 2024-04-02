dbslower(8)                                                   System Manager's Manual                                                  dbslower(8)

NAME
       dbslower - Trace MySQL/PostgreSQL server queries slower than a threshold.

SYNOPSIS
       dbslower [-v] [-p PID [PID ...]] [-x PATH] [-m THRESHOLD] {mysql,postgres}

DESCRIPTION
       This  traces  queries  served  by a MySQL or PostgreSQL server, and prints those that exceed a latency (query time) threshold. By default a
       threshold of 1 ms is used.

       This uses User Statically-Defined Tracing (USDT) probes, a feature added to MySQL and PostgreSQL for DTrace support, but which may  not  be
       enabled on a given installation. See requirements.  Alternativly, MySQL queries can be traced without the USDT support using the -x option.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF,  bcc,  and  MySQL server with USDT probe support (when configuring the build: -DENABLE_DTRACE=1) or PostgreSQL server with USDT
       probe support (when configuring the build: --enable-dtrace).

OPTIONS
       -h Print usage message.

       -p PID Trace this PID. If no PID is specified, the tool will attempt to automatically detect the MySQL or PostgreSQL processes  running  on
              the system.

       -x PATH
              Path to MySQL binary. This option allow to MySQL queries even when USDT probes aren't enabled on the MySQL server.

       -m THRESHOLD
              Minimum query latency (duration) to trace, in milliseconds. Default is 1 ms.

       {mysql,postgres}
              The database engine to trace.

EXAMPLES
       Trace MySQL server queries slower than 1 ms:
              # dbslower mysql

       Trace slower than 10 ms for PostgreSQL in process 408:
              # dbslower postgres -p 408 -m 10

FIELDS
       TIME(s)
              Time of query start, in seconds.

       PID    Process ID of the traced server.

       MS     Milliseconds for the query, from start to end.

       QUERY  Query string, truncated to 256 characters.

OVERHEAD
       This  adds  low-overhead instrumentation to queries, and only emits output data from kernel to user-level if they query exceeds the thresh‐
       old. If the server query rate is less than 1,000/sec, the overhead is expected to be negligible. If the query rate is higher, test to gauge
       overhead.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Sasha Goldshtein, Brendan Gregg

SEE ALSO
       biosnoop(8), mysqld_qslower(8), dbstat(8)

USER COMMANDS                                                       2017-02-15                                                         dbslower(8)
