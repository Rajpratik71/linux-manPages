DEP3CHANGELOG(1)                                                                         General Commands Manual                                                                         DEP3CHANGELOG(1)

NAME
       dep3changelog - generate a changelog entry from a DEP3-style patch header

SYNOPSIS
       dep3changelog patch [patch ...] [options] [-- [dch_options]]

DESCRIPTION
       dep3changelog  extracts the DEP3 patch headers from the given patch files and builds a changelog entry for each patch.  If the patch author differs from the one detected from the DEBEMAIL, NAME,
       DEBEMAIL, or EMAIL environment variables, “Thanks to author <email>” is added to the changelog entry for that patch.  Any bug-debian or bug-ubuntu fields are added as “Closes” to  the  changelog
       entry.  The generated changelog entries are passed to debchange as an argument along with the given dch_options.

OPTIONS
       --help, -h
              Display a help message and exit successfully.

       --version
              Display version and copyright information and exit successfully.

ENVIRONMENT
       DEBEMAIL, EMAIL, DEBFULLNAME, NAME
              See the above description of the use of these environment variables.

AUTHOR
       Steve Langasek <vorlon@debian.org>

SEE ALSO
       debchange(1)

DEBIAN                                                                                       Debian Utilities                                                                            DEP3CHANGELOG(1)
