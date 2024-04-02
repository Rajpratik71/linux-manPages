restorecon(8)                                                                                                                                                                                   restorecon(8)



NAME
       restorecon - restore file(s) default SELinux security contexts.


SYNOPSIS
       restorecon [-R] [-n] [-p] [-v] [-e directory] pathname...

       restorecon -f infilename [-e directory] [-R] [-n] [-p] [-v] [-F]


DESCRIPTION
       This manual page describes the restorecon program.

       This program is primarily used to set the security context (extended attributes) on one or more files.

       It can also be run at any other time to correct inconsistent labels, to add support for newly-installed policy or, by using the -n option, to passively check whether the file contexts are all set as
       specified by the active policy (default behavior).

       If a file object does not have a context, restorecon will write the default context to the file object's extended attributes. If a file object has a context, restorecon will  only  modify  the  type
       portion of the security context.  The -F option will force a replacement of the entire context.

       If a file is labeled with customizable SELinux type (for list of customizable types see /etc/selinux/{SELINUXTYPE}/contexts/customizable_types), restorecon won't reset the label unless the -F option
       is used.

       It is the same executable as setfiles but operates in a slightly different manner depending on its argv[0].


OPTIONS
       -e directory
              exclude a directory (repeat the option to exclude more than one directory, Requires full path).

       -f infilename
              infilename contains a list of files to be processed. Use - for stdin.

       -F     Force reset of context to match file_context for customizable files, and the default file context, changing the user, role, range portion as well as the type.

       -h, -? display usage information and exit.

       -i     ignore files that do not exist.

       -n     don't change any file labels (passive check).  To display the files whose labels would be changed, add -v.

       -o outfilename
              Deprecated, SELinux policy will probably block this access.  Use shell redirection to save list of files with incorrect context in filename.

       -p     show progress by printing * every 1024 files.  (If you relabel the entire OS, this will show you the percentage complete.)

       -R, -r change files and directories file labels recursively (descend directories).
              Note: restorecon reports warnings on paths without default labels only if called non-recursively or in verbose mode.

       -v     show changes in file labels, if type or role are going to be changed. Multiple -v options increase the verbosity. Note that the -v and -p options are mutually exclusive.

       -0     the separator for the input items is assumed to be the null character (instead of the white space).  The quotes and the backslash characters are also treated as  normal  characters  that  can
              form valid input.  This option finally also disables the end of file string, which is treated like any other argument.  Useful when input items might contain white space, quote marks or back‐
              slashes.  The -print0 option of GNU find produces input suitable for this mode.


       ARGUMENTS
              pathname...  The pathname for the file(s) to be relabeled.

NOTE
       restorecon does not follow symbolic links and by default it does not operate recursively on directories.


AUTHOR
       This man page was written by Dan Walsh <dwalsh@redhat.com>.  Some of the content of this man page was taken from the setfiles man page written by Russell Coker <russell@coker.com.au>.   The  program
       was written by Dan Walsh <dwalsh@redhat.com>.


SEE ALSO
       setfiles(8), load_policy(8), checkpolicy(8), customizable_types(5)



                                                                                                  2002031409                                                                                    restorecon(8)
