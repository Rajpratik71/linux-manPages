leafpad(1)                                                          2016-08-09                                                          leafpad(1)

NAME
       leafpad - GTK+ based simple text editor

DESCRIPTION
       leafpad is a simple GTK+ based text editor. The user interface is similar to Windows(tm) notepad. It aims to be lighter than GEdit and
       KWrite and to be as useful as them.

       WARNING: The encoding feature is derived from built-in Glib's iconv feature (g_convert), which you can check with command "iconv -l".
       Leafpad can use only the listed encoding. Any other encoding cause serious data loss.

SYNOPSIS
         leafpad [options] [filename]

OPTIONS
       --codeset=CODESET
           Set codeset to open file.

       --display=DISPLAY
           X display to use.

       --help
           Dispaly the command line options.

       --screen=SCREEN
           X screen to use.

       --sync
           Make X calls synchronous.

       --tab-width=WIDTH
           Set tab width.

       --version
           Display version number.

ENVIRONMENT
       None.

FILES
       None.

SEE ALSO
       gedit(1) kwrite(1)

AUTHORS
       Program was written by Tarot Osuji <tarot@sdf.lonestar.org>.

       This manual page was written by Carlos Z.F. Liu <carlosliu@users.sourceforge.net> for the Debian GNU system (but may be used by others).
       Updated by Jari Aalto <jari.aalto@cante.net>.

       Released under license GNU GPL v2 or (at your option) any later version. For more information about license, visit
       <http://www.gnu.org/copyleft/gpl.html>.

leafpad                                                             2016-08-09                                                          leafpad(1)
