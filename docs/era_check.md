ERA_CHECK(8)                                                                               System Manager's Manual                                                                               ERA_CHECK(8)



NAME
       era_check - validate era metadata on device or file


SYNOPSIS
       era_check [options] {device|file}


DESCRIPTION
       era_check checks era metadata created by the device-mapper era target on a device or file.


OPTIONS
       -q, --quiet
              Suppress output messages, return only exit code.


       -h, --help
              Print help and exit.


       -V, --version
              Output version information and exit.


       --super-block-only
              Only check the superblock is present.

              era_check will return a non-zero exit code if it finds a fatal error.  If any errors are discovered use era_repair to correct.


EXAMPLE
       Analyse thin provisioning metadata on logical volume /dev/vg/metadata:

       era_check /dev/vg/metadata

       The device may not be actively used by the target when running.


DIAGNOSTICS
       era_check returns an exit code of 0 for success or 1 for error.


SEE ALSO
       era_dump(8) era_repair(8) era_restore(8) era_invalidate(8)


AUTHOR
       Joe Thornber <ejt@redhat.com>



Red Hat, Inc.                                                                              Thin Provisioning Tools                                                                               ERA_CHECK(8)
