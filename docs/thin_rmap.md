THIN_RMAP(g(8)                                                                             System Manager's Manual                                                                             THIN_RMAP(g(8)



NAME
       thin_rmap - output reverse map of a thin provisioned region of blocks from metadata device or file


SYNOPSIS
       thin_rmap [options] {device|file}


DESCRIPTION
       thin_rmap outputs the reverse mapping stored in the metadata on a device or file between a region of thin provisioned pool blocks and the associated thin provisioned devices.


       --region <block range>
       output reverse map


       -h, --help
       Print help and exit.


       -V, --version
       Output version information and exit.


EXAMPLES
       output reverse map for pool blocks 5..45 (denotes blocks 5 to 44 inclusive, but not block 45)


       thin_rmap --region 5..45 /dev/vg/pool


DIAGNOSTICS
       thin_rmap returns an exit code of 0 for success or 1 for error.


SEE ALSO
       thin_check(8) thin_dump(8) thin_repair(8) thin_restore(8) thin_metadata_size(8)


AUTHOR
       Joe Thornber <ejt@redhat.com>
       Heinz Mauelshagen <HeinzM@RedHat.com>



Red Hat, Inc.                                                                              Thin Provisioning Tools                                                                             THIN_RMAP(g(8)
