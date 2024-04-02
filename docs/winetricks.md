WINETRICKS(1)                                                  Wine package manager                                                  WINETRICKS(1)

NAME
       winetricks - manage virtual windows environments using wine

SYNOPSIS
       winetricks [options] [verb ... ]

DESCRIPTION
       winetricks is an easy way to work around common problems in Wine.

       It  provides  simple commands to tweak Wine settings, download and install missing Windows DLLs and fonts, or install various games or apps
       with appropriate workarounds for the current version of wine.

       It can be used via gui or commandline.  The commandline mode is intended both for interactive use and as a building block in  fancier  wine
       frontends and in automated regression testing.

       winetricks with no arguments displays a GUI using either Zenity or Kdialog.

OPTIONS
       --force
              Don't check whether packages were already installed

       --gui  Show gui diagnostics even when driven by commandline

       -k, --keep_isos
              Cache isos (allows later installation without disc)

       --no-clean
              Don't delete temp directories (useful during debugging)

       --no-isolate
              Don't install each app or game in its own bottle

       -q, --unattended
              Don't ask any questions, just install automatically

       -r, --ddrescue
              Retry hard when caching scratched discs

       --showbroken
              Even show verbs that are currently broken in wine

       -v, --verbose
              Echo all commands as they are executed

       -h, --help
              Display this message and exit

       -V, --version
              Display version and exit

COMMANDS
       apps list
              list verbs in category 'applications'

       benchmarks list
              list verbs in category 'benchmarks'

       dlls list
              list verbs in category 'dlls'

       games list
              list verbs in category 'games'

       list   list categories

       list-cached
              list cached-and-ready-to-install verbs

       list-download
              list verbs which download automatically

       list-manual-download
              list verbs which download with some help from the user

       list-installed
              list already-installed verbs

       prefix=foobar
              select WINEPREFIX=$HOME/.local/share/wineprefixes/foobar

       settings list
              list verbs in category 'settings'

EXAMPLES
       To see list of available packages to install:
              winetricks list-download

       To install a package:
              winetricks 7zip

ENVIRONMENT VARIABLES
       Wine checks several environment variables on startup:

       WINE   If set, this specifies which wine binary to use by default

       WINEPREFIX
              If set, this specifies the location of the default .wine directory ( usually $HOME/.wine ).

       XDG_CACHE_HOME
              If  set,  this  is  path  to  system's user data cache (default: $HOME/.cache) W_CACHE path to Winetricks' user data cache (default:
              $XDG_CACHE_HOME/winetricks}

AUTHORS
       Dan Kegel, Austin English, and many others.  For a complete list, please see the "Copyright" section in the file 'winetricks'.

COPYRIGHT
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU Library General Public License  as  pub‐
       lished   by   the   Free   Software  Foundation;  either  version  2  of  the  License,  or  (at  your  option)  any  later  version.   See
       <http://www.gnu.org/licenses/>.

BUGS
       Bugs may be reported at http://winetricks.org

AVAILABILITY
       The most recent version of winetricks can be downloaded from http://winetricks.org/download/releases/

       The latest snapshot of the code may be obtained via svn; see http://code.google.com/p/winetricks/source/checkout

       For further information about winetricks see http://winetricks.org

SEE ALSO
       wine(1)

Winetricks 20130615                                                  June 2013                                                       WINETRICKS(1)
