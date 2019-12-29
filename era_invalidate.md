era_invalidate(8)                       System Manager's Manual                      era_invalidate(8)

NAME
       era_invalidate - Provide a list of blocks that have changed since a particular era.

SYNOPSIS
       era_invalidate [options] {device|file}

DESCRIPTION
       era_invalidate examines era metadata and lists blocks that may have changed since a given era.

       This tool cannot be run on live metadata unless the --metadata-snap option is used.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -o {output file}
              Write output to a file rather than stdout.

       --metadata-snapshot
              Use the metadata snapshot rather than the current superblock.

       --written-since {era nr}
              Blocks written since the given era will be listed.

EXAMPLE
       List the blocks that may have been written since the beginning of era 13 on the metadata device
       /dev/vg/metadata:

           $ era_invalidate --written-since 13 /dev/vg/metadata

       The device may not be actively used by the target when running.

DIAGNOSTICS
       era_invalidate returns an exit code of 0 for success or 1 for error (eg, metadata corruption).

SEE ALSO
       era_check(8), era_dump(8), era_restore(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>

System Manager's Manual                   Device Mapper Tools                        era_invalidate(8)
