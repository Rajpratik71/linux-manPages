NEPOMUKSERVICESTU(8)                                                                          KDE User's Manual                                                                          NEPOMUKSERVICESTU(8)



NAME
       nepomukservicestub - KDE wrapper around Nepomuk service plugins.

SYNOPSIS
       nepomukservicestub [--help] [Generic options] [Qt(TM)-options] [KDE-options] {servicename}

DESCRIPTION
       nepomukservicestub runs a Nepomuk service plugin in its own process.

       It is used by nepomukserver to run all configured Nepomuk services.

GENERIC OPTIONS
       --author
           Show author information.

       --help
           Show help about options.

       --help-all
           Show all options.

       --help-kde
           Show KDE specific options.

       --help-qt
           Show Qt(TM) specific options.

       --license
           Show license information.

       -v --version
           Show version information

APPLICATION OPTIONS
       servicename
           The name of the service plugin to run

SEE ALSO
       nepomukserver(8)

BUGS
       There are probably tons of bugs. Use bugs.kde.org[1] to report them.

AUTHOR
       Sebastian Trueg <trueg@kde.org>
           Author.

NOTES
        1. bugs.kde.org
           http://bugs.kde.org



0.01.01                                                                                           2009-04-28                                                                             NEPOMUKSERVICESTU(8)
