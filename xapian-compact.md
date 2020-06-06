XAPIAN-COMPACT(1)                           User Commands                           XAPIAN-COMPACT(1)

NAME
       xapian-compact - Compact a database, or merge and compact several

SYNOPSIS
       xapian-compact [OPTIONS] SOURCE_DATABASE... DESTINATION_DATABASE

DESCRIPTION
       xapian-compact - Compact a database, or merge and compact several

OPTIONS
       -b, --blocksize=B
              Set the blocksize in bytes (e.g. 4096) or K (e.g. 4K) (must be between 2K and 64K and a
              power of 2, default 8K)

       -n, --no-full
              Disable full compaction

       -F, --fuller
              Enable fuller compaction (not recommended if you plan to update the compacted database)

       -m, --multipass
              If merging more than 3 databases, merge the postlists in multiple passes (which is gen‐
              erally faster but requires more disk space for temporary files)

       --no-renumber
              Preserve the numbering of document ids (useful if you have external references to them,
              or have set them to match unique ids from an external source).  Currently  this  option
              is  only supported when merging databases if they have disjoint ranges of used document
              ids

       -s, --single-file
              Produce a single file database (not supported for chert)

       --help display this help and exit

       --version
              output version information and exit

xapian-core 1.4.5                            October 2017                           XAPIAN-COMPACT(1)
