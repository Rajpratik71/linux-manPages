XAPIAN-TCPSRV(1)                            User Commands                            XAPIAN-TCPSRV(1)

NAME
       xapian-tcpsrv - TCP daemon for use with Xapian's remote backend

SYNOPSIS
       xapian-tcpsrv [OPTIONS] DATABASE_DIRECTORY...

DESCRIPTION
       xapian-tcpsrv - TCP daemon for use with Xapian's remote backend

OPTIONS
       --port PORTNUM
              listen on port PORTNUM for connections (no default)

       --interface ADDRESS
              listen  on the interface associated with name or address ADDRESS (default is all inter‐
              faces)

       --idle-timeout MSECS
              set timeout for idle connections (default MSECS_IDLE_TIMEOUT_DEFAULTms)

       --active-timeout MSECS
              set timeout for active connections (default MSECS_ACTIVE_TIMEOUT_DEFAULTms)

       --timeout MSECS
              set both timeout values

       --one-shot
              serve a single connection and exit

       --quiet
              disable information messages to stdout

       --writable
              allow updates (only one database directory allowed)

       --help display this help and exit

       --version
              output version information and exit

xapian-core 1.4.5                            October 2017                            XAPIAN-TCPSRV(1)
