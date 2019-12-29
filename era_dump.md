era_dump(8)                             System Manager's Manual                            era_dump(8)

NAME
       era_dump - dump era metadata from device or file to standard output.

SYNOPSIS
       era_dump [options] {device|file}

DESCRIPTION
       era_dump  dumps binary era metadata created by the device-mapper era target on a device or file
       to standard output for analysis or postprocessing in XML format. XML formated metadata  can  be
       fed  into  era_restore  (see era_restore(8)) in order to put it back onto a metadata device (to
       process by the device-mapper target) or file.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       --repair
              Repair the metadata whilst dumping it.

       --logical
              Fold any unprocessed write sets into the final era array.

           You probably want to do this if you're intending to process the results as
           it simplifies the XML.

       -o {xml file} Specify a file for the output rather than writeing to stdout.

EXAMPLES
       Dumps era metadata on logical volume /dev/vg/metadata to standard output in XML format:

           $ era_dump /dev/vg/metadata

DIAGNOSTICS
       era_dump returns an exit code of 0 for success or 1 for error.

SEE ALSO
       era_check(8), era_restore(8), era_invalidate(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>

System Manager's Manual                   Device Mapper Tools                              era_dump(8)
