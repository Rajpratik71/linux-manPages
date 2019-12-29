thin_rmap(8)                            System Manager's Manual                           thin_rmap(8)

NAME
       thin_rmap  -  output reverse map of a thin provisioned region of blocks from metadata device or
       file.

SYNOPSIS
       thin_rmap [options] {device|file}

DESCRIPTION
       thin_rmap outputs the reverse mapping stored in the metadata on a device or file between a  re‐
       gion of thin provisioned pool blocks and the associated thin provisioned devices.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       --region {block range}
              Specify range of blocks on the data device.

           At least one region must be specified.  Multiple regions may be specified.

           The range takes the format <begin>..<one past the end>.  For example,
           "5..45" specifies data blocks 5 to 44 inclusive, but not 45.

EXAMPLES
       $ thin_rmap --region 5..45 /dev/pool-metadata

DIAGNOSTICS
       thin_rmap returns an exit code of 0 for success or 1 for error.

SEE ALSO
       thin_check(8), thin_dump(8), thin_repair(8), thin_restore(8), thin_metadata_size(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <HeinzM@RedHat.com>

System Manager's Manual                   Device Mapper Tools                             thin_rmap(8)
