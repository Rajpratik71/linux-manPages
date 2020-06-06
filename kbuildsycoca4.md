KBUILDSYCOCA4(8)                                                                              KDE User's Manual                                                                              KBUILDSYCOCA4(8)



NAME
       kbuildsycoca4 - Rebuilds the system configuration cache.

SYNOPSIS
       kbuildsycoca4 [[--nosignal] | [--noincremental] | [--checkstamps] | [--nocheckfiles] | [--global] | [--menutest] | [--track menu-id] | [--help] | [--help-qt] | [--help-kde] | [--help-all] |
                     [--author] | [-v, --version] | [--license]]

DESCRIPTION
       kbuildsycoca4, as part of the KDE command line tools ensures the proper operation of KDE by reading in all the .desktop, .xml, and .protocol files to construct a binary database.

       KDE itself accesses this database during operation to provide configuration information a program needs to run.

       This tool is part of ksycoca4, which stands for KDE System Configuration Cache

OPTIONS
       --nosignal
           Do not signal applications to update

       --noincremental
           Disable incremental update, re-read everything

       --checkstamps
           Check file timestamps

       --nocheckfiles
           Disable checking files (dangerous)

       --global
           Create global database

       --menutest
           Perform menu generation test run only

       --track menu-id
           Track menu id for debug purposes

       --help
           Show help about options

       --help-qt
           Show Qt specific options

       --help-kde
           Show KDE specific options

       --help-all
           Show all options

       --author
           Show author information

       -v , --version
           Show version information

       --license
           Show license information

USAGE
       A standard way to run this program is by simply specifying the following command at the prompt kbuildsycoca4

FILES
       /var/tmp/kde-$USER/ksycoca4
           The default directory where the cache files are stored.

ENVIRONMENT VARIABLES
       $KDEDIRS
           Specifies which directories are part of the KDE installations

       $KDESYCOCA
           Specifies the path to the sycoca database file

SEE ALSO
       kdeinit4

BUGS
       There are probably tons of bugs. Use bugs.kde.org[1] to report them.

AUTHOR
       Darian Lanx <content@openprojects.net>
           Author.

NOTES
        1. bugs.kde.org
           http://bugs.kde.org



1.1 (KDE 4.4)                                                                                     2010-01-04                                                                                 KBUILDSYCOCA4(8)
