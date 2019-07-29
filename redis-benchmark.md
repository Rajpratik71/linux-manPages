REDIS-BENCHMARK(1)                                            General Commands Manual                                           REDIS-BENCHMARK(1)

NAME
       redis-benchmark - Benechmark a Redis instance

SYNOPSIS
       redis-benchmark [-h <host>] [-p <port>] [-c <clients>] [-n <requests]> [-k <boolean>]

DESCRIPTION
       Redis  is a key-value database. It is similar to memcached but the dataset is not volatile and other datatypes (such as lists and sets) are
       natively supported.

OPTIONS
       -h hostname
              Server hostname (default 127.0.0.1)

       -p hostname
              Server port (default 6379)

       -c clients
              Number of parallel connections (default 50)

       -n requests
              Total number of requests (default 10000)

       -d size
              Data size of SET/GET value in bytes (default 2)

       -k boolean
              1=keep alive 0=reconnect (default 1)

       -r keyspacelen
              Use random keys for SET/GET/INCR, random  values  for  SADD  Using  this  option  the  benchmark  will  get/set  keys  in  the  form
              mykey_rand000000012456  instead of constant keys, the <keyspacelen> argument determines the max number of values for the random num‐
              ber. For instance if set to 10 only rand000000000000 - rand000000000009 range will be allowed.

       -q     Quiet. Just show query/sec values

       -l     Loop. Run the tests forever

       -I     Idle mode. Just open N idle connections and wait.

       -D     Debug mode. more verbose.

AUTHOR
       redis-benchmark was written by Salvatore Sanfilippo.

       This manual page was written by Chris Lamb <lamby@debian.org> for the Debian project (but may be used by others).

                                                                   June 28, 2010                                                REDIS-BENCHMARK(1)
