GETCIFSACL(1)                                             CIFS Access Control List Tools                                             GETCIFSACL(1)

NAME
       getcifsacl - Userspace helper to display an ACL in a security descriptor for Common Internet File System (CIFS)

SYNOPSIS
       getcifsacl [-v|-r] {file system object}

DESCRIPTION
       This tool is part of the cifs-utils suite.

       getcifsacl is a userspace helper program for the Linux CIFS client file system. It is intended to display a security descriptor including
       ACL for a file system object.

       This program uses a plugin to handle the mapping of SIDs to user and group names. /etc/cifs-utils/idmap-plugin should be a symlink that
       points to the correct plugin to use.

       Fields of an ACE such as SID, type, flags, and mask are displayed separated by /.  Numeric values of type, flags, and mask are displayed in
       hexadecimal format.

OPTIONS
       -v
           Print version number and exit.
       -r
           Display a security descriptor in raw mode. Values such as type and flags are displayed in hexadecimal format, a SID is not mapped to a
           name.

NOTES
       Kernel support for getcifsacl/setcifsacl utilities was initially introduced in the 2.6.37 kernel.

SEE ALSO
       mount.cifs(8), setcifsacl(1)

AUTHOR
       Shirish Pargaonkar wrote the getcifsacl program.

       The Linux CIFS Mailing list is the preferred place to ask questions regarding these programs.

cifs-utils                                                          08/19/2011                                                       GETCIFSACL(1)
