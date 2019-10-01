selinux_restorecon(3)                                                                     SELinux API documentation                                                                     selinux_restorecon(3)



NAME
       selinux_restorecon - restore file(s) default SELinux security contexts

SYNOPSIS
       #include <selinux/restorecon.h>

       int selinux_restorecon(const char *pathname,
                              unsigned int restorecon_flags);

DESCRIPTION
       selinux_restorecon() restores file default security contexts on filesystems that support extended attributes (see xattr(7)), based on:

              pathname containing a directory or file to be relabeled.
              If  this  is  a directory and the restorecon_flags SELINUX_RESTORECON_RECURSE has been set (for decending through directories), then selinux_restorecon() will write an SHA1 digest of the com‐
              bined specfiles (see the NOTES section for details) to an extended attribute of security.restorecon_last once the relabeling has been completed  successfully.  This  digest  will  be  checked
              should  selinux_restorecon()  be rerun with the restorecon_flags SELINUX_RESTORECON_RECURSE flag set. If any of the specfiles had been updated, the digest will also be updated. However if the
              digest is the same, no relabeling checks will take place (unless the SELINUX_RESTORECON_IGNORE_DIGEST flag is set).

              restorecon_flags contains the labeling option/rules as follows:


                     SELINUX_RESTORECON_IGNORE_DIGEST force the checking of labels even if the stored SHA1 digest matches the specfiles SHA1 digest. The specfiles  digest  will  be  written  to  the  secu‐
                     rity.restorecon_last extended attribute once relabeling has been completed successfully provided the SELINUX_RESTORECON_NOCHANGE flag has not been set.

                     SELINUX_RESTORECON_NOCHANGE don't change any file labels (passive check) or update the digest in the security.restorecon_last extended attribute.

                     SELINUX_RESTORECON_SET_SPECFILE_CTX  If  set, reset the files label to match the default specfile context.  If not set only reset the files "type" component of the context to match the
                     default specfile context.


                     SELINUX_RESTORECON_RECURSE change file and directory labels recursively (descend directories) and if successful write an SHA1 digest of the combined specfiles to an extended  attribute
                     as described in the NOTES section.

                     SELINUX_RESTORECON_VERBOSE log file label changes.
                            Note that if SELINUX_RESTORECON_VERBOSE and SELINUX_RESTORECON_PROGRESS are set, then SELINUX_RESTORECON_PROGRESS will take precedence.

                     SELINUX_RESTORECON_PROGRESS show progress by printing * to stdout every 1000 files.

                     SELINUX_RESTORECON_REALPATH convert passed-in pathname to the canonical pathname using realpath(3).

                     SELINUX_RESTORECON_XDEV prevent descending into directories that have a different device number than the pathname entry from which the descent began.

              The  behavior  regarding  the checking and updating of the SHA1 digest described above is the default behavior. It is possible to change this by first calling selabel_open(3) and not enabling
              the SELABEL_OPT_DIGEST option, then calling selinux_restorecon_set_sehandle(3) to set the handle to be used by selinux_restorecon(3).

              If the pathname is a directory path, then it is possible to set files/directories to be excluded from the path by calling selinux_restorecon_set_exclude_list(3) with a  NULL  terminated  list
              before calling selinux_restorecon(3).

RETURN VALUE
       On success, zero is returned.  On error, -1 is returned and errno is set appropriately.

NOTES
       To  improve  performance  when  relabeling file systems recursively (e.g. the restorecon_flags SELINUX_RESTORECON_RECURSE flag is set) selinux_restorecon() will write an SHA1 digest of the specfiles
       that are processed by selabel_open(3) to an extended attribute named security.restorecon_last to the directory specified in the pathname.

       To check the extended attribute entry use getfattr(1), for example:

              getfattr -e hex -n security.restorecon_last /

       The SHA1 digest is calculated by selabel_open(3) concatenating the specfiles it reads during initialisation with the resulting digest and list of specfiles being retrieved by selabel_digest(3).

       The specfiles consist of the mandatory file_contexts file plus any subs, subs_dist, local and homedir entries (text or binary versions) as determined  by  any  selabel_open(3)  options  e.g.   SELA‐
       BEL_OPT_BASEONLY.

       Should  any  of the specfiles have changed, then when selinux_restorecon() is run again with the SELINUX_RESTORECON_RECURSE flag set, a new SHA1 digest will be calculated and all files will be auto‐
       matically relabeled depending on the settings of the SELINUX_RESTORECON_SET_SPECFILE_CTX flag (provided SELINUX_RESTORECON_NOCHANGE is not set).

       /sys and in-memory filesystems do not support the security.restorecon_last extended attribute and are automatically excluded from any relabeling checks.

       selinux_restorecon() does not check whether mounted filesystems support the seclabel option (i.e. support extended attributes as described in xattr(7)).  To exclude these filesystems from any  rela‐
       beling checks selinux_restorecon_set_exclude_list(3) should be called prior to selinux_restorecon() with a NULL terminated exclude_list of these filesystems.

SEE ALSO
       selinux_restorecon_set_sehandle(3),
       selinux_restorecon_default_handle(3),
       selinux_restorecon_set_exclude_list(3),



Security Enhanced Linux                                                                          20 Oct 2015                                                                            selinux_restorecon(3)
