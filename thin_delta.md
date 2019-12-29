thin_delta(8)                           System Manager's Manual                          thin_delta(8)

NAME
       thin_delta - Print the differences in the mappings between two thin devices.

SYNOPSIS
       thin_delta [options] {device|file}

DESCRIPTION
       thin_delta  allows  you  to  compare  the  mappings in two thin volumes (snapshots allow common
       blocks between thin volumes).

       This tool cannot be run on live metadata unless the --metadata-snap option is used.

OPTIONS
       --thin1, --snap1 {natural}
              The numeric identifier for the first thin volume to diff.

       --thin2, --snap2 {natural}
              The numeric identifier for the second thin volume to diff.

       --metadata-snap [block nr]
              Use a metadata snapshot.

           If you want to get information out of a live pool then you will need to
           take a metadata snapshot and use this switch.  In order for the information
           to be meaningful, you need to ensure the thin volumes you're examining are
           not changing (ie, do not activate those thins).

       --verbose
              Provide extra information on the mappings.

       -h, --help
              Print help and exit.

       -V, --version
              Output version information and exit.

SEE ALSO
       thin_dump(8), thin_repair(8), thin_restore(8), thin_rmap(8), thin_metadata_size(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>

System Manager's Manual                   Device Mapper Tools                            thin_delta(8)
