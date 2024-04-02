THIN_REPAIR(8)                                                                             System Manager's Manual                                                                             THIN_REPAIR(8)



NAME
       thin_repair - repair thin provisioning binary metadata from device/file to device/file


SYNOPSIS
       thin_repair [options] -i {device|file} -o {device|file}


DESCRIPTION
       thin_repair  reads  binary  thin  provisioning  metadata created by the respective device-mapper target from one device or file , repairs it and writes it to another device or file.  If written to a
       metadata device , the metadata can be processed by the device-mapper target.


       -i, --input {device|file}
              Input file or device with binary metadata.


       -o, --output {device|file}
              Output file or device for repaired binary metadata.


       -h, --help
              Print help and exit.


       -V, --version
              Output version information and exit.


EXAMPLE
       Reads the binary thin provisioning metadata from file metadata , repairs it and writes it to logical volume /dev/vg/metadata for further processing by the respective device-mapper target:

       thin_repair -i metadata -o /dev/vg/metadata


DIAGNOSTICS
       thin_repair returns an exit code of 0 for success or 1 for error.


SEE ALSO
       thin_dump(8) thin_check(8) thin_restore(8) thin_rmap(8) thin_metadata_size(8)


AUTHOR
       Joe Thornber <ejt@redhat.com>
       Heinz Mauelshagen <HeinzM@RedHat.com>



Red Hat, Inc.                                                                              Thin Provisioning Tools                                                                             THIN_REPAIR(8)
