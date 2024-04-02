THIN_DELTA(8)                                                                              System Manager's Manual                                                                              THIN_DELTA(8)



NAME
       thin_delta - Print the differences in the mappings between two thin devices.


SYNOPSIS
       thin_delta [options] {device|file}


DESCRIPTION
       thin_delta allows you to compare the mappings in two thin volumes (snapshots allow common blocks between thin volumes).


OPTIONS
       --thin1, --snap1
              The numeric identifier for the first thin volume to diff.


       --thin1, --snap1
              The numeric identifier for the second thin volume to diff.


       -m, --metadata-snap [block#]

              If  you  want  to  get information out of a live pool then you will need to take a metadata snapshot and use this switch.  In order for the information to be meaningful you need to ensure the
              thin volumes you're examining are not changing (eg, do not activate those thins).


       --verbose
              Provide extra information on the mappings.


       -h, --help
              Print help and exit.


       -V, --version
              Output version information and exit.


SEE ALSO
       thin_dump(8) thin_repair(8) thin_restore(8) thin_rmap(8) thin_trim(8) thin_metadata_size(8)


AUTHOR
       Joe Thornber <ejt@redhat.com>



Red Hat, Inc.                                                                              Thin Provisioning Tools                                                                              THIN_DELTA(8)
