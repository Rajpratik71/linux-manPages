MKZFTREE(1)                                                       H. Peter Anvin                                                       MKZFTREE(1)

NAME
       mkzftree - Create a zisofs/RockRidge compressed file tree

SYNOPSIS
       mkzftree [OPTIONS]... INPUT OUTPUT

DESCRIPTION
       Takes  an  input  file tree (INPUT) and create a corresponding compressed file tree (OUTPUT) that can be used with an appropriately patched
       mkisofs(8) to create a transparent-compression ISO 9660/Rock Ridge filesystem using the "ZF" compression records.

OPTIONS
       -f, --force
              Always compress all files, even if they get larger when compressed.

       -z level, --level level
              Select compression level (1-9, default is 9).  Lower compression levels are faster, but typically result in larger output.

       -u, --uncompress
              Uncompress an already compressed tree.  This can be used to read a  compressed  filesystem  on  a  system  which  cannot  read  them
              natively.

       -p parallelism, --parallelism parallelism
              Compress in parallel.  The parallelism value indicates how many compression threads are allowed to run.

       -x, --one-filesystem
              Do not cross filesystem boundaries, but create directory stubs at mount points.

       -X, --strict-one-filesystem
              Do not cross filesystem boundaries, and do not create directory stubs at mount points.

       -C path, --crib-path path
              Steal ("crib") files from another directory if it looks (based on name, size, type and modification time) like they match entries in
              the new filesystem.  The "crib tree" is usually the compressed version of an older version of the same workload;  this  thus  allows
              for  "incremental  rebuilds" of a compressed filesystem tree.  The files are hardlinked from the crib tree to the output tree, so if
              it is desirable to keep the link count correct the crib path should be deleted before running mkisofs.  The crib tree must be on the
              same filesystem as the output tree.

       -l, --local
              Do not recurse into subdirectories, but create the directories themselves.

       -L, --strict-local
              Do not recurse into subdirectories, and do not create directories.

       -F, --file
              Indicates  that  INPUT  may  not  necessarily be a directory; this allows operation on a single file.  Note especially that if -F is
              specified, and INPUT is a symlink, the symlink itself will be copied rather than whatever it happens to point to.

       -s, --sloppy
              Treat file modes, times and ownership data as less than precious information and don't abort if they cannot be  set.   This  may  be
              useful if running mkisofs on an input tree you do not own.

       -v, --verbose
              Increase the program verbosity.

       -V value, --verbosity value
              Set the program verbosity to value.

       -q, --quiet
              Issue no messages whatsoever, including error messages.  This is the same as specifying -V 0.

       -h, --help
              Display a brief help message.

       -w, --version
              Display the release version.

BUGS
       Long  options  (beginning  with --) may not work on all systems.  See the message printed out by mkzftree -h to see if this applies to your
       system.

       Inode change times (ctimes) are not copied.  This is a system limitation and applies to all file copy programs.

       If using the parallel option (-z) the access times (atimes) on directories may or may not be copied.  If it is important that the atimes on
       directories are copied exactly, avoid using -z.

AUTHOR
       Written by H. Peter Anvin <hpa@zytor.com>.

COPYRIGHT
       Copyright © 2001-2002 H. Peter Anvin.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       mkisofs(8)

zisofs-tools                                                       30 July 2001                                                        MKZFTREE(1)
