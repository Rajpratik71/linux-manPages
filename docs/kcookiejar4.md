KCOOKIEJAR4(8)                                                                                KDE User's Manual                                                                                KCOOKIEJAR4(8)



NAME
       kcookiejar4 - KDE HTTP cookie daemon

SYNOPSIS
       kcookiejar4 [--help] [Generic-options] [Qt-options] [KDE-options] [--shutdown] [--remove domain] [--remove-all] [--reload-config]

DESCRIPTION
       kcookiejar4 handles the HTTP cookies providing a D-BUS service to store/retrieve/clean cookies.

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
           Show Qt specific options.

       --license
           Show license information.

       -v--version
           Show version information

APPLICATION OPTIONS
       --shutdown
           Shut down cookie jar and the D-BUS service.

       --remove domain
           Removes cookies for domain from the cookie jar.

       --remove-all
           Removes all the cookies from the cookie jar.

       --reaload-config
           Reloads the configuration file.

USAGE
       KDE web browser konqueror uses kcookiejar4 for storing and managing cookies using the D-Bus service kcookiejar4 provides.

       When kcookiejar4 is started without parameters, it provides a D-BUS service to handle HTTP cookies.

       When kcookiejar4 is started with some parameters, it does additional tasks to the cookies jar it provides, like removing the cookies from one domain.

SEE ALSO
       kdeoptions(7), qtoptions(7)

BUGS
       There are probably tons of bugs. Use bugs.kde.org[1] to report them.

AUTHORS
       Waldo Bastian <bastian@kde.org>
           Author.

       Dawit Alemayehu <adawit@kde.org>
           Author.

NOTES
        1. bugs.kde.org
           http://bugs.kde.org



0.01.01                                                                                           2008-10-14                                                                                   KCOOKIEJAR4(8)
