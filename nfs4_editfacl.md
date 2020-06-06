NFS4_SETFACL(1)                                                                           NFSv4 Access Control Lists                                                                          NFS4_SETFACL(1)



NAME
       nfs4_setfacl, nfs4_editfacl - manipulate NFSv4 file/directory access control lists

SYNOPSIS
       nfs4_setfacl [OPTIONS] COMMAND file...
       nfs4_editfacl [OPTIONS] file...

DESCRIPTION
       nfs4_setfacl manipulates the NFSv4 Access Control List (ACL) of one or more files (or directories), provided they are on a mounted NFSv4 filesystem which supports ACLs.

       nfs4_editfacl is equivalent to nfs4_setfacl -e.

       Refer to the nfs4_acl(5) manpage for information about NFSv4 ACL terminology and syntax.

   COMMANDS
       -a acl_spec [index]
              add the ACEs from acl_spec to file's ACL.  ACEs are inserted starting at the indexth position (DEFAULT: 1) of file's ACL.

       -A acl_file [index]
              add the ACEs from the acl_spec in acl_file to file's ACL.  ACEs are inserted starting at the indexth position (DEFAULT: 1) of file's ACL.

       -x acl_spec | index
              delete ACEs matched from acl_spec - or delete the indexth ACE - from file's ACL.  Note that the ordering of the ACEs in acl_spec does not matter.

       -X acl_file
              delete ACEs matched from the acl_spec in acl_file from file's ACL.  Note that the ordering of the ACEs in the acl_spec does not matter.

       -s acl_spec
              set file's ACL to acl_spec.

       -S acl_file
              set file's ACL to the acl_spec in acl_file.

       -e, --edit
              edit  file's  ACL  in the editor defined in the EDITOR environment variable (DEFAULT: vi(1)) and set the resulting ACL upon a clean exit, assuming changes made in the editor were saved.  Note
              that if multiple files are specified, the editor will be serially invoked once per file.

       -m from_ace to_ace
              modify file's ACL in-place by replacing from_ace with to_ace.

       -?, -h, --help
              display help text and exit.

       --version
              display this program's version and exit.

       NOTE: if '-' is given as the acl_file with the -A/-X/-S flags, the acl_spec will be read from stdin.

   OPTIONS
       -R, --recursive
              recursively apply to a directory's files and subdirectories.  Similar to setfacl(1), the default behavior is to follow symlinks given on the command line  and  to  skip  symlinks  encountered
              while recursing through directories.

       -L, --logical
              in conjunction with -R/--recursive, a logical walk follows all symbolic links.

       -P, --physical
              in conjunction with -R/--recursive, a physical walk skips all symbolic links.

       --test
              display results of COMMAND, but do not save changes.


PERMISSIONS ALIASES
       With  nfs4_setfacl, one can use simple abbreviations ("aliases") to express generic "read" (R), generic "write" (W), and generic "execute" (X) permissions, familiar from the POSIX mode bits used by,
       e.g., chmod(1).  To use these aliases, one can put them in the permissions field of an NFSv4 ACE and nfs4_setfacl will convert them: an R is expanded to rntcy, a W is expanded to  watTNcCy  (with  D
       added to directory ACEs), and an X is expanded to xtcy.  Please refer to the nfs4_acl(5) manpage for information on specific NFSv4 ACE permissions.

       For  example,  if  one  wanted  to grant generic "read" and "write" access on a file, the NFSv4 permissions field would normally contain something like rwatTnNcCy.  Instead, one might use aliases to
       accomplish the same goal with RW.

       The two permissions not included in any of the aliases are d (delete) and o (write-owner).  However, they can still be used: e.g., a permissions field consisting of  Wdo  expresses  generic  "write"
       access as well as the ability to delete and change ownership.

EXAMPLES
       Assume that the file `foo' has the following NFSv4 ACL for the following examples:

              A::OWNER@:rwatTnNcCy
              D::OWNER@:x
              A:g:GROUP@:rtncy
              D:g:GROUP@:waxTC
              A::EVERYONE@:rtncy
              D::EVERYONE@:waxTC

       - add ACE granting `alice@nfsdomain.org' generic "read" and "execute" access (defaults to prepending ACE to ACL):
              $ nfs4_setfacl -a A::alice@nfsdomain.org:rxtncy foo

       - add the same ACE as above, but using aliases:
              $ nfs4_setfacl -a A::alice@nfsdomain.org:RX foo

       - edit existing ACL in a text editor and set modified ACL on clean save/exit:
              $ nfs4_setfacl -e foo

       - set ACL (overwrites original) to contents of a spec_file named `newacl.txt':
              $ nfs4_setfacl -S newacl.txt foo

       - recursively set the ACLs of all files and subdirectories in the current directory, skipping all symlinks encountered, to the ACL contained in the spec_file named `newacl.txt':
              $ nfs4_setfacl -R -P -S newacl.txt *

       - delete the first ACE, but only print the resulting ACL (does not save changes):
              $ nfs4_setfacl --test -x 1 foo

       - delete the last two ACEs above:
              $ nfs4_setfacl -x A::EVERYONE@rtncy,D::EVERYONE@:waxTC foo

       - modify (in-place) the second ACE above:
              $ nfs4_setfacl -m D::OWNER@:x  D::OWNER@:xo foo

       - set ACLs of `bar' and `frobaz' to ACL of `foo':
              $ nfs4_getfacl foo | nfs4_setfacl -S - bar frobaz

AUTHORS
       nfs4_setfacl was written by people at CITI, the Center for Information Technology Integration (http://www.citi.umich.edu).  This manpage was written by David Richter.

CONTACT
       Please send bug reports, feature requests, and comments to <nfsv4@linux-nfs.org>.

SEE ALSO
       nfs4_getfacl(1), nfs4_acl(5), RFC3530 (NFSv4.0), NFSv4.1 Minor Version Draft.



Linux                                                                                     version 0.3.3, August 2008                                                                          NFS4_SETFACL(1)
