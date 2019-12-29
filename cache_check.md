cache_check(8)                          System Manager's Manual                         cache_check(8)

NAME
       cache_check - validates cache metadata on a device or file.

SYNOPSIS
       cache_check [options] {device|file}

DESCRIPTION
       cache_check  checks  cache  metadata  created  by the device-mapper cache target on a device or
       file.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Output version information and exit.

       -q, --quiet
              Suppress output messages, return only exit code.

       --super-block-only
              Only check the superblock.

       --skip-hints
              Skip checking of the policy hint values metadata.

       --skip-discards
              Skip checking of the discard bits in the metadata.

       --clear-needs-check-flag
              Clears the 'needs_check' flag in the superblock.

           The kernel may set a flag to force the pool to be checked before it's next
           activated.  Set this switch to clear the flag if the check is successful.
           If the metadata check failed, the flag is not cleared and a cache_repair run
           is needed to fix any issues. After cache_repair succeeded, you may run
           cache_check again.

EXAMPLE
       Analyses and repairs cache metadata on logical volume /dev/vg/metadata:

           $ cache_check /dev/vg/metadata

       The device may not be actively used by the target when running.

DIAGNOSTICS
       cache_check returns an exit code of 0 for success or 1 for error.

SEE ALSO
       cache_dump(8), cache_repair(8), cache_restore(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <HeinzM@RedHat.com>

System Manager's Manual                   Device Mapper Tools                           cache_check(8)
