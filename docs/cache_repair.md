CACHE_REPAIR(8)                                                                            System Manager's Manual                                                                            CACHE_REPAIR(8)



NAME
       cache_repair - repair cache binary metadata from device/file to device/file


SYNOPSIS
       cache_repair [options] -i {device|file} -o {device|file}


DESCRIPTION
       cache_repair reads binary cache metadata created by the respective device-mapper target from one device or file , repairs it and writes it to another device or file.  If written to a metadata device
       , the metadata can be processed by the device-mapper target.


       -i, --input {device|file}
              Input file or device with binary metadata.


       -o, --output {device|file}
              Output file or device for repaired binary metadata.


       -h, --help
              Print help and exit.


       -V, --version
              Output version information and exit.


EXAMPLE
       Reads the binary cache metadata from file metadata , repairs it and writes it to logical volume /dev/vg/metadata for further processing by the respective device-mapper target:

       cache_repair -i metadata -o /dev/vg/metadata


DIAGNOSTICS
       cache_repair returns an exit code of 0 for success or 1 for error.


SEE ALSO
       cache_dump(8) cache_check(8) cache_restore(8)


AUTHOR
       Joe Thornber <ejt@redhat.com>
       Heinz Mauelshagen <HeinzM@RedHat.com>



Red Hat, Inc.                                                                              Thin Provisioning Tools                                                                            CACHE_REPAIR(8)
