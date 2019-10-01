KDE4-CONFIG(1)                                                                                KDE User's Manual                                                                                KDE4-CONFIG(1)



NAME
       kde4-config - Prints KDE installation paths

SYNOPSIS
       kde4-config [--expandvars] [--prefix] [--exec-prefix] [--libsuffix] [--localprefix] [--version] [--types] [--path type] [--userpath type] [--install type]

DESCRIPTION
       kde4-config is a command line program used to retrieve information about KDE installation or user paths.

       Use this program to determine where the various aspects of the KDE installation reside on your system.

OPTIONS
       --expandvars
           expand ${prefix} and ${exec_prefix} in output

       --prefix
           Compiled in prefix for KDE libraries

       --exec-prefix
           Compiled in exec_prefix for KDE libraries

       --libsuffix
           Compiled in library path suffix

       --localprefix
           Prefix in $HOME used to write files

       --version
           Compiled in version string for KDE libraries

       --types
           Print a list of all available KDE resource types

       --path type
           Search path for the specified type

       --userpath type
           User paths for the types: desktop|autostart|trash|document

       --install type
           Prefix to install resource files to

EXAMPLES
       Print the top-level KDE installation directory:

       % kde4-config --prefix

       Print a list of all resource types:

       % kde4-config --types

       Print the installed wallpaper path:

       % kde4-config --path wallpaper

SEE ALSO
       kdeoptions(7)

BUGS
       None known.

AUTHOR
       Stephan Kulow <coolo@kde.org>
           Author.



K Desktop Environment                                                                             2007-09-28                                                                                   KDE4-CONFIG(1)
