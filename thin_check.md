thin_check(8)                           System Manager's Manual                          thin_check(8)

NAME
       thin_check - validates thin provisioning metadata on a device or file

SYNOPSIS
       thin_check [options] {device|file}

DESCRIPTION
       thin_check  checks  thin  provisioning  metadata created by the device-mapper thin provisioning
       target on a device or file.

       The tool cannot be run on live metadata.

OPTIONS
       -q, --quiet
              Suppress output messages, return only exit code.

       -h, --help
              Print help and exit.

       -V, --version
              Output version information and exit.

       --super-block-only
              Only check the superblock.

       --skip-mappings
              Skip checking of the block mappings which make up the bulk of the metadata.

       --ignore-non-fatal-errors
              Will only return a non-zero exit code if it finds a fatal error.

           An example of a nonfatal error is an incorrect data block reference count
           causing a block to be considered allocated when it in fact isn't.  Ignoring
           errors for a long time is not advised, you really should be using
           thin_repair to fix them.

       --clear-needs-check-flag
              Clears the 'needs_check' flag in the superblock.

           The kernel may set a flag to force the pool to be checked before it's next
           activated.  Set this switch to clear the flag if the check is successful.
           If the metadata check failed, the flag is not cleared and a thin_repair run
           is needed to fix any issues. After thin_repair succeeded, you may run
           thin_check again.

       --override-mapping-root <block>
              Specify a mapping root to use.

           Don't use this.  This overrides what's specified in the superblock.  Only
           use this if you really understand the metadata format and are trying to
           recover damaged metadata.

EXAMPLE
       Analyses thin provisioning metadata on logical volume /dev/vg/metadata:

           $ thin_check /dev/vg/metadata

       The device must not be actively used by the target when running.

DIAGNOSTICS
       thin_check returns an exit code of 0 for success or 1 for error.

SEE ALSO
       thin_dump(8), thin_repair(8), thin_restore(8), thin_rmap(8), thin_metadata_size(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>

System Manager's Manual                   Device Mapper Tools                            thin_check(8)
