RLM_IPPOOL_TOOL(8)                                            System Manager's Manual                                           RLM_IPPOOL_TOOL(8)

NAME
       rlm_ippool_tool - dump the contents of the FreeRadius ippool database files

SYNOPSIS
       If an ipaddress is specified then that address is used to limit the actions or output.

       rlm_ippool_tool [-a] [-c] [-o] [-v] session-db index-db [ipaddress]

       Mark the entry nasIP/nasPort as having ipaddress

       rlm_ippool_tool -n session-db index-db ipaddress nasIP nasPort

       Update old format database to new.

       rlm_ippool_tool -u session-db new-session-db

DESCRIPTION
       rlm_ippool_tool dumps the contents of the FreeRADIUS ippool databases for analyses or for removal of active (stuck?) entries.

       Or with the -n argument adds a usage entry to the FreeRADIUS ippool databases.

OPTIONS
       -a     Print all active entries.

       -c     Report number of active entries.

       -r     Remove active entries.

       -v     Verbose report of all entries.

       -o     Assume old database format (nas/port pair, not md5 output).

       -n     Mark the entry nasIP/nasPort as having ipaddress.

       -u     Update old format database to new.

EXAMPLES
       Given the syntax in the FreeRadius radiusd.conf:

               ippool myippool {
                   range-start = 192.168.1.0
                   range-stop = 192.168.1.255
                   [...]
                   session-db = ${raddbdir}/ip-pool.db
                   ip-index = ${raddbdir}/ip-index.db
               }

       To see the number of active entries in this pool, use:

               $ rlm_ippool_tool -c ip-pool.db ip-index.db
               13

       To see all active entries in this pool, use:

               $ rlm_ippool_tool -a ip-pool.db ip-index.db
               192.168.1.5
               192.168.1.82
               192.168.1.244
               192.168.1.57
               192.168.1.120
               192.168.1.27
               [...]

       To see all information about the active entries in the use, use:

               $ rlm_ippool_tool -av ip-pool.db ip-index.db
               NAS:172.16.1.1 port:0x2e8 - ipaddr:192.168.1.5 active:1 cli:0 num:1
               NAS:172.16.1.1 port:0x17c - ipaddr:192.168.1.82 active:1 cli:0 num:1
               NAS:172.16.1.1 port:0x106 - ipaddr:192.168.1.244 active:1 cli:0 num:1
               NAS:172.16.1.1 port:0x157 - ipaddr:192.168.1.57 active:1 cli:0 num:1
               NAS:172.16.1.1 port:0x2d8 - ipaddr:192.168.1.120 active:1 cli:0 num:1
               NAS:172.16.1.1 port:0x162 - ipaddr:192.168.1.27 active:1 cli:0 num:1
               [...]

       To see only information of one entry, use:

               $ rlm_ippool_tool -v ip-pool.db ip-index.db 192.168.1.1
               NAS:172.16.1.1 port:0x90 - ipaddr:192.168.1.1 active:0 cli:0 num:0

       To add an IP address usage entry, use:

               $ rlm_ippool_tool -n ip-pool.db ip-index.db 192.168.1.1 172.16.1.1 0x90
               rlm_ippool_tool: Allocating ip to nas/port: 172.16.1.1/144
               rlm_ippool_tool: num: 1
               rlm_ippool_tool: Allocated ip 192.168.1.1 to client on nas 172.16.1.1,port 144

SEE ALSO
       radiusd(8)

AUTHORS
       Currently   part   of   the   FreeRADIUS   Project   (http://www.freeradius.org)   Originally   by   Edwin   Groothuis,   edwin@mavetju.org
       (http://www.mavetju.org)

       Mailing list details are at http://www.freeradius.org/

                                                                                                                                RLM_IPPOOL_TOOL(8)
