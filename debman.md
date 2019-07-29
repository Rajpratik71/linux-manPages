DEBMAN(1)                                                     General Commands Manual                                                    DEBMAN(1)

NAME
       debman - read man pages from uninstalled packages

SYNOPSIS
       debman -f filename [-- man(1) options] name
       debman -p package [-- man(1) options] name

DESCRIPTION
       debman  extracts  a  Debian  package into a temporary directory and displays manual pages from it.  If the -f option is used, it will use a
       local .deb file; if the -p option is used, it will download the named package using debget.

ENVIRONMENT
       debman intentionally ignores any $MANPATH environment variable that might be set, and constructs its own such that only manual pages within
       the package will be displayed.

AUTHOR
       debman was written by Colin Watson <cjwatson@debian.org>.

SEE ALSO
       debget(1)

                                                                  11 January 2003                                                        DEBMAN(1)
