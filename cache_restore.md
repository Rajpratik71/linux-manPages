cache_restore(8)                        System Manager's Manual                       cache_restore(8)

NAME
       cache_restore - restore cache metadata file to device or file.

SYNOPSIS
       cache_restore [options] -i {xml file} -o {device|file}

DESCRIPTION
       cache_restore  restores  cache  metadata  created by the respective device-mapper target dumped
       into an XML formatted (see cache_dump(8)) file, which optionally can be preprocessed before the
       restore  to another device or file.  If restored to a metadata device, the metadata can be pro‐
       cessed by the device-mapper target.

       This tool cannot be run on live metadata.

OPTIONS
       -h, --help
              Print help and exit.

       -V, --version
              Print version information and exit.

       -q, --quiet
              Don't print any output.  Check the exit code to test for success.

       -i, --input {xml file}
              Input xml.

       -o, --output {device|file}
              Output file or device for restored binary metadata.

           If a file is used thin it must be preallocated, and large enough to hold
           the metadata.

       --metadata-version {1|2}
              Choose a metadata version.

DEBUGGING OPTIONS
       --debug-override-metadata-version {integer}
              Override the version stored in the metadata.

       --omit-clean-shutdown
              Don't set the clean shutdown flag.

EXAMPLE
       Restores the XML formatted cache metadata on file metadata to logical  volume  /dev/vg/metadata
       for further processing by the respective device-mapper target:

           $ cache_restore -i metadata -o /dev/vg/metadata

DIAGNOSTICS
       cache_restore returns an exit code of 0 for success or 1 for error.

SEE ALSO
       cache_dump(8), cache_check(8), cache_repair(8)

AUTHOR
       Joe Thornber <ejt@redhat.com>, Heinz Mauelshagen <HeinzM@RedHat.com>

System Manager's Manual                   Device Mapper Tools                         cache_restore(8)
