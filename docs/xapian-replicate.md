XAPIAN-REPLICATE(1)                         User Commands                         XAPIAN-REPLICATE(1)

NAME
       xapian-replicate - Replicate a database from a master server to a local copy

SYNOPSIS
       xapian-replicate [OPTIONS] DATABASE

DESCRIPTION
       xapian-replicate - Replicate a database from a master server to a local copy

OPTIONS
       -h, --host=HOST
              host to connect to (required)

       -p, --port=PORT
              port to connect to (required)

       -m, --master=DB
              replicate database DB from the master (default: DATABASE)

       -i, --interval=N
              wait N seconds between each connection to the master (default: 60)

       -r, --reader-time=N wait N seconds to allow readers time to close before
              applying repeated changesets (default: 30)

       -t, --timeout=N
              set socket timeouts (if supported) to N seconds; N=0 for no timeout (default: 0)

       -f, --force-copy
              force a full copy of the database to be sent (and then replicate as normal)

       -o, --one-shot
              replicate only once and then exit

       -q, --quiet
              only report errors

       -v, --verbose
              be more verbose

       --help display this help and exit

       --version
              output version information and exit

xapian-core 1.4.5                            October 2017                         XAPIAN-REPLICATE(1)
