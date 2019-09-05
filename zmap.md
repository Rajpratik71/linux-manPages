ZMAP(1)                                                                zmap                                                                ZMAP(1)

NAME
       zmap - The Fast Internet Scanner

SYNOPSIS
       zmap [ -p <port> ] [ -o <outfile> ] [ OPTIONS... ] [ ip/hostname/range ]

DESCRIPTION
       ZMap  is  a  network tool for scanning the entire Internet (or large samples). ZMap is capable of scanning the entire Internet in around 45
       minutes on a gigabit network connection, reaching ~98% theoretical line speed.

OPTIONS
   BASIC OPTIONS
       ip/hostname/range
              IP addresses or DNS hostnames to scan. Accepts IP ranges in CIDR block notation. Defaults to 0.0.0/8

       -p, --target-port=port
              TCP or UDP port number to scan (for SYN scans and basic UDP scans)

       -o, --output-file=name
              When using an output module that uses a file, write results to this file. Use - for stdout.

       -b, --blacklist-file=path
              File of subnets to exclude, in CIDR notation, one-per line. It is recommended you use this to exclude RFC 1918 addresses, multicast,
              IANA reserved space, and other IANA special-purpose addresses. An example blacklist file blacklist.conf for this purpose.

   SCAN OPTIONS
       -n, --max-targets=n
              Cap  the  number  of  targets  to  probe. This can either be a number (e.g. -n 1000) or a percentage (e.g. -n 0.1%) of the scannable
              address space (after excluding blacklist)

       -N, --max-results=n
              Exit after receiving this many results

       -t, --max-runtime=secs
              Cap the length of time for sending packets

       -r, --rate=pps
              Set the send rate in packets/sec

       -B, --bandwidth=bps
              Set the send rate in bits/second (supports suffixes G, M, and K (e.g. -B 10M for 10 mbps). Thi s overrides the --rate flag.

       -c, --cooldown-time=secs
              How long to continue receiving after sending has completed (default=8)

       -e, --seed=n
              Seed used to select address permutation. Use this if you want to scan addresses in the same order for multiple ZMap runs.

       --shards=N
              Split the scan up into N shards/partitions among different instances of zmap (default=1). When sharding, --seed is required.

       --shard=n
              Set which shard to scan (default=0). Shards are 0-indexed in the range [0, N), where N is the total number of shards. When  sharding
              --seed is required.

       -T, --sender-threads=n
              Threads used to send packets. ZMap will attempt to detect the optimal number of send threads based on the number of processor cores.

       -P, --probes=n
              Number of probes to send to each IP (default=1)

       -d, --dryrun
              Print out each packet to stdout instead of sending it (useful for debugging)

   NETWORK OPTIONS
       -s, --source-port=port|range
              Source port(s) to send packets from

       -S, --source-ip=ip|range
              Source address(es) to send packets from. Either single IP or range (e.g. 10.0.0.1-10.0.0.9)

       -G, --gateway-mac=addr
              Gateway MAC address to send packets to (in case auto-detection does not work)

       -i, --interface=name
              Network interface to use

   PROBE OPTIONS
       ZMap  allows  users  to  specify and write their own probe modules. Probe modules are responsible for generating probe packets to send, and
       processing responses from hosts.

       --list-probe-modules
              List available probe modules (e.g. tcp_synscan)

       -M, --probe-module=name
              Select probe module (default=tcp_synscan)

       --probe-args=args
              Arguments to pass to probe module

       --list-output-fields
              List the fields the selected probe module can send to the output module

   OUTPUT OPTIONS
       ZMap allows users to specify and write their own output modules for use with ZMap. Output modules are responsible for processing the field‐
       sets  returned  by  the  probe  module,  and outputing them to the user. Users can specify output fields, and write filters over the output
       fields.

       --list-output-modules
              List available output modules (e.g. tcp_synscan)

       -O, --output-module=name
              Select output module (default=csv)

       --output-args=args
              Arguments to pass to output module

       -f, --output-fields=fields
              Comma-separated list of fields to output

       --output-filter
              Specify an output filter over the fields defined by the probe module. See the output filter section for more details.

   ADDITIONAL OPTIONS
       -C, --config=filename
              Read a configuration file, which can specify any other options.

       -q, --quiet
              Do not print status updates once per second

       -g, --summary
              Print configuration and summary of results at the end of the scan

       -v, --verbosity=n
              Level of log detail (0-5, default=3)

       -h, --help
              Print help and exit

       -V, --version
              Print version and exit

   UDP PROBE MODULE OPTIONS
       These arguments are all passed using the --probe-args=args option. Only one argument may be passed at a time.

       file:/path/to/file
              Path to payload file to send to each host over UDP.

       template:/path/to/template
              Path to template file. For each destination host, the template file is populated, set as the UDP payload, and sent.

       text:<text>
              ASCII text to send to each destination host

       hex:<hex>
              Hex-encoded binary to send to each destination host

       template-fields
              Print information about the allowed template fields and exit.

   OUPUT FILTERS
       Results generated by a probe module can be filtered before being passed to the output module. Filters are defined over the output fields of
       a  probe  module.  Filters  are  written  in  a simple filtering language, similar to SQL, and are passed to ZMap using the --output-filter
       option. Output filters are commonly used to filter out duplicate results, or to only pass only sucessful responses to the output module.

       Filter expressions are of the form <fieldname> <operation> <value>. The type of <value> must be either a string or  unsigned  integer  lit‐
       eral,  and  match the type of <fieldname>. The valid operations for integer comparisons are = !=, ,, =,=. The operations for string compar‐
       isons are =, !=. The --list-output-fields flag will print what fields and types are available for the selected probe module, and then exit.

       Compound filter expressions may be constructed by combining filter expressions using parenthesis to specify order  of  operations,  the  &&
       (logical AND) and || (logical OR) operators.

       For example, a filter for only successful, non-duplicate responses would be written as: --output-filter="success = 1 && repeat = 0"

zmap v2.1.1                                                       September 2015                                                           ZMAP(1)
