cache_repair(8)                         System Manager's Manual                        cache_repair(8)

NAME
       cache_repair - repair cache binary metadata from device/file to device/file.

SYNOPSIS
       cache_repair [options] -i {device|file} -o {device|file}

DESCRIPTION
       cache_repair  reads  binary  cache metadata created by the respective device-mapper target from
       one device or file, repairs it and writes it to another device or file. If written to  a  meta‐
       data device, the metadata can be processed by the device-mapper target.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -i, --input {device|file}
              Input file or device containing binary metadata.

       -o, --output {device|file}
              Output file or device for repaired binary metadata.

           If a file is then it must be preallocated, and large enough to hold the
           metadata.

EXAMPLE
       Reads  the binary cache metadata from file metadata, repairs it and writes it to logical volume
       /dev/vg/metadata for further processing by the respective device-mapper target:

           $ cache_repair -i metadata -o /dev/vg/metadata

DIAGNOSTICS
       cache_repair returns an exit code of 0 for success or 1 for error.

SEE ALSO
       cache_dump(8), cache_check(8), cache_restore(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <HeinzM@RedHat.com>

System Manager's Manual                   Device Mapper Tools                          cache_repair(8)
