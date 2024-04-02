RREDTOOL(1)                                                          REPREPRO                                                          RREDTOOL(1)

NAME
       rredtool - merge or apply a very restricted subset of ed patches

SYNOPSIS
       rredtool --help

       rredtool [ options ] --merge patches...

       rredtool [ options ] --patch file-to-patch patches...

       rredtool directory newfile oldfile mode

DESCRIPTION
       rredtool  is  a  tool to handle a subset of ed patches in a safe way.  It is especially targeted at ed patches as used in Packages.diff and
       Sources.diff.  Is also has a mode supposed to be called from reprepro as Index Hook to generate and update a Packages.diff/Index file.

MODI
       One of the following has to be given, so that rredtool know that to do.

       --version
              Print the version of this tool (or rather the version of reprepro which it is coming with).

       --help Print a short overview of the modi.

       --patch
              The first argument of rredtool is the file to patch, the other arguments are ed patches to apply on this one.

       --merge
              The arguments are treated as ed patches, which are merged into a single one.

       --reprepro-hook (or no other mode flag)
              Act as reprepro index hook to manage a Packages.diff/index file.  That means it expects to get exactly 4 arguments  and  writes  the
              names of files to place into filedescriptor 3.

              If neither --patch nor --merge is given, this mode is used, so you can just put

               DebIndices: Packages Release . .gz /usr/bin/rredtool

              into  reprepro's  conf/distributions  file  to  have a Packages.diff directory generated.  (Note that you have to generate an uncom‐
              pressed file (the single dot).  You will need to have patch, gzip and gunzip available in your path.)

OPTIONS
       --debug
              Print intermediate results or other details that might be interesting when trying to track down bugs in rredtool but not  intresting
              otherwise.

       --max-patch-count=count
              When generating a Packages.diff/Index file, put at most count patches in it (not counting possible apt workaround patches).

       -o|--output
              Not yet implemented.

ENVIRONMENT
       TMPDIR, TEMPDIR
              temporary files are created in $TEMPDIR if set, otherwise in $TMPDIR if set, otherwise in /tmp/.

REPORTING BUGS
       Report bugs or wishlist requests the Debian BTS (e.g. by using reportbug reperepro) or directly to <brlink@debian.org>.

COPYRIGHT
       Copyright © 2009 Bernhard R. Link
       This  is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

reprepro                                                            2009-11-12                                                         RREDTOOL(1)
