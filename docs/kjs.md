KJS(1)                                                                                        KDE User's Manual                                                                                        KJS(1)



NAME
       kjs - KDE ECMAScript compatible interpreter

SYNOPSIS
       kjs [[--help] | [-help] | [-h]] [[-e statement]] [script]

DESCRIPTION
       kjs is KDE ECMAScript/JavaScript engine.

APPLICATION OPTIONS
       --help,-help,-h
           Show kjscmd usage.

       -e statement
           Executes the statement and exits. For example:

               kjs -e "print('hello world')"

       script
           Executes the statements included in file script.

USAGE
       kjsfile, as many other interpreters, when called without parameters uses a line editor to enter statements, showing the prompt

           JS>

       To exit the line editor type quit() or press Ctrl+D.

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



0.01.01                                                                                           2008-10-15                                                                                           KJS(1)
