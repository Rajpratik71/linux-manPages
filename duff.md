DUFF(1)                                                     BSD General Commands Manual                                                    DUFF(1)

NAME
     duff — duplicate file finder

SYNOPSIS
     duff [-0HLPaeqprtz] [-d function] [-f format] [-l limit] [file ...]
     duff [-h]
     duff [-v]

DESCRIPTION
     The duff utility reports clusters of duplicates in the specified files and/or directories.  In the default mode, duff prints a customizable
     header, followed by the names of all the files in the cluster.  In excess mode, duff does not print a header, but instead for each cluster
     prints the names of all but the first of the files it includes.

     If no files are specified as arguments, duff reads file names from stdin.

     Note that as of version 0.4, duff ignores symbolic links to files, as that behavior was conceptually broken.  Therefore, the -H, -L and -P
     options now apply only to directories.

     The following options are available:

     -0      If reading file names from stdin, assume they are null-terminated, instead of separated by newlines.  Also, when printing file names
             and cluster headers, terminate them with null characters instead of newlines.

             This is useful for file names containing whitespace or other non-standard characters.

     -H      Follow symbolic links listed on the command line.  This overrides any previous -L or -P option.  Note that this only applies to
             directories, as symbolic links to files are never followed.

     -L      Follow all symbolic links.  This overrides any previous -H or -P option.  Note that this only applies to directories, as symbolic
             links to files are never followed.

     -P      Don't follow any symbolic links.  This overrides any previous -H or -L option.  This is the default.  Note that this only applies to
             directories, as symbolic links to files are never followed.

     -a      Include hidden files and directories when searching recursively.

     -d function
             The message digest function to use.  The supported functions are sha1, sha256, sha384 and sha512.  The default is sha1.

     -e      Excess mode.  List all but one file from each cluster of duplicates.  Also suppresses output of the cluster header.  This is useful
             when you want to automate removal of duplicate files and don't care which duplicates are removed.

     -f format
             Set the format of the cluster header.  If the header is set to the empty string, no header line is printed.

             The following escape sequences are available:

                 %n      The number of files in the cluster.

                 %c      A legacy synonym for %d, for compatibility reasons.

                 %d      The message digest of files in the cluster.  This may not be combined with -t as no digest is calculated.

                 %i      The one-based index of the file cluster.

                 %s      The size, in bytes, of a file in the cluster.

                 %%      A ‘%’ character.

             The default format string when using -t is:

                   %n files in cluster %i (%s bytes)

             The default format string for other modes is:

                   %n files in cluster %i (%s bytes, digest %d)

     -h      Display help information and exit.

     -l limit
             The minimum size of files to be sampled.  If the size of files in a cluster is equal or greater than the specified limit, duff will
             sample and compare a few bytes from the start of each file before calculating a full digest.  This is stricly an optimization and
             does not affect which files are considered by duff.  The default limit is zero bytes, i.e. to use sampling on all files.

     -q      Quiet mode.  Suppress warnings and error messages.

     -p      Physical mode.  Make duff consider physical files instead of hard links.  If specified, multiple hard links to the same physical file
             will not be reported as duplicates.

     -r      Recursively search into all specified directories.

     -t      Thorough mode.  Distrust digests as a guarantee for equality.  In thorough mode, duff compares files byte by byte when their sizes
             match.

     -v      Display version information and exit.

     -z      Do not consider empty files to be equal.  This option prevents empty files from being reported as duplicates.

EXAMPLES
     The command:
           duff -r foo/

     lists all duplicate files in the directory foo and its subdirectories.

     The command:
           duff -e0 * | xargs -0 rm

     removes all duplicate files in the current directory.  Note that you have no control over which files in each cluster that are selected by -e
     (excess mode).  Use with care.

     The command:
           find . -name '*.h' -type f | duff

     lists all duplicate header files in the current directory and its subdirectories.

     The command:
           find . -name '*.h' -type f -print0 | duff -0 | xargs -0 -n1 echo

     lists all duplicate header files in the current directory and its subdirectories, correctly handling file names containing whitespace.  Note
     the use of xargs and echo to remove the null separators again before listing.

DIAGNOSTICS
     The duff utility exits 0 on success, and >0 if an error occurs.

SEE ALSO
     find(1), xargs(1)

AUTHORS
     Camilla Berglund <elmindreda@elmindreda.org>

BUGS
     duff doesn't check whether the same file has been specified twice on the command line.  This will lead it to report files listed multiple
     times as duplicates when not using -p (physical mode).  Note that this problem only affects files, not directories.

     duff no longer (as of version 0.4) reports symbolic links to files as duplicates, as they're by definition always duplicates.  This may break
     scripts relying on the previous behavior.

     If the underlying files are modified while duff is running, all bets are off.  This is not really a bug, but it can still bite you.

BSD                                                              January 18, 2012                                                              BSD
