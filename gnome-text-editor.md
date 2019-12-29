GEDIT(1)                                General Commands Manual                               GEDIT(1)

NAME
       gedit - text editor for the GNOME Desktop

SYNOPSIS
       gedit [OPTION...] [FILE...] [+LINE[:COLUMN]]
       gedit [OPTION...] -

DESCRIPTION
       gedit is the official text editor of the GNOME desktop environment.

       While  aiming  at  simplicity and ease of use, gedit is a powerful general purpose text editor.
       It can be used to create and edit all kinds of text files.

       gedit features a flexible plugin system which can be used to dynamically add new advanced  fea‐
       tures to gedit itself.

OPTIONS
       --encoding
              Set the character encoding to be used for opening the files listed on the command line.

       --list-encodings
              Display list of possible values for the encoding option and exit.

       --new-window
              Create a new toplevel window in an existing instance of gedit.

       --new-document
              Create a new document in an existing instance of gedit.

       -s, --standalone
              Run gedit in standalone mode.

       -w, --wait
              Open files and block the gedit process.

       --help Prints the command line options.

       --version
              Output version information and exit.

       FILE   Specifies  the file to open when gedit starts. If this is not specified, gedit will load
              a blank file with an "Unsaved Document" label. Multiple files can be loaded if they  are
              separated by spaces.  gedit also supports handling of remote files. For example, you can
              pass the location of a webpage to gedit , like "http://www.gnome.org", or  load  a  file
              from a FTP server, like "ftp://ftp.gnome.org/robots.txt".

       -      gedit will read from stdin

       +LINE  For  the first file, go to the line specified by LINE (do not insert a space between the
              "+" sign and the number).  If LINE is missing, go to the last line.

       COLUMN For the first file, go to the column specified by COLUMN.  If COLUMN is missing,  go  to
              the first column.

BUGS
       If    you    find    a    bug,   please   report   it   at   the   GNOME   bug   tracker.   See
       https://wiki.gnome.org/Apps/Gedit/ReportingBugs.

AUTHORS
       Paolo Maggi (paolo@gnome.org)

       Paolo Borelli (pborelli@gnome.org)

       Steve Frécinaux (code@istique.net)

       Jesse van den Kieboom (jessevdk@gnome.org)

       Ignacio Casal Quinteiro <icq@gnome.org>

       James Willcox (jwillcox@gnome.org)

       Federico Mena Quintero (federico@novell.com)

       Chema Celorio

                                              17 May 2010                                     GEDIT(1)
