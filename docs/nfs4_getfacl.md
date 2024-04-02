NFS4_GETFACL(1)                                                                           NFSv4 Access Control Lists                                                                          NFS4_GETFACL(1)



NAME
       nfs4_getfacl - get NFSv4 file/directory access control lists

SYNOPSIS
       nfs4_getfacl [-HR] file ...

DESCRIPTION
       nfs4_getfacl will display the NFSv4 Access Control List (ACL) for the files given as arguments, provided they are on mounted NFSv4 filesystems which support ACLs.

       If the -H/--more-help flag is specified, nfs4_getfacl will print some information about NFSv4 ACLs and the fields used in ACEs.

       If the -R/--recursive flag is specified, nfs4_getfacl will list the NFSv4 ACLs of all files and directories recursively.

       The output format for an NFSv4 file ACL, e.g., is:

              # file: /somedir
              A::OWNER@:rwatTnNcCy
              A::alice@nfsdomain.org:rxtncy
              A::bob@nfsdomain.org:rwadtTnNcCy
              A:g:GROUP@:rtncy
              D:g:GROUP@:waxTC
              A::EVERYONE@:rtncy
              D::EVERYONE@:waxTC

       In the example output above, the user `alice@nfsdomain.org' has the equivalent of "read" and "execute" permissions, `bob@nfsdomain.org' has "read" and "write", and both `GROUP@' and `EVERYONE@' have
       "read".

       The ACL listings of multiple files are separated by blank lines.

       Refer to the nfs4_acl(5) manpage for detailed information about NFSv4 ACL terminology and syntax.

AUTHORS
       nfs4_getfacl was written by people at CITI, the Center for Information Technology Integration (http://www.citi.umich.edu).  This manpage was written by David Richter.

CONTACT
       Please send bug reports, feature requests, and comments to <nfsv4@linux-nfs.org>.

SEE ALSO
       nfs4_setfacl(1), nfs4_acl(5), RFC3530 (NFSv4.0), NFSv4.1 Minor Version Draft.



Linux                                                                                     version 0.3.3, August 2008                                                                          NFS4_GETFACL(1)
