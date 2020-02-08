xenstore-ls(1)                                    Xen                                   xenstore-ls(1)

NAME
       xenstore-ls - list Xenstore keys and values

SYNOPSIS
       xenstore-ls [OPTION]... [PATH]...

DESCRIPTION
       List keys, values and permissions of one or more Xenstore PATHs, using a nested, tree-like
       view.

       -f  Show the full path for all keys.

       -p  Show permissions of all the listed keys as comma separated list.  The format of each
           permission is LD, where L is a letter for the type of permission and D is the corresponding
           domain ID.

           The types of permission are:

           r   read

           w   write

           b   read and write (both)

           n   no access

           The first permission entry is the domain owning the key (the owner) and the permissions for
           any domain not explicitly listed in subsequent entries.  The key owner always has full
           access (read, write, and set permissions).

       -s  Connect to the Xenstore daemon using a local socket only.

BUGS
       Send bugs to xen-devel@lists.xen.org, see http://wiki.xen.org/xenwiki/ReportingBugs on how to
       send bug reports.

4.9.2                                         2018-04-12                                xenstore-ls(1)
