CACHE_CHECK(8)                                                                             System Manager's Manual                                                                             CACHE_CHECK(8)



NAME
       cache_check - repair cache metadata on device or file


SYNOPSIS
       cache_check [options] {device|file}


DESCRIPTION
       cache_check checks cache  metadata created by the device-mapper cache target on a device or file.


OPTIONS
       -q, --quiet
              Suppress output messages, return only exit code.


       -h, --help
              Print help and exit.


       -V, --version
              Output version information and exit.


       --super-block-only
              Only check the superblock is present.


       --skip-mappings
              Skip checking of the block mappings which make up the bulk of the metadata.


       --skip-hints
              Skip checking of the policy hint values metadata.


       --skip-discards
              Skip checking of the discard bits in the metadata.


EXAMPLE
       Analyses and repairs cache metadata on logical volume /dev/vg/metadata:

       cache_check /dev/vg/metadata

       The device may not be actively used by the target when running.


DIAGNOSTICS
       cache_check returns an exit code of 0 for success or 1 for error.


SEE ALSO
       cache_dump(8) cache_repair(8) cache_restore(8)


AUTHOR
       Joe Thornber <ejt@redhat.com>
       Heinz Mauelshagen <HeinzM@RedHat.com>



Red Hat, Inc.                                                                              Thin Provisioning Tools                                                                             CACHE_CHECK(8)
