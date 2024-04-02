THIN_CHECK(8)                                                                              System Manager's Manual                                                                              THIN_CHECK(8)



NAME
       thin_check - validate thin provisioning metadata on device or file


SYNOPSIS
       thin_check [options] {device|file}


DESCRIPTION
       thin_check checks thin provisioning metadata created by the device-mapper thin provisioning target on a device or file.


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


       --ignore-non-fatal-errors
              thin_check  will only return a non-zero exit code if it finds a fatal error.  An example of a non fatal error is an incorrect data block reference count causing a block to be considered allo-
              cated when it in fact isn't.  Ignoring errors for a long time is not advised, you really should be using thin_repair to fix them.


EXAMPLE
       Analyses thin provisioning metadata on logical volume /dev/vg/metadata:

       thin_check /dev/vg/metadata

       The device must not be actively used by the target when running.


DIAGNOSTICS
       thin_check returns an exit code of 0 for success or 1 for error.


SEE ALSO
       thin_dump(8) thin_repair(8) thin_restore(8) thin_rmap(8) thin_metadata_size(8)


AUTHOR
       Joe Thornber <ejt@redhat.com>
       Heinz Mauelshagen <HeinzM@RedHat.com>



Red Hat, Inc.                                                                              Thin Provisioning Tools                                                                              THIN_CHECK(8)
