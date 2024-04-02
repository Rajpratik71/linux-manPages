KJSCMD(1)                                                                                     KDE User's Manual                                                                                     KJSCMD(1)



NAME
       kjscmd - KDE KJSEmbed interpreter

SYNOPSIS
       kjscmd [--help] [[-e] | [--exec]] [[-i] | [-interactive]] [[-n] | [-no-kde]] [file]

DESCRIPTION
       kjscmd is a tool for launching KJSEmbed scripts from the command line. It will run the scripts contained in the named file using KJSEmbed. It does not accept - (stdin) as a file.

APPLICATION OPTIONS
       -e,--exec
           execute script in file without gui support.

       -i,--interactive
           start interactive kjs interpreter.

       -n,--no-kde
           start without KDE KApplication support.

USAGE
       The most common way to run kjscmd is simply as

           kjscmd file

       If no parameter file is used, it executes a predefined test script that measures the start speed of kjscmd.

SEE ALSO
       kjs(1)

BUGS
       There are probably tons of bugs. Use bugs.kde.org[1] to report them.

AUTHOR
       Harri Porten <porten@kde.org>
           Author.

NOTES
        1. bugs.kde.org
           http://bugs.kde.org



0.01.01                                                                                           2008-10-16                                                                                        KJSCMD(1)
