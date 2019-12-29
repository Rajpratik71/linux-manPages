thin_restore(8)                         System Manager's Manual                        thin_restore(8)

NAME
       thin_restore - restore thin provisioning metadata file to device or file.

SYNOPSIS
       thin_restore [options] -i {xml file} -o {device|file}

DESCRIPTION
       thin_restore restores thin provisioning metadata created by the respective device-mapper target
       dumped into an XML formatted (see thin_dump(8)) file, which optionally can be preprocessed  be‐
       fore  the restore to another device or file. If restored to a metadata device, the metadata can
       be processed by the device-mapper target.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -q, --quiet
              Suppress output messages, return only exit code.

       -i, --input {xml file}
              Input file containing XML metadata.

       -o, --output {device|file}
              Output file or device for restored binary metadata.

           If a file is used for output, then it must be preallocated, and large
           enough to hold the metadata.

EXAMPLE
       Restores the XML formatted thin provisioning  metadata  on  file  metadata  to  logical  volume
       /dev/vg/metadata for further processing by the respective device-mapper target:

           $ thin_restore -i metadata -o /dev/vg/metadata

DIAGNOSTICS
       thin_restore returns an exit code of 0 for success or 1 for error.

SEE ALSO
       thin_dump(8), thin_check(8), thin_repair(8), thin_rmap(8), thin_metadata_size(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <HeinzM@RedHat.com>

System Manager's Manual                   Device Mapper Tools                          thin_restore(8)
