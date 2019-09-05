LINUX-VERSION(1)                                                                        General Commands Manual                                                                       LINUX-VERSION(1)

NAME
       linux-version - operate on Linux kernel version strings

SYNOPSIS
       linux-version compare VERSION1 OP VERSION2

       linux-version sort [--reverse] [VERSION1 VERSION2 ...]

       linux-version list [--paths]

DESCRIPTION
       linux-version operates on Linux kernel version strings as reported by uname -r and used in file and directory names.  These version strings do not follow the same rules as Debian package ver‐
       sion strings and should not be compared as such or as arbitrary strings.

       compare VERSION1 OP VERSION2
              Compare version strings, where OP is a binary operator. linux-version returns success (zero result) if the specified condition is satisfied, and  failure  (nonzero  result)  otherwise.
              The valid operators are: lt le eq ne ge gt

       sort [--reverse] [VERSION1 VERSION2 ...]
              Sort the given version strings and print them in order from lowest to highest.  If the --reverse option is used, print them in order from highest to lowest.

              If  no  version strings are given as arguments, the version strings will instead be read from standard input, one per line.  They may be suffixed by arbitrary text after a space, which
              will be included in the output.  This means that, for example:

              linux-version list --paths | linux-version sort --reverse

              will list the installed versions and corresponding paths in order from highest to lowest version.

       list [--paths]
              List kernel versions installed in the customary location.  If the --paths option, show the corresponding path for each version.

AUTHOR
       linux-version and this manual page were written by Ben Hutchings as part of the Debian linux-base package.

                                                                                             30 March 2011                                                                            LINUX-VERSION(1)
