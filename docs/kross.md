KROSS(1)                                                                                      KDE User's Manual                                                                                      KROSS(1)



NAME
       kross - KDE application to run kross scripts.

SYNOPSIS
       kross [--help] [Generic-options] [Qt-options] [KDE-options] [file ...]

DESCRIPTION
       kross executes kross scripts written in KDE Javascript, Python, Ruby, Java and Falcon.

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
       file...
           The files with the scripts to run.

USAGE
       krossfile runs the script in file after loading the interpreter plugin for the script language (detected by filename suffix).

       To interpret other languages than KDE Javascript, kdebindings must be installed.

SEE ALSO
       kdeoptions(7), qtoptions(7), python(1), ruby(1), kjs(1), java(1), falcon(1)

       Look at http://kross.dipe.org/solution.html for more information and tutorials.

BUGS
       There are probably tons of bugs. Use bugs.kde.org[1] to report them.

AUTHOR
       Sebastian Sauer <mail@dipe.org>
           Author.

NOTES
        1. bugs.kde.org
           http://bugs.kde.org



0.01.01                                                                                           2008-10-22                                                                                         KROSS(1)
