SETCIFSACL(1)                                             CIFS Access Control List Tools                                             SETCIFSACL(1)

NAME
       setcifsacl - Userspace helper to alter an ACL in a security descriptor for Common Internet File System (CIFS)

SYNOPSIS
       setcifsacl [-v|-a|-D|-M|-S] "{one or more ACEs}" {file system object}

DESCRIPTION
       This tool is part of the cifs-utils suite.

       setcifsacl is a userspace helper program for the Linux CIFS client file system.  It is intended to alter an ACL of a security descriptor
       for a file system object.  Whether a security descriptor to be set is applied or not is determined by the CIFS/SMB server.

       This program uses a plugin to handle the mapping of user and group names to SIDs. /etc/cifs-utils/idmap-plugin should be a symlink that
       points to the correct plugin to use.

OPTIONS
       -h
           Print usage message and exit.
       -v
           Print version number and exit.
       -a
           Add one or more ACEs to an ACL of a security descriptor.  An ACE is added even if the same ACE exists in the ACL.
       -D
           Delete one or more ACEs from an ACL of a security descriptor.  Entire ACE has to match in an existing ACL for the listed ACEs to be
           deleted.
       -M
           Modify one or more ACEs from an ACL of a security descriptor.  SID and type are used to match for existing ACEs to be modified with the
           list of ACEs specified.
       -S
           Set an ACL of security descriptor with the list of ACEs Existing ACL is replaced entirely with the specified ACEs.

       Every ACE entry starts with "ACL:" One or more ACEs are specified within double quotes.  Multiple ACEs are separated by a comma.

       Following fields of an ACE can be modified with possible values:

       SID: Either a name or a raw SID value.

       type: ALLOWED (0x0), DENIED (0x1), OBJECT_ALLOWED (0x5), OBJECT_DENIED (0x6)

       flags: OBJECT_INHERIT_FLAG (OI or 0x1), CONTAINER_INHERIT_FLAG (CI or 0x2), NO_PROPAGATE_INHERIT_FLAG (NI or 0x4), INHERIT_ONLY_FLAG (IO or
       0x8), INHERITED_ACE_FLAG (IA or 0x10) or a combination/OR of these values.

       mask: Either one of FULL, CHANGE, READ, a combination of R W X D P O, or a hex value

EXAMPLES
       Add an ACE
       setcifsacl -a "ACL:CIFSTESTDOM\user2:DENIED/0x1/D" <file_name> setcifsacl -a "ACL:CIFSTESTDOM\user1:ALLOWED/OI|CI|NI/D" <file_name>

       Delete an ACE
       setcifsacl -D "ACL:S-1-1-0:0x1/OI/0x1201ff" <file_name>

       Modify an ACE
       setcifsacl -M "ACL:CIFSTESTDOM\user1:ALLOWED/0x1f/CHANGE" <file_name>

       Set an ACL
       setcifsacl -S "ACL:CIFSTESTDOM\Administrator:0x0/0x0/FULL,
       ACL:CIFSTESTDOM\user2:0x0/0x0/FULL" <file_name>

NOTES
       Kernel support for getcifsacl/setcifsacl utilities was initially introduced in the 2.6.37 kernel.

SEE ALSO
       mount.cifs(8), getcifsacl(1)

AUTHOR
       Shirish Pargaonkar wrote the setcifsacl program.

       The Linux CIFS Mailing list is the preferred place to ask questions regarding these programs.

cifs-utils                                                          08/19/2011                                                       SETCIFSACL(1)
