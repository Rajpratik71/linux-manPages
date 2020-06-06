cache_writeback(8)                      System Manager's Manual                     cache_writeback(8)

NAME
       cache_writeback - writeback dirty blocks to the origin device.

SYNOPSIS
       cache_writeback [options] --metadata-device {device|file} --origin-device {device|file} --fast-device {device|file}

DESCRIPTION
       cache_writeback is an offline tool that writes back dirty data to the data device (origin). In‐
       tended for use in recovery scenarios when the SSD is giving IO errors.

       This tool cannot be run on a live cache.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       --metadata-device {device|file}
              Location of cache metadata.

       --origin-device {device|file}
              Slow device being cached.

       --fast-device {device|file}
              Fast device containing the data that needs to be written back.

       --no-metadata-update
              Do not update the metadata to clear the dirty flags.

           You may want to use this flag if you're decommissioning the cache.

       --buffer-size-meg {size}
              Specify the size for the metadata cache.

           Defaults to 16 Gig, a larger size may improve performance.

       --list-failed-blocks
              List any blocks that failed the writeback process.

SEE ALSO
       cache_dump(8), cache_check(8), cache_repair(8), cache_restore(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>

System Manager's Manual                   Device Mapper Tools                       cache_writeback(8)
