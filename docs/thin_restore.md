THIN_RESTORE(8)                                                                            System Manager's Manual                                                                            THIN_RESTORE(8)



NAME
       thin_restore - restore thin provisioning metadata file to device or file


SYNOPSIS
       thin_restore [options] -i {device|file} -o {device|file}


DESCRIPTION
       thin_restore restores thin provisioning metadata created by the respective device-mapper target dumped into an XML formatted (see thin_dump(8)) file , which optionally can be preprocessed before the
       restore to another device or file.  If restored to a metadata device , the metadata can be processed by the device-mapper target.


       -q, --quiet
              Suppress output messages, return only exit code.


       -i, --input {device|file}
              Input file or device with metadata.


       -o, --output {device|file}
              Output file or device.


       -h, --help
              Print help and exit.


       -V, --version
              Output version information and exit.


EXAMPLE
       Restores the XML formatted thin provisioning metadata on file metadata to logical volume /dev/vg/metadata for further processing by the respective device-mapper target:

       thin_restore -i metadata -o /dev/vg/metadata


DIAGNOSTICS
       thin_restore returns an exit code of 0 for success or 1 for error.


SEE ALSO
       thin_dump(8) thin_check(8) thin_repair(8) thin_rmap(8) thin_metadata_size(8)


AUTHOR
       Joe Thornber <ejt@redhat.com>
       Heinz Mauelshagen <HeinzM@RedHat.com>



Red Hat, Inc.                                                                              Thin Provisioning Tools                                                                            THIN_RESTORE(8)
