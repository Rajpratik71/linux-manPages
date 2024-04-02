MEMCACHED(1)                                                                               General Commands Manual                                                                               MEMCACHED(1)



NAME
       memcached - high-performance memory object caching system

SYNOPSIS
       memcached [options]

DESCRIPTION
       This manual page documents briefly the memcached memory object caching daemon.

       memcached  is  a  flexible  memory  object  caching  daemon designed to alleviate database load in dynamic web applications by storing objects in memory.  It's based on libevent to scale to any size
       needed, and is specifically optimized to avoid swapping and always use non-blocking I/O.

OPTIONS
       These programs follow the usual GNU command line syntax. A summary of options is included below.

       -s, --unix-socket=<file>
              Unix socket path to listen on (disables network support).

       -A, --enable-shutdown
              Enable ascii "shutdown" command.

       -a, --unix-mask=<perms>
              Permissions (in octal format) for Unix socket created with -s option.

       -l, --listen=<addr>
              Listen on <addr>; default to INADDR_ANY. <addr> may be specified as host:port.  If you don't specify a port number, the value you specified with -p or -U is used.  You  may  specify  multiple
              addresses  separated  by comma or by using -l multiple times. This is an important option to consider as there is no other way to secure the installation. Binding to an internal or firewalled
              network interface is suggested.

       -d, --daemon
              Run memcached as a daemon.

       -u, --user=<username>
              Assume the identity of <username> (only when run as root).

       -m, --memory-limit=<num>
              Use <num> MB memory max to use for object storage; the default is 64 megabytes.

       -c, --conn-limit=<num>
              Use <num> max simultaneous connections; the default is 1024.

       -R, --max-reqs-per-event=<num>
              This option seeks to prevent client starvation by setting a limit to the number of sequential requests the server will process from an individual client  connection.  Once  a  connection  has
              exceeded this value, the server will attempt to process I/O on other connections before handling any further request from this connection. The default value for this option is 20.

       -k, --lock-memory
              Lock down all paged memory. This is a somewhat dangerous option with large caches, so consult the README and memcached homepage for configuration suggestions.

       -p, --port=<num>
              Listen on TCP port <num>, the default is port 11211.

       -U, --udp-port=<num>
              Listen on UDP port <num>, the default is port 11211, 0 is off.

       -M, --disable-evictions
              Disable automatic removal of items from the cache when out of memory.  Additions will not be possible until adequate space is freed up.

       -r, --enable-coredumps
              Raise the core file size limit to the maximum allowable.

       -f, --slab-growth-factor=<factor>
              Use <factor> as the multiplier for computing the sizes of memory chunks that items are stored in. A lower value may result in less wasted memory depending on the total amount of memory avail‐
              able and the distribution of item sizes.  The default is 1.25.

       -n, --slab-min-size=<size>
              Allocate a minimum of <size> bytes for the item key, value, and flags. The default is 48. If you have a lot of small keys and values, you can get a significant memory efficiency gain  with  a
              lower  value.  If  you  use  a high chunk growth factor (-f option), on the other hand, you may want to increase the size to allow a bigger percentage of your items to fit in the most densely
              packed (smallest) chunks.

       -C, --disable-cas
              Disable the use of CAS (and reduce the per-item size by 8 bytes).

       -h, --help
              Show the version of memcached and a summary of options.

       -v, --verbose
              Be verbose during the event loop; print out errors and warnings.

       -vv    Be even more verbose; same as -v but also print client commands and responses.

       -vvv   Be extremely verbose; same of the above and also print internal state transitions.

       -i, --license
              Print memcached and libevent licenses.

       -P, --pidfile=<filename>
              Print pidfile to <filename>, only used under -d option.

       -t, --threads=<threads>
              Number of threads to use to process incoming requests. This option is only meaningful if memcached was compiled with thread support enabled. It is typically not useful to set this higher than
              the number of CPU cores on the memcached server. Setting a high number (64 or more) of worker threads is not recommended. The default is 4.

       -D <char>
              Use  <char>  as the delimiter between key prefixes and IDs. This is used for per-prefix stats reporting. The default is ":" (colon). If this option is specified, stats collection is turned on
              automatically; if not, then it may be turned on by sending the "stats detail on" command to the server.

       -L, --enable-largepages
              Try to use large memory pages (if available). Increasing the memory page size could reduce the number of TLB misses and improve the performance. In order to get large pages from the OS,  mem‐
              cached will allocate the total item-cache in one large chunk. Only available if supported on your OS.

       -b, --listen-backlog=<num>
              Set the backlog queue limit to <num> connections. The default is 1024.

       -B, --protocol=<proto>
              Specify  the  binding protocol to use.  By default, the server will autonegotiate client connections.  By using this option, you can specify the protocol clients must speak.  Possible options
              are "auto" (the default, autonegotiation behavior), "ascii" and "binary".

       -I, --max-item-size=<size>
              Override the default size of each slab page. The default size is 1mb. Default value for this parameter is 1m, minimum is 1k, max is 128m.  Adjusting this value changes the item size limit.

       -S, --enable-sasl
              Turn on SASL authentication. This option is only meaningful if memcached was compiled with SASL support enabled.

       -F, --disable-flush-all
              Disables the "flush_all" command. The cmd_flush counter will increment, but clients will receive an error message and the flush will not occur.

       -X, --disable-dumping
              Disables the "stats cachedump" and "lru_crawler metadump" commands.

       -o, --extended=<options>
              Comma separated list of extended or experimental options. See -h or wiki for up to date list.

       -V, --version
              print version and exit

LICENSE
       The memcached daemon is copyright Danga Interactive and is distributed under the BSD license. Note that daemon clients are licensed separately.

SEE ALSO
       The README file that comes with memcached
       http://www.memcached.org

AUTHOR
       The memcached daemon was written by Anatoly Vorobey <mellon@pobox.com> and Brad Fitzpatrick <brad@danga.com> and the rest of the crew of Danga Interactive http://www.danga.com



                                                                                                April 11, 2005                                                                                   MEMCACHED(1)
