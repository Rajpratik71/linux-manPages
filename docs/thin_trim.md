THIN_TRIM(8)                                                                               System Manager's Manual                                                                               THIN_TRIM(8)



NAME
       thin_trim - Issue discard requests for free pool space (offline tool).


SYNOPSIS
       thin_trim [options] {device|file}


DESCRIPTION
       thin_trim sends discard requests to the pool device for unprovisioned areas.  It is an offline tool, do not run it while the pool is active


OPTIONS
       --pool-inactive
              Indicates you are aware the pool should be inactive.  Suppresses a warning message and prompt.


       -h, --help
              Print help and exit.


       -V, --version
              Output version information and exit.


SEE ALSO
       thin_dump(8) thin_repair(8) thin_restore(8) thin_rmap(8) thin_metadata_size(8)


AUTHOR
       Joe Thornber <ejt@redhat.com>



Red Hat, Inc.                                                                              Thin Provisioning Tools                                                                               THIN_TRIM(8)
