MEMCACHED-TOOL(1)                                                                          General Commands Manual                                                                          MEMCACHED-TOOL(1)



NAME
       memcached-tool - stats and management tool for memcached


SYNOPSIS
       memcached-tool <host[:port] | /path/to/socket> [mode]


DESCRIPTION
       memcached-tool  is a Perl script used to print statistics from a running memcached instance.  The first parameter specifies the address of the daemon either by a hostname, optionally followed by the
       port number (the default is 11211), or a path to UNIX domain socket. The second parameter specifies the mode in which the tool should run.


MODES
       display
              Print slab class statistics. This is the default mode if no mode is specified.  The printed columns are:

              #      Number of the slab class.

              Item_Size
                     The amount of space each chunk uses. One item uses one chunk of the appropriate size.

              Max_age
                     Age of the oldest item in the LRU.

              Pages  Total number of pages allocated to the slab class.

              Count  Number of items presently stored in this class. Expired items are not automatically excluded.

              Full?  Yes if there are no free chunks at the end of the last allocated page.

              Evicted
                     Number of times an item had to be evicted from the LRU before it expired.

              Evict_Time
                     Seconds since the last access for the most recent item evicted from this class.

              OOM    Number of times the underlying slab class was unable to store a new item.


       stats  Print general-purpose statistics of the daemon. Each line contains the name of the statistic and its value.

       dump   Make a partial dump of the cache written in the add statements of the memcached protocol.


SEE ALSO
       memcached(1),
       http://www.memcached.org


AUTHOR
       The memcached-tool script was written by Brad Fitzpatrick <brad@danga.com>



                                                                                                 Jul 2, 2013                                                                                MEMCACHED-TOOL(1)
