era_check(8)                            System Manager's Manual                           era_check(8)

NAME
       era_check - validate era metadata on device or file.

SYNOPSIS
       era_check [options] {device|file}

DESCRIPTION
       era_check checks era metadata created by the device-mapper era target on a device or file.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -q, --quiet
              Suppress output messages, return only exit code.

       --super-block-only
              Only check the superblock is present.

EXAMPLE
       Analyse thin provisioning metadata on logical volume /dev/vg/metadata:

           $ era_check /dev/vg/metadata

       The device may not be actively used by the target when running.

DIAGNOSTICS
       era_check returns an exit code of 0 for success or 1 for error.

SEE ALSO
       era_dump(8), era_restore(8), era_invalidate(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>

System Manager's Manual                   Device Mapper Tools                             era_check(8)
