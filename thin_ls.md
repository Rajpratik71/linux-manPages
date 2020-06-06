thin_ls(8)                              System Manager's Manual                             thin_ls(8)

NAME
       thin_ls - List thin volumes within a pool.

SYNOPSIS
       thin_ls [options] {device|file}

DESCRIPTION
       thin_ls  displays infomation about thin volumes in a pool. Pass the metadata device on the com‐
       mand line, not the pool device.

       This tool cannot be run on live metadata unless the --metadata-snap option is used.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -o, --format
              Give a comma separated list of fields to be output.

           Valid fields are:
             DEV, MAPPED_BLOCKS, EXCLUSIVE_BLOCKS, SHARED_BLOCKS, MAPPED_SECTORS,
             EXCLUSIVE_SECTORS, SHARED_SECTORS, MAPPED_BYTES, EXCLUSIVE_BYTES,
             SHARED_BYTES, MAPPED, EXCLUSIVE, SHARED, TRANSACTION, CREATE_TIME,
             SNAP_TIME

       --no-headers
              Don't output headers.

       -m, --metadata-snap
              Use metadata snapshot.

           If you want to get information out of a live pool then you will need to
           take a metadata snapshot and use this switch.

SEE ALSO
       thin_dump(8),   thin_repair(8),   thin_restore(8),   thin_rmap(8),   thin_trim(8),   thin_meta‐
       data_size(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>

System Manager's Manual                   Device Mapper Tools                               thin_ls(8)
