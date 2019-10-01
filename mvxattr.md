MVXATTR(1)                                                                                      User Commands                                                                                      MVXATTR(1)



NAME
       mvxattr - Recursively rename extended attributes

SYNOPSIS
       mvxattr {-s STRING, --from=STRING} {-d STRING, --to=STRING} [-l, --follow-symlinks] [-p, --print] [-v, --verbose] [-f, --force] {PATH [PATH ...]}

DESCRIPTION
       This tool is part of the samba(1) suite.

       mvxattr is a simple utility to recursively rename extended attributes.

       By default all symlinks are ignored, use -l to follow them.

OPTIONS
       -s STRING, --from=STRING
           Source xattr name

       -d STRING, --to=STRING
           Destination xattr name

       -l, --follow-symlinks
           Follow symlinks, the default is to ignore them.

       -p, --print
           Print files where the xattr got renamed.

       -v, --verbose
           Print files as they are checked.

       -f, --force
           Force overwriting of destination xattr.

VERSION
       This man page is part of version 4.9.1 of the Samba suite.

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open Source project similar to the way the Linux kernel is
       developed.

       The mvxattr manpage was written by Ralph Boehme.



Samba 4.9.1                                                                                       08/09/2019                                                                                       MVXATTR(1)
