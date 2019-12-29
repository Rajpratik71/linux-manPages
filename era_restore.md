era_restore(8)                          System Manager's Manual                         era_restore(8)

NAME
       era_restore - restore era metadata file to device or file.

SYNOPSIS
       era_restore [options] -i {xml file} -o {device|file}

DESCRIPTION
       era_restore restores era metadata created by the respective device-mapper target dumped into an
       XML formatted (see era_dump(8)) file, which optionally can be preprocessed before  the  restore
       to  another  device or file. If restored to a metadata device, the metadata can be processed by
       the device-mapper target.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -q, --quiet
              Don't print any output.  Check the exit code to test for success.

       -i, --input {xml file}
              Specify input file containing xml metadata.

       -o, --output {device|file}
              Output device or file for restored binary metadata.

           If a file is used, then it must be preallocated, and large enough to hold
           the metadata.

EXAMPLE
       Restores the XML formatted era metadata on file metadata to logical volume /dev/vg/metadata for
       further processing by the respective device-mapper target:

           $ era_restore -i metadata -o /dev/vg/metadata

DIAGNOSTICS
       era_restore returns an exit code of 0 for success or 1 for error.

SEE ALSO
       era_dump(8), era_check(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <HeinzM@RedHat.com>

System Manager's Manual                   Device Mapper Tools                           era_restore(8)
