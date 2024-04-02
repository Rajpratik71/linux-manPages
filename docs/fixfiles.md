fixfiles(8)                                                                                                                                                                                       fixfiles(8)



NAME
       fixfiles - fix file SELinux security contexts.


SYNOPSIS
       fixfiles [-v] [-F] [-B] [ -N time ] [-l logfile ] { check | restore|[-f] relabel | verify } [[dir/file] ... ]

       fixfiles [-v] [-F] [ -R rpmpackagename[,rpmpackagename...] ] [-l logfile ] { check | restore | verify }

       fixfiles [-v] [-F] -C PREVIOUS_FILECONTEXT [-l logfile ] { check | restore | verify }

       fixfiles [-F] [-B] onboot


DESCRIPTION
       This manual page describes the fixfiles script.

       This script is primarily used to correct the security context database (extended attributes) on filesystems.

       It  can also be run at any time to relabel when adding support for new policy, or  just check whether the file contexts are all as you expect.  By default it will relabel all mounted ext2, ext3, xfs
       and jfs file systems as long as they do not have a security context mount option.  You can use the -R flag to use rpmpackages as an alternative.  The file /etc/selinux/fixfiles_exclude_dirs can con‐
       tain a list of directories excluded from relabeling.

       fixfiles onboot will setup the machine to relabel on the next reboot.


OPTIONS
       -B     If  specified with onboot, this fixfiles will record the current date in the /.autorelabel file, so that it can be used later to speed up labeling. If used with restore, the restore will only
              affect files that were modified today.

       -l logfile
              Save the output to the specified logfile

       -F     Force reset of context to match file_context for customizable files


       -f     Clear /tmp directory with out prompt for removal.


       -R rpmpackagename[,rpmpackagename...]
              Use the rpm database to discover all files within the specified packages and restore the file contexts.  (-a will get all files in the RPM database).

       -C PREVIOUS_FILECONTEXT
              Run a diff on  the PREVIOUS_FILECONTEXT file to the currently installed one, and restore the context of all affected files.


       -N time
              Only act on files created after the specified date.  Date must be specified in "YYYY-MM-DD HH:MM" format.  Date field will be passed to find --newermt command.


       -v     Modify verbosity from progress to verbose. (Run restorecon with -v instead of -p)


ARGUMENTS
       One of:

       check  print any incorrect file context labels, showing old and new context, but do not change them.

       restore
              change any incorrect file context labels.

       relabel
              Prompt for removal of contents of /tmp directory and then change any incorrect file context labels to match the install file_contexts file.

       verify List out files with incorrect file context labels, but do not change them.

       [[dir/file] ... ]
              List of files or directories trees that you wish to check file context on.


AUTHOR
       This man page was written by Richard Hally <rhally@mindspring.com>.  The script  was written by Dan Walsh <dwalsh@redhat.com>


SEE ALSO
       setfiles(8),restorecon(8)




                                                                                                  2002031409                                                                                      fixfiles(8)
