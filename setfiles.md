setfiles(8)                                                                                                                                                                                       setfiles(8)



NAME
       setfiles - set SELinux file security contexts.


SYNOPSIS
       setfiles [-c policy] [-d] [-l] [-n] [-e directory] [-o filename] [-p] [-q] [-s] [-v] [-W] [-F] spec_file pathname...

DESCRIPTION
       This manual page describes the setfiles program.

       This  program  is  primarily  used  to initialize the security context fields (extended attributes) on one or more filesystems (or parts of them).  Usually it is initially run as part of the SELinux
       installation process (a step commonly known as labeling).

       It can also be run at any other time to correct inconsistent labels, to add support for newly-installed policy or, by using the -n option, to passively check whether the file contexts are all set as
       specified by the active policy (default behavior) or by some other policy (see the -c option).

       If a file object does not have a context, setfiles will write the default context to the file object's extended attributes. If a file object has a context, setfiles will only modify the type portion
       of the security context.  The -F option will force a replacement of the entire context.

OPTIONS
       -c     check the validity of the contexts against the specified binary policy.

       -d     show what specification matched each file (do not abort validation after 10 errors). Not affected by "-q"

       -e directory
              directory to exclude (repeat option for more than one directory).

       -f     take a list of files to be processed from an input file.

       -F     Force reset of context to match file_context for customizable files, and the default file context, changing the user, role, range portion as well as the type.

       -h, -? display usage information and exit.

       -i     ignore files that do not exist.

       -l     log changes in file labels to syslog.

       -n     don't change any file labels (passive check).

       -o filename
              Deprecated, SELinux policy will probably block this access.  Use shell redirection to save list of files with incorrect context in filename.

       -p     show progress by printing * every 1024 files.  (If you relabel the entire OS, this will show you the percentage complete.)

       -q     suppress non-error output.

       -r rootpath
              use an alternate root path.

       -s     take a list of files from standard input instead of using a pathname from the command line (equivalent to -f -).

       -v     show changes in file labels.

       -W     display warnings about entries that had no matching files.

       -0     the separator for the input items is assumed to be the null character (instead of the white space).  The quotes and the backslash characters are also treated as  normal  characters  that  can
              form valid input.  This option finally also disables the end of file string, which is treated like any other argument.  Useful when input items might contain white space, quote marks or back‐
              slashes.  The -print0 option of GNU find produces input suitable for this mode.


ARGUMENTS
       spec_file The specification file which contains lines of the following form
       regexp [ -type ] ( context | <<none>> )
       The regular expression is anchored at both ends.  The optional type field specifies the file type as shown in the mode field by the ls(1) program, e.g. -- to match only regular files or -d to  match
       only directories.  The context can be an ordinary security context or the string <<none>> to specify that the file is not to have its context changed.
       The  last matching specification is used. If there are multiple hard links to a file that match different specifications and those specifications indicate different security contexts, then a warning
       is displayed but the file is still labeled based on the last matching specification other than <<none>>.

       pathname...
              The pathname for the root directory of each file system to be relabeled or a specific directory within a filesystem that should be recursively descended and relabeled or  the  pathname  of  a
              file that should be relabeled.  Not used if the -f or the -s option is used.


AUTHOR
       This man page was written by Russell Coker <russell@coker.com.au>.  The program was written by Stephen Smalley <sds@epoch.ncsc.mil>


SEE ALSO
       restorecon(8), load_policy(8), checkpolicy(8)



                                                                                                  2002031409                                                                                      setfiles(8)
