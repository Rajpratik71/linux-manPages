cache_dump(8)                           System Manager's Manual                          cache_dump(8)

NAME
       cache_dump - dump cache metadata from device or file to standard output.

SYNOPSIS
       cache_dump [options] {device|file}

DESCRIPTION
       cache_dump dumps binary cache metadata created by the device-mapper cache target on a device or
       file to standard output for analysis or postprocessing in XML format.  XML  formatted  metadata
       can be fed into cache_restore in order to put it back onto a metadata device (to process by the
       device-mapper target), or file.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -r, --repair
              Repair the metadata whilst dumping it.

       -o {xml file}
              Specify an output file for the xml, rather than printing to stdout.

EXAMPLES
       Dumps the cache metadata on logical volume /dev/vg/metadata to standard output in XML format:

           $ cache_dump /dev/vg/metadata

       Dumps the cache metadata on logical volume /dev/vg/metadata whilst  repairing  it  to  standard
       output in XML format:

           $ cache_dump --repair /dev/vg/metadata

DIAGNOSTICS
       cache_dump returns an exit code of 0 for success or 1 for error.

SEE ALSO
       cache_check(8), cache_repair(8), cache_restore(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <HeinzM@RedHat.com>

System Manager's Manual                   Device Mapper Tools                            cache_dump(8)
