cache_metadata_size(8)                  System Manager's Manual                 cache_metadata_size(8)

NAME
       cache_metadata_size  -  Estimate  the size of the metadata device needed for a given configura‐
       tion.

SYNOPSIS
       cache_metadata_size [options]

DESCRIPTION
       cache_metadata_size estimates the size of the metadata.
              Either --nr-blocks, or --block-size and --device-size must be specified.

OPTIONS
       --nr-blocks {natural}
              Specify the number of cache blocks.

       --block-size {sectors}
              Specify the size of each cache block in 512 byte sectors.

       --device-size {sectors}
              Specify total size of the fast device used in the cache.  In 512 byte sectors.

       --max-hint-width {nr bytes}
              Specify hint width.

           Cache policies use a per block 'hint' to record extra info (for instance
           hit counts).  At the moment all policies use a 4 byte hint
           width.  If you want to use a different hint width specify it with this
           switch.

EXAMPLE
       $ cache_metadata_size --nr-blocks 10240

       $ cache_metadata_size --block-size 128 --device-size 1024000

SEE ALSO
       cache_dump(8), cache_repair(8), cache_restore(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>

System Manager's Manual                   Device Mapper Tools                   cache_metadata_size(8)
