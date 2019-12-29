thin_dump(8)                            System Manager's Manual                           thin_dump(8)

NAME
       thin_dump - dump thin provisioning metadata from device or file to standard output.

SYNOPSIS
       thin_dump [options] {device|file}

DESCRIPTION
       thin_dump  dumps binary thin provisioning metadata (optionally from alternate block; see option
       --metadata-snap) created by the device-mapper thin provisioning target on a device or  file  to
       standard  output  for  analysis  or postprocessing in either XML or human readable format.  XML
       formated metadata can be fed into thin_restore (see thin_restore(8)) in order to  put  it  back
       onto a metadata device (to process by the device-mapper target) or file.

       This tool cannot be run on live metadata unless the --metadata-snap option is used.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -f, --format {xml|human_readable|custom}
              Choose output format.

           Custom formats are supported via shared library plugins.  They should be
           specified as in this example:

             $ thin_dump --format custom=mylib.so /dev/sda

       -r, --repair
              Repair the metadata whilst dumping it.

       -m, --metadata-snap{=<block nr>}
              Dump metadata snapshot.

           If block is not provided, access the default metadata snapshot created by
           the thin provisioning device-mapper target, else try the one at block nr.
           See the thin provisioning target documentation on how to create or release
           a metadata snapshot and retrieve the block number from the kernel.

       --dev-id {natural}
              Dump the specified device.

           This option may be specified multiple times to select more than one thin
           device.

       --skip-mappings
              Do not dump the mappings.

       -o {xml file}
              Specify a file for the output rather than writing to stdout.

EXAMPLES
       Dumps  the  thin provisioning metadata on logical volume /dev/vg/metadata to standard output in
       human readable format:

           $ thin_dump -f human_readable /dev/vg/metadata

       Dumps the thin provisioning metadata on logical volume /dev/vg/metadata to standard  output  in
       XML format:

           $ thin_dump /dev/vg/metadata

       Dumps  the  thin  provisioning metadata snapshot on logical volume /dev/vg/metadata to standard
       output in human readable format (not processable by thin_restore(8)):

           $ thin_dump --format human_readable --metadata-snap /dev/vg/metadata

DIAGNOSTICS
       thin_dump returns an exit code of 0 for success or 1 for error.

SEE ALSO
       thin_check(8), thin_repair(8), thin_restore(8), thin_rmap(8), thin_metadata_size(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <HeinzM@RedHat.com>

System Manager's Manual                   Device Mapper Tools                             thin_dump(8)
