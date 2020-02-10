LIST-UNRELEASED(1)                                                                       General Commands Manual                                                                       LIST-UNRELEASED(1)

NAME
       list-unreleased - display UNRELEASED packages

SYNOPSIS
       list-unreleased [arg ...] [path ...]

DESCRIPTION
       Searches for packages whose changelogs indicate there are pending changes (UNRELEASED) and either lists them or displays the relevant changelog entry.

       By default it searches for packages under the current directory. If a path is specified it will look for packages under that directory instead.

OPTIONS
       -c     Display pending changes.

       -R     Don't recurse into subdirectories looking for packages.

SEE ALSO
       debchange(1)

AUTHOR
       list-unreleased was written by Frans Pop <elendil@planet.nl>.  This manual page was written by Joey Hess <joeyh@debian.org>.

DEBIAN                                                                                       Debian Utilities                                                                          LIST-UNRELEASED(1)
