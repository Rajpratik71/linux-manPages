ureadahead(8)              System Manager's Manual              ureadahead(8)

NAME
       ureadahead - Read files in advance during boot

SYNOPSIS
       ureadahead [OPTIONS]...  [PACK]

DESCRIPTION
       ureadahead  (über-readahead)  is  used  during  boot  to read files in
       advance of when they are needed such that they are already in the page
       cache, improving boot performance.

       When  started  without  any arguments, it checks for the existance and
       age of the default pack  file  /var/lib/ureadahead/pack,  and  if  not
       present  or  older  than a month, will discard it and retrace the boot
       sequence.  The pack will then  contain  information  about  the  files
       opened  during boot, and the blocks that were in memory at the comple‐
       tion of the boot.

       If the file exists and is newer than a month old, or an alternate PACK
       path  is  given  on the command-line, the files listed in the pack are
       opened and the blocks read into the page cache using the  readahead(2)
       system call.

       Pack  files are automatically optimised for Solid-State Disks or rota‐
       tional Hard Drives, depending on which you have.

OPTIONS
       --verbose
              May be used to report on ureadahead's operation.   In  particu‐
              lar, this causes information about the size of the pack file to
              be output when reading and a complete dump of the  contents  of
              the pack file after tracing.

       --daemon
              Places  ureadahead  into  the background once the pack file has
              been read, or once tracing has been enabled.

              This is ignored when reading on rotational hard  drives,  since
              it's  important  for  performance  reasons  not to contend with
              other processes for I/O.

       --force-trace
              Discards all pack files and forces re-tracing.

       --timeout=SECONDS
              Normally when tracing, ureadahead will wait for a TERM  or  INT
              signal  before  concluding  and generating the pack file.  This
              option instead sets a timeout after  which  tracing  is  termi‐
              nated.

       --dump Dump  the  contents  of  the  pack file to standard output in a
              pretty format, does not trace or read the contents into memory.

       --sort=SORT
              Used with --dump to sort the output.

              The default is open, which is the order that the files will  be
              opened.   path  sorts by path name, disk sorts by on-disk loca‐
              tion, and size sorts by the amount of data that  will  be  read
              for that file.

OTHER MOUNT POINTS
       PACK need not be the filename of a pack, instead it may be the name of
       a mount point (or indeed any non-file within the filesystem), in which
       case the pack for that device is read instead.  This allows ureadahead
       to be called in the style ureadahead /usr for filesystems split across
       multiple devices.

       Pack files for these other devices are also stored under /var/lib/ure‐
       adahead and are named mountpoint.pack

       When tracing, these will be automatically generated.

FILES
       /var/lib/ureadahead/pack

AUTHOR
       Written by Scott James Remnant <scott@netsplit.com>

BUGS
       Report bugs at <https://launchpad.net/ubuntu/+source/ureadahead/+bugs>

COPYRIGHT
       Copyright © 2009 Canonical Ltd.

       This is free software; see the source for copying  conditions.   There
       is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       readahead(2)

ureadahead                        2009-09-29                    ureadahead(8)
