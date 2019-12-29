thin_metadata_size(8)                   System Manager's Manual                  thin_metadata_size(8)

NAME
       thin_metadata_size - thin provisioning metadata device/file size calculator.

SYNOPSIS
       thin_metadata_size [options]

DESCRIPTION
       thin_metadata_size  calculates  the  size  of the thin provisioning metadata based on the block
       size of the thin provisioned devices, the size of the thin provisioning pool  and  the  maximum
       number of all thin provisioned devices and snapshots. Because thin provisioning pools are hold‐
       ing widely variable contents, this tool is needed to provide sensible initial default size.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -b, --block-size {BLOCKSIZE[bskKmMgGtTpPeEzZyY]}
              Set block size.

           Block size of thin provisioned devices in units of bytes, sectors,
           kibibytes, kilobytes, ... respectively. Default is in sectors without a
           block size unit specifier. Size/number option arguments can be followed by
           unit specifiers in short one character and long form (eg. -b1m or
           -b1mebibytes).

       -s, --pool-size {POOLSIZE[bskKmMgGtTpPeEzZyY]}
              Set pool size.

           Thin provisioning pool size in units of bytes, sectors, kibibytes,
           kilobytes, ... respectively. Default is in sectors without a pool size
           unit specifier.

       -m, --max-thins {count[bskKmMgGtTpPeEzZyY]}
              Set max thins.

           Maximum sum of all thin provisioned devices and snapshots. Unit identifier
           supported to allow for convenient entry of large quantities, eg. 1000000 =
           1M. Default is absolute quantity without a number unit specifier.

       -u, --unit {bskKmMgGtTpPeEzZyY}

           Output unit specifier in units of bytes, sectors, kibibytes, kilobytes, ...
           respectively. Default is in sectors without an output unit specifier.

       -n, --numeric-only {short|long}
              Limit output to just the size number.

EXAMPLES
       Calculates the thin provisioning metadata device size for block size 64 kibibytes, pool size  1
       tebibytes and maximum number of thin provisioned devices and snapshots of 1000 in units of sec‐
       tors with long output:

           $ thin_metadata_size -b64k -s1t -m1000

       Or (using the long options instead) for block size 1 gibibyte, pool size 1 petabyte and maximum
       number of thin provisioned devices and snapshots of 1 million with numeric-only output in units
       of gigabytes:

           $ thin_metadata_size --block-size=1g --pool-size=1P --max-thins=1M --unit=G --numeric-only

       Same as before (1g, 1P, 1M, numeric-only) but with unit specifier character appended:

           $ thin_metadata_size --block-size=1gibi --pool-size=1petabytes --max-thins=1mega --unit=G --numeric-only=short

       Or with unit specifier string appended:

           $ thin_metadata_size --block-size=1gibi --pool-size=1petabytes --max-thins=1mega --unit=G -nlong

DIAGNOSTICS
       thin_metadata_size returns an exit code of 0 for success or 1 for error.

SEE ALSO
       thin_dump(8), thin_check(8), thin_repair(8), thin_restore(8), thin_rmap(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <HeinzM@RedHat.com>

System Manager's Manual                   Device Mapper Tools                    thin_metadata_size(8)
