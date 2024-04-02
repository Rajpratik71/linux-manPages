xenstore-chmod(1)                                 Xen                                xenstore-chmod(1)

NAME
       xenstore-chmod - set the permissions of a Xenstore key

SYNOPSIS
       xenstore-chmod [OPTION]... [KEY] [PERM]...

DESCRIPTION
       Sets the permissions of the Xenstore KEY.

       PERM has the format LD, where L is a letter for the type of permission and D is the
       corresponding domain ID.

       The types of permission are:

       r   read

       w   write

       b   read and write (both)

       n   no access

       The first permission entry is the domain owning the key (the owner) and the permissions for any
       domain not explicitly listed in subsequent entries.  The key owner always has full access
       (read, write, and set permissions).

       -r  Apply the permissions to the key and all its children.

       -s  Connect to the Xenstore daemon using a local socket only.

       -u  Apply the permissions to the key and all its parents.

BUGS
       Send bugs to xen-devel@lists.xen.org, see http://wiki.xen.org/xenwiki/ReportingBugs on how to
       send bug reports.

4.9.2                                         2018-04-12                             xenstore-chmod(1)
