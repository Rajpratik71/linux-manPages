ADD-SHELL(8)                            System Manager's Manual                           ADD-SHELL(8)

NAME
       add-shell - add shells to the list of valid login shells

SYNOPSIS
       add-shell shellname [shellname...]

DESCRIPTION
       add-shell copies /etc/shells to /etc/shells.tmp, adds the given shells to this file if they are
       not already present, and copies this temporary file back to /etc/shells.

       The shells must be provided by their full pathnames.

SEE ALSO
       shells(5)

                                              12 May 2011                                 ADD-SHELL(8)
