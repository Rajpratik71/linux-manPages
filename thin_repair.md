thin_repair(8)                          System Manager's Manual                         thin_repair(8)

NAME
       thin_repair - repair thin provisioning binary metadata.

SYNOPSIS
       thin_repair [options] -i {device|file} -o {device|file}

DESCRIPTION
       thin_repair  reads  binary  thin  provisioning metadata created by the respective device-mapper
       target from one device or file, repairs it and writes it to different device or file. If  writ‐
       ten to a metadata device, the metadata can be processed by the device-mapper target.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -i, --input {device|file}
              Input file or device with binary data.

       -o, --output {device|file}
              Output file or device for binary data.

           If a file is used for output, then it must be preallocated, and large
           enough to hold the metadata.

EXAMPLE
       Reads  the  binary  thin  provisioning metadata from file metadata, repairs it and writes it to
       logical volume /dev/vg/metadata for further processing by the respective device-mapper target:

           $ thin_repair -i metadata -o /dev/vg/metadata

DIAGNOSTICS
       thin_repair returns an exit code of 0 for success or 1 for error.

SEE ALSO
       thin_dump(8), thin_check(8), thin_restore(8), thin_rmap(8), thin_metadata_size(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <HeinzM@RedHat.com>

System Manager's Manual                   Device Mapper Tools                           thin_repair(8)
