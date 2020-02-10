WNPP-CHECK(1)                                                                            General Commands Manual                                                                            WNPP-CHECK(1)

NAME
       wnpp-check - check if a package is being packaged or if this has been requested

SYNOPSIS
       wnpp-check [--exact] package ...
       wnpp-check --help|--version

DESCRIPTION
       wnpp-check  downloads  the lists of packages which are listed as being packaged (ITPed) or for which a package has been requested (RFPed) from the WNPP website and lists any packages supplied on
       the command line which appear in those lists.

       Note that WNPP, and therefore wnpp-check's output, is source package based.

OPTIONS
       --help, -h
              Show a summary of options.

       --version, -v
              Show version and copyright information.

       --exact, -e
              Require an exact package name match, rather than the default substring match.

SEE ALSO
       https://www.debian.org/devel/wnpp

EXIT STATUS
       0      None of the packages supplied has an open ITP or RFP

       1      Either an error occurred or at least one package supplied has an open ITP or RFP

AUTHOR
       wnpp-check was written by David Paleino <d.paleino@gmail.com>; this man page was written by Adam D. Barratt <adam@adam-barratt.org.uk> for the  devscripts  package.   wnpp-check  was  originally
       based on wnpp-alert, which was written by Arthur Korn <arthur@korn.ch> and modified by Julian Gilbey <jdg@debian.org> for the devscripts package.  Both scripts are in the public domain.

DEBIAN                                                                                       Debian Utilities                                                                               WNPP-CHECK(1)
