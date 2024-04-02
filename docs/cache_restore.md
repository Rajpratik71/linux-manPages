CACHE_RESTORE(8)                                                                           System Manager's Manual                                                                           CACHE_RESTORE(8)



NAME
       cache_restore - restore cache metadata file to device or file


SYNOPSIS
       cache_restore [options] -i {device|file} -o {device|file}


DESCRIPTION
       cache_restore  restores  cache metadata created by the respective device-mapper target dumped into an XML formatted (see cache_dump(8)) file , which optionally can be preprocessed before the restore
       to another device or file.  If restored to a metadata device , the metadata can be processed by the device-mapper target.


       -i, --input {device|file}
              Input file or device with metadata.


       -o, --output {device|file}
              Output file or device.


       {--debug-override-metadata-version} <integer>
              ONLY FOR DEBUGGING PURPOSES:
              override the version stored in the metadata.


       -h, --help
              Print help and exit.


       -V, --version
              Output version information and exit.


EXAMPLE
       Restores the XML formatted cache metadata on file metadata to logical volume /dev/vg/metadata for further processing by the respective device-mapper target:

       cache_restore -i metadata -o /dev/vg/metadata


DIAGNOSTICS
       cache_restore returns an exit code of 0 for success or 1 for error.


SEE ALSO
       cache_dump(8) cache_check(8) cache_repair(8)


AUTHOR
       Joe Thornber <ejt@redhat.com>
       Heinz Mauelshagen <HeinzM@RedHat.com>



Red Hat, Inc.                                                                              Thin Provisioning Tools                                                                           CACHE_RESTORE(8)
