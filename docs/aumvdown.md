AUMVDOWN(8)                            Linux Aufs User's Manual                            AUMVDOWN(8)

NAME
       aumvdown - moves-down a file between aufs branches

SYNOPSIS
       aumvdown [options] file_in_aufs ...

DESCRIPTION
       "aumvdown"  command  finds  the first branch where the given file exists, copies it to the next
       lower writable branch, and then removes the file on the first branch.

       There are several conditions to achieve the operation.

              •   It is obvious that when the file  exists  between  the  first  and  the  next  lower
                  writable  branches,  or  hidden by the whiteout or directory's opaque-ness, then the
                  operation will fail. Because it breaks the consistency in aufs world.

              •   If a "opaque"-ed directory exists in the ancestors of the file and it would hide the
                  moved-down file, then the operation will fail.

                  Similary  if  a whiteout (in effect) exists on any branch betwee source and destina‐
                  tion branch and it would hide  the moved-down file, then  the  operation  will  fail
                  too.  Note that the whiteout on "=ro" branch is not in effect, but "=ro+wh" branch.

              •   Files in use (both in aufs world and in branch filesystem) are not be handled.

              •   Hard-linked files are not be handled.  For such file, remount aufs or use auplink(8)
                  or aubrsync(8).

              •   Removed files are not be handled since it has no name.

              •   Directories are not be handled since the action doesn't behave recursively  and  the
                  moving-down an empty dir has less meaning.

OPTIONS
       -b | --lower-branch-id
              -B  |  --upper-branch-id Specify the source/target branch by its id.  You can obtain the
              branch id via sysfs.

       -i | --interactive
              Prompt to the user for every given file.

       -k | --keep-upper
              Don't unlink the upper source file after copying-down.

       -o | --overwrite-lower
              Overwrite the lower target file if it exists.

       -r | --allow-ro-lower
              Do the operation even if the lower branch is marked as readonly in aufs  world  ("=ro").
              Note  that  the  natively readonly filesystems (mounted with "-o ro") are not operatable
              still even if you specify this option.

       -R | --allow-ro-upper
              Do the operation even if the upper branch is marked as readonly in aufs  world  ("=ro").
              Note  that  the  natively readonly filesystems (mounted with "-o ro") are not operatable
              still even if you specify this option.

       -v | --verbose
              Make it verbose particularly for the error cases.

       -h | --help
              Shows the command syntax.

SEE ALSO
       aufs(5)

COPYRIGHT
       Copyright © 2011-2015 Junjiro R. Okajima

AUTHOR
       Junjiro R. Okajima

Linux                                      aufs3.9 and later                               AUMVDOWN(8)
