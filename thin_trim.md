thin_trim(8)                            System Manager's Manual                           thin_trim(8)

NAME
       thin_trim - Issue discard requests for free pool space (offline tool).

SYNOPSIS
       thin_trim [options] --metadata-dev {device|file} --data-dev {device|file}

DESCRIPTION
       thin_trim sends discard requests to the pool device for unprovisioned areas.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       --pool-inactive
              Indicates you are aware the pool should be inactive.

           Suppresses a warning message and prompt.

SEE ALSO
       thin_dump(8), thin_repair(8), thin_restore(8), thin_rmap(8), thin_metadata_size(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>

System Manager's Manual                   Device Mapper Tools                             thin_trim(8)
